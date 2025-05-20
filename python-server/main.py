
import json
import os
import cv2
import numpy as np
from flask import Flask, request, jsonify
from ultralytics import YOLO

CALIBRATION_FILE = "calibration.json"

def save_calibration(pixel_volume, real_volume):
    ratio = real_volume / pixel_volume
    with open(CALIBRATION_FILE, "w") as f:
        json.dump({"ratio": ratio}, f)
    print(f"✔ יחס המרה נשמר לקובץ: {ratio:.5f}")

# פונקציה לטעינת יחס ההמרה מקובץ
def load_calibration():
    if os.path.exists(CALIBRATION_FILE):
        with open(CALIBRATION_FILE, "r") as f:
            data = json.load(f)
            ratio = data.get("ratio", None)
            return ratio
    return None

# טוען את מודל YOLO
model = YOLO("yolov8n.pt")

# פונקציה לחישוב מפת עומק
def compute_depth_map(img1, img2):
    gray1 = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
    gray2 = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)

    stereo = cv2.StereoBM_create(numDisparities=16, blockSize=15)
    depth_map = stereo.compute(gray1, gray2)

    depth_map = cv2.normalize(depth_map, None, 0, 255, cv2.NORM_MINMAX)
    depth_map = np.uint8(depth_map)

    return depth_map

# פונקציה לחישוב נפח לכל אובייקט בנפרד
def compute_object_volumes(depth_map, results):
    object_volumes = []

    for result in results:
        if result.boxes is None:
            continue

        for box in result.boxes:
            x1, y1, x2, y2 = map(int, box.xyxy[0])
            label = result.names[int(box.cls[0])]

            object_depth = depth_map[y1:y2, x1:x2]
            avg_depth = np.mean(object_depth) if object_depth.size > 0 else 0

            area_pixels = (x2 - x1) * (y2 - y1)
            volume_pixels = area_pixels * avg_depth

            object_volumes.append({"label": label, "volume_pixels": volume_pixels, "bbox": (x1, y1, x2, y2)})


    return object_volumes

# API
app = Flask(__name__)

@app.route('/analyze-images', methods=['POST'])
def analyze_images():


    if 'image1' not in request.files or 'image2' not in request.files:
        return jsonify({'error': 'שתי תמונות חייבות להישלח'}), 400

    image1 = request.files['image1']
    image2 = request.files['image2']


    try:
        img1_data = image1.read()
        img2_data = image2.read()


        img1 = np.frombuffer(img1_data, np.uint8)
        img2 = np.frombuffer(img2_data, np.uint8)

        img1 = cv2.imdecode(img1, cv2.IMREAD_COLOR)
        img2 = cv2.imdecode(img2, cv2.IMREAD_COLOR)

        if img1 is None or img2 is None:
            return jsonify({'error': 'שגיאה בקריאת התמונות'}), 400
        else:
            print("✔ התמונות הומרו בהצלחה ל־NumPy arrays")
    except Exception as e:
        print("❌ שגיאה בקריאת התמונות:", str(e))
        return jsonify({'error': 'שגיאה בקריאת התמונות'}), 400

    results = model(img1)
    total_boxes = sum(len(r.boxes) if r.boxes else 0 for r in results)
    print(f"✔ YOLO זיהה {total_boxes} אובייקטים")

    depth_map = compute_depth_map(img1, img2)

    object_volumes = compute_object_volumes(depth_map, results)

    ratio = load_calibration()

    if ratio is None:
        print("⚠ יחס המרה לא קיים. נדרשת קליברציה ידנית.")
        known_object = input("הזן שם של אובייקט ידוע (כפי שמופיע בזיהוי): ").strip()
        known_objects = [obj for obj in object_volumes if obj["label"] == known_object]

        if known_objects:
            real_volume = float(input(f"הזן נפח אמיתי של {known_object} בסמ״ק: "))
            pixel_volume = np.mean([obj["volume_pixels"] for obj in known_objects])
            save_calibration(pixel_volume, real_volume)
            ratio = real_volume / pixel_volume
        else:
            print("❌ האובייקט שהוזן לא נמצא בזיהוי!")
            return jsonify({"error": "האובייקט לא נמצא בזיהוי!"}), 404

    object_volumes_cm3 = []
    for obj in object_volumes:
        obj["volume_cm3"] = obj["volume_pixels"] * ratio
        object_volumes_cm3.append(obj)
    for obj in object_volumes_cm3:
        print(f" - {obj['label']} | {obj['volume_cm3']:.2f} סמ״ק | bbox={obj['bbox']}")

    result = []
    for obj in object_volumes_cm3:
        result.append({
            'label': obj['label'],
            'volume_cm3': obj['volume_cm3']
            # 'bbox': obj['bbox']
        })

    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=5000)

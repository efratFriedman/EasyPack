**Easypack**



**🧳 What is Easypack?**

**Easypack** is a smart packing assistant built to help users pack efficiently when moving apartments. It uses a powerful algorithm and image analysis to optimize how belongings should be packed into boxes — reducing stress and saving time.

**🚀 Features**

**✅ Smart Room Analysis** – Upload a room image and let the system detect, measure, and categorize items.

**✅ Bin Packing Algorithm**– Calculates the minimum number of boxes needed based on object volume.

**✅ PDF Export** – Users receive a detailed box-packing list they can export to PDF.

**✅ Authentication with Validation** – Full login/signup process with robust field validation.

**🧠 How It Works**

User logs in or signs up (with full form validation).


![homepage1](https://github.com/user-attachments/assets/32efdf7b-8eb7-4689-b663-42ee68bc63c5)


The user selects a room type, names it, and uploads a photo.





Image is sent to a Python-based object detection server.

The image is analyzed

Items are detected, their dimensions are estimated, and tagged



Object volume data is processed with a Bin Packing Algorithm to determine the optimal number of boxes.



The user sees the packing suggestion with box-by-box contents and can export the list to PDF.

🧰 Technologies Used

🖥 Frontend

Angular

HTML/CSS

TypeScript

🧪 Backend

C# (ASP.NET Core Web API)

🤖 Image Processing

Python server (object detection, volume calculation)

📦 Algorithm

Custom implementation of the Bin Packing Algorithm

📄 Installation & Running Locally

1. Clone the Repository

git clone https://github.com/yourusername/easypack.git
cd easypack

2. Frontend (Angular)

cd Easypack-Frontend
npm install
ng serve

3. Backend (C# API)

Open in Visual Studio or run:

cd Easypack-Backend
 dotnet build
 dotnet run

4. Python Image Server

cd Easypack-ImageAnalyzer
pip install -r requirements.txt
python app.py

Make sure all services are running concurrently.

✨ What Makes Easypack Special?

Real image upload and intelligent object recognition

Practical use of computer vision and logistics algorithms

Full-stack integration with Angular, C#, and Python

Exportable, structured results to help with physical moving

📬 Contact

Feel free to reach out for any questions or collaboration opportunities!

Easypack – Packing made smart.



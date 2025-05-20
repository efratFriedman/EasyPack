**Easypack**



**🧳 What is Easypack?**

**Easypack** is a smart packing assistant built to help users pack efficiently when moving apartments. It uses a powerful algorithm and image analysis to optimize how belongings should be packed into boxes — reducing stress and saving time.

**🚀 Features**

**✅ Smart Room Analysis** – Upload a room image and let the system detect, measure, and categorize items.

**✅ Bin Packing Algorithm**– Calculates the minimum number of boxes needed based on object volume.

**✅ PDF Export** – Users receive a detailed box-packing list they can export to PDF.

**✅ Authentication with Validation** – Full login/signup process with robust field validation.

**🧠 How It Works**



![homepage1](https://github.com/user-attachments/assets/32efdf7b-8eb7-4689-b663-42ee68bc63c5)
![homepage2](https://github.com/user-attachments/assets/9f50245e-b9bd-4659-b2d8-b53fdbd6c0b7)

**User logs in or signs up (with full form validation).**

![login](https://github.com/user-attachments/assets/41275726-0370-41f9-a8f0-93f36c9627e8)
![signup](https://github.com/user-attachments/assets/7694217c-05c6-42fe-8d26-768ba3bb9c2c)


**The user selects a room type, names it, and uploads a photo.**


![pickroom1](https://github.com/user-attachments/assets/e3e356e3-d102-4f0c-8313-cb95393cf696)
![pickroom2](https://github.com/user-attachments/assets/5dd149fc-657b-447f-bd2b-bebc7147e84a)
![nameroome](https://github.com/user-attachments/assets/53c49bd0-2f7d-4627-88af-fae53c469c5e)
![uploadimage](https://github.com/user-attachments/assets/ee4afdb2-0452-4d64-97cf-0f5f91cb1d10)



**Image is sent to a Python-based object detection server.**


![afterupload](https://github.com/user-attachments/assets/fe6939ff-7652-4846-9e9a-7a48b3d151d0)


**The image is analyzed**


![analyze](https://github.com/user-attachments/assets/fe400308-d817-4b51-8891-3286f090f8ad)

**Items are detected, their dimensions are estimated, and tagged
Object volume data is processed with a Bin Packing Algorithm to determine the optimal number of boxes.
for example:**


![output](https://github.com/user-attachments/assets/bda31fc4-7ea4-493f-b204-45f03efcd158)

**The user sees the packing suggestion with box-by-box contents and can export the list to PDF.**


![result](https://github.com/user-attachments/assets/39d236e2-9b87-475f-be60-e165043293b8)


**🧰 Technologies Used**

**🖥 Frontend**

*Angular

*HTML/CSS

*TypeScript

**🧪 Backend**

*C# (ASP.NET Core Web API)

*🤖 Image Processing

*Python server (object detection, volume calculation)

**📦 Algorithm**

*Custom implementation of the **Bin Packing Algorithm**

**📄 Installation & Running Locally**

**1.** Clone the Repository

git clone https://github.com/yourusername/easypack.git
cd easypack

**2.** Frontend (Angular)

cd Easypack-Frontend
npm install
ng serve

**3.** Backend (C# API)

Open in Visual Studio or run:

cd Easypack-Backend
 dotnet build
 dotnet run

**4.** Python Image Server

cd Easypack-ImageAnalyzer
pip install -r requirements.txt
python app.py

Make sure all services are running concurrently.

**✨ What Makes Easypack Special?**

*Real image upload and intelligent object recognition

*Practical use of computer vision and logistics algorithms

*Full-stack integration with Angular, C#, and Python

*Exportable, structured results to help with physical moving

**📬 Contact**

Feel free to reach out for any questions or collaboration opportunities!

**Easypack – Packing made smart.**



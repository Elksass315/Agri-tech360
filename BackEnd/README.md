<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://github.com/shadymohamed532001/SmartSoil/assets/126605393/ab959f5b-b246-4af1-ac7f-4422b0ea48d9" alt="Logo" width="300" height="200">
  </a>  
  
# 👋 Welcome! Agri-tech360 BackEnd
</div>

<span>Backend technologies play a crucial role in the creation of everyday software projects. To ensure the success of our project, it is essential to choose the appropriate back-end technology.
Indeed, well-chosen backend technology may ensure scalability, quickness, and instantaneous consumer needs and query responses. However, choosing the right technology might be difficult.</span>

## Flask
We use Flask is an open-source, beginner-friendly Python framework suitable for building monolithic and microservice  backend applications with a lightweight codebase. In the Machine and Deep Learning scenario, Flask comes to the most important part while deploying models on the web page.
## Model-View-Controller (MVC)
MVC (Model-View-Controller) is a widely used architectural pattern for structuring web applications. It separates the application logic into three distinct parts, promoting code maintainability, reusability, and testability.


## Requirements

Python 3.8–3.11

## Run Server

add your .env file with this data:

    $ HOST = .....
    $ PORT = ....
    $ SECRET_KEY = ....
    $ OPEN_WEATHER_API_KEY = ....
    $ PLANT_ID_API_KEY = ....
    $ PLANT_API_KEY = ....
    $ GEMINI_API_KEY = ....

Then, Create venv and activate it:

### For Windows:
    $ python -m venv env
    $ source env/bin/activate

### For Mac or Linux:
    $ python3 -m venv env
    $ source env/bin/activate

After, install all necessary to run:

### For Windows:
    $ pip install -r requirements.txt
    
### For Mac or Linux:
    $ pip3 install -r requirements.txt

Than, run the application:

### For Windows:
    $ python app.py

### For Mac or Linux:
    $ python3 app.py


To see your application, access this url in your browser:

    http://{HOST}:{PORT}

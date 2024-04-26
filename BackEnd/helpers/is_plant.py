import requests
import os
from dotenv import load_dotenv

load_dotenv()


def is_plant(photo):
    '''Function to check if the image is a plant or not'''
    try:
        url = "https://plant.id/api/v3/identification?language=en"
        files = {'image': open(photo, 'rb')}
        response = requests.post(url, files=files, headers={'Api-Key': os.getenv('PLANT_ID_API_KEY')})
        data = response.json()
        if response.status_code == 201:
            return data['result']["is_plant"]["binary"]
        else:
            return False
    except Exception as e:
        return False

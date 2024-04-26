from flask import jsonify
from models.user import get_user_by_email
import os
from dotenv import load_dotenv
import requests

load_dotenv()


def get_weather(email):
    '''Function to get weather data for the city of the user'''
    try:
        api_key = os.getenv('OPEN_WEATHER_API_KEY')
        city = get_user_by_email(email)[3]

        if not city:
            return jsonify(
                {
                    'status': False,
                    'message': 'City not provided!',
                    'data': None
                }), 400
        url = f'http://api.weatherapi.com/v1/forecast.json?key={api_key}&q={city}&days=7&aqi=no&alerts=no'

        response = requests.get(url)
        if response.status_code != 200:
            return jsonify(
                {
                    'status': False,
                    'message': 'Failed to fetch weather data!',
                    'data': None
                }), response.status_code
        data = []

        for i in range(len(response.json()['forecast']['forecastday'])):

            data.append({
                "date": response.json()['forecast']['forecastday'][i]["date"],
                "max_temp": response.json()['forecast']['forecastday'][i]["day"]["maxtemp_c"],
                "min_temp": response.json()['forecast']['forecastday'][i]["day"]["mintemp_c"],
                "icon": f"https:{response.json()['forecast']['forecastday'][i]['day']['condition']['icon']}"
            })
        return jsonify(
            {
                'status': True,
                'message': 'Weather data fetched successfully!',
                'data': data
            })
    except Exception as e:
        return jsonify(
            {
                'status': False,
                'message': 'Failed to fetch weather data!',
                'data': e
            })

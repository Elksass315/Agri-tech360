import json
import os
from flask import jsonify
from models.user import create_connection
import shutil


def create_plants_table(conn):
    '''Function to create plants table in the database if not exists'''
    query = '''
    CREATE TABLE IF NOT EXISTS plants (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    plantName TEXT NOT NULL UNIQUE,
    plantShortDescription TEXT NOT NULL UNIQUE,
    plantMediumDescription TEXT NOT NULL UNIQUE,
    plantLongDescription TEXT NOT NULL UNIQUE,
    minimumdegrees TEXT NOT NULL,
    stateofTemperature TEXT NOT NULL,
    numberOfWater TEXT NOT NULL,
    plantCareInstruct TEXT NOT NULL,
    plantImage1 TEXT NOT NULL,
    plantImage2 TEXT NOT NULL
);
        '''
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        conn.commit()
        print("Plants table created successfully")
    except:
        print("Error creating plants table")


def upload_plants_folder(srcfolder, dstfolder):
    '''Function to copy plants photos from source folder to destination folder'''
    if not os.path.exists(dstfolder):
        shutil.copytree(srcfolder, dstfolder)


def insert_plants_data_from_json(filename):
    '''Function to read data from JSON file and insert into database'''
    with open(filename, 'r') as file:
        plants_data = json.load(file)

    conn = create_connection()
    cursor = conn.cursor()

    for plant in plants_data:
        plant_name = plant.get('plantName', '')
        upload_plants_folder(
            './models/plants_data/plants_photos1', './public/plants_photos1')
        upload_plants_folder(
            './models/plants_data/plants_photos2', './public/plants_photos2')
        cursor.execute("SELECT * FROM plants WHERE plantName=?", (plant_name,))
        existing_plant = cursor.fetchone()
        if not existing_plant:
            plant_short_description = plant.get('plantShortDescription', '')
            plant_medium_description = plant.get('plantMediumDescription', '')
            plant_long_description = plant.get('plantLongDescription', '')
            minimum_degrees = plant.get('minimumdegrees', 0)
            state_of_temperature = plant.get('stateofTemperature', '')
            number_of_water = plant.get('numberOfWater', 0)
            plant_care_instruct = plant.get('plantCareInstruct', '')
            plant_image1 = f"/uploads/plants_photos1/{plant_name}.png"
            plant_image2 = f"/uploads/plants_photos2/{plant_name}.jpeg"

            cursor.execute("INSERT INTO plants (plantName, plantShortDescription, plantMediumDescription, plantLongDescription, minimumdegrees, stateofTemperature, numberOfWater, plantCareInstruct, plantImage1, plantImage2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                           (plant_name, plant_short_description, plant_medium_description, plant_long_description, minimum_degrees, state_of_temperature, number_of_water, plant_care_instruct, plant_image1, plant_image2))
            print(f"Plant '{plant_name}' inserted successfully")

    conn.commit()
    conn.close()


def get_plant_by_name(name):
    '''Function to get plant by name'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM plants WHERE plantName LIKE ?",
                   ('%' + name + '%',))
    data = cursor.fetchone()
    if data:
        plant = {
            "id": data[0],
            "plantName": data[1],
            "plantShortDescription": data[2],
            "plantMediumDescription": data[3],
            "plantLongDescription": data[4],
            "minimumdegrees": data[5],
            "stateofTemperature": data[6],
            "numberOfWater": data[7],
            "plantCareInstruct": data[8],
            "plantImage1": data[9],
            "plantImage2": data[10]
        }
        conn.close()
        return jsonify(
            {
                "status": True,
                "message": "Plant fetched successfully",
                "data": plant
            }), 200
    else:
        conn.close()
        return jsonify(
            {
                "status": False,
                "message": "Plant not found",
                "data": None
            }), 404


def get_all_plants():
    '''Function to get all plants from the database'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM plants")
    plants = []
    data = cursor.fetchall()
    if data:
        for i in range(len(data)):
            plants.append({
                "id": data[i][0],
                "plantName": data[i][1],
                "plantShortDescription": data[i][2],
                "plantMediumDescription": data[i][3],
                "plantLongDescription": data[i][4],
                "minimumdegrees": data[i][5],
                "stateofTemperature": data[i][6],
                "numberOfWater": data[i][7],
                "plantCareInstruct": data[i][8],
                "plantImage1": data[i][9],
                "plantImage2": data[i][10]
            })
        conn.close()
        return jsonify(
            {
                "status": True,
                "message": "Plants fetched successfully",
                "data": plants
            }), 200
    else:
        conn.close()
        return jsonify(
            {
                "status": False,
                "message": "No plants found",
                "data": None
            }), 404

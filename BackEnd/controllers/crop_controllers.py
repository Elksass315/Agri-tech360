from flask import request, jsonify
from helpers.soil_recomends import recommend_next_crop
from helpers.upload_images import upload_file
from werkzeug.utils import secure_filename
import tensorflow as tf
import numpy as np

from datetime import date


def get_season():
    month = date.today().month
    if month in range(3, 9):
        return "summer"
    else:
        return "winter"


def classify_soil(filename):
    class_names = ['Alluvial soil', 'Black Soil', 'Clay soil', 'Red soil']
    model = tf.keras.models.load_model(
        './models/AI_Models/soil_model.h5')
    img_path = 'public/soil/' + filename
    img = tf.keras.preprocessing.image.load_img(
        img_path, target_size=(256, 256))
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)

    prediction = model.predict(img_array)
    confidence = round(100*(np.max(prediction[0])), 2)
    finall_class = class_names[np.argmax(prediction)]
    return confidence, finall_class


def recommend_crop():
    '''Function to classify the input image'''
    try:
        if 'file' not in request.files:
            return jsonify(
                {
                    "status": False,
                    "data": None,
                    'message': 'No file part in the request'
                }), 400

        if "previous_crop" not in request.form:
            return jsonify(
                {
                    "status": False,
                    "data": None,
                    'message': 'No previous crop in the request'
                }
            ), 400
        file = request.files['file']

        if file.filename == '':
            return jsonify(
                {
                    "status": False,
                    "data": None,
                    'message': 'No file selected for uploading'
                }), 400

        imgPath = upload_file('file', 'soil')
        filename = secure_filename(file.filename)

        confidence, finall_class = classify_soil(filename)
        season = get_season()

        soil_type = finall_class.split(" ")[0].lower()
        previous_crop = request.form.get("previous_crop").strip().lower()

        recommended_crop = recommend_next_crop(
            soil_type, previous_crop, season)

        return jsonify(
            {
                "status": True,
                "message": "success",
                "data":
                {
                    "soil type": finall_class,
                    "confidence": confidence,
                    "previous crop": previous_crop,
                    "season": season,
                    "recommended crop": recommended_crop,
                    "image": imgPath
                }
            })

    except Exception as e:
        return jsonify(
            {
                "status": False,
                "message": "Something went wrong",
                "data": e
            }), 500

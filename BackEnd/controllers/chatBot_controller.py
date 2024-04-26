from flask import request, jsonify
from dotenv import load_dotenv
import google.generativeai as genai
import os

load_dotenv()

genai.configure(api_key=os.environ["GEMINI_API_KEY"])
model = genai.GenerativeModel('gemini-pro')


def chatBot_controller():
    '''Function to chat with the model'''
    try:
        message = request.form.get('message')
        if not message:
            return jsonify(
                {
                    "status": False,
                    "message": "Message field is required",
                    "data": None
                }), 400
        prompot_parts = [
            'You are an AI assisstant named "Argi-tech360".You will be receiving content in various languages. Please just answer only the questions that are related to agriculture and plants or how to plant any plant else give them an answer that thier question should be related to the plants and agriclture.',
            f"input: {message}"
        ]
        response = model.generate_content(prompot_parts)
        return jsonify(
            {
                "status": True,
                "message": "Model answered successfully.",
                "data": response.text
            }), 200

    except Exception as e:
        return jsonify(
            {
                "status": False,
                "message": "Model failed to answer.",
                "data": e
            }), 404

from flask import request, jsonify
from dotenv import load_dotenv
import google.generativeai as genai
import os

from models.chatHistory import add_history, get_user_history

load_dotenv()

genai.configure(api_key=os.environ["GEMINI_API_KEY"])
model = genai.GenerativeModel('gemini-pro')
userRole = "user"
modelRole = "model"
chat_history = []


def create_chat(user):
    '''Function to create chat with the model'''
    old_history = get_user_history(user)
    if old_history is not None:
        for i in range(0, len(old_history)-1):
            chat_history.append({"role": userRole, "parts": [
                                 old_history[i]['message']]})
            chat_history.append({"role": modelRole, "parts": [
                                old_history[i]['response']]})
    else:
        chat_history.append({"role": userRole, "parts": [
                            "Hi, what do you want to know about plants?"]})
        chat_history.append({"role": modelRole, "parts": [
                            "Weird plant adaptations (besides Venus flytraps!).\nHow plants might communicate with each other \nEfforts to discover new plant species in unexplored rainforests"]})
    return chat_history


def chatBot_controller(email):
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
        chat_history = create_chat(email)
        msg = f"You are an AI assisstant named 'Argi-tech360'.You will receiving content in various languages. Please just answer only the questions that are related to agriculture and plants or how to plant any plant else give them an answer that thier question should be related to the plants and agriclture.input: {message}"
        chat = model.start_chat(history=chat_history)
        response = chat.send_message(msg)
        add_history(email, message, response.text)
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

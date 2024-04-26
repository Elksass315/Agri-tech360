import datetime
import jwt
from functools import wraps
from flask import request, jsonify
import os
from dotenv import load_dotenv

load_dotenv()


def generate_jwt(email, app):
    '''Function to generat a JWT'''
    expiry_date = datetime.datetime.now() + datetime.timedelta(days=30)
    token = jwt.encode({"email": email, "exp": expiry_date},
                       app.config["SECRET_KEY"], algorithm="HS256")
    return token


def auth_token(f):
    '''Function  to autenticate the jwt from the headers'''
    @wraps(f)
    def decorated(*args, **kwargs):
        auth_headers = request.headers.get("Authorization")

        if not auth_headers:
            return jsonify(
                {
                    'status': False,
                    'message': 'Authentication token is missing',
                    'data': None
                }), 401
        token = auth_headers.split(" ")[1]
        if not token:
            return jsonify(
                {
                    'status': False,
                    'message': 'Token is missing',
                    'data': None
                }), 401
        try:
            data = jwt.decode(token, os.getenv(
                'SECRET_KEY'), algorithms=['HS256'])
            kwargs['email'] = data['email']
        except:
            return jsonify(
                {
                    'status': False,
                    'message': "Invalid Token",
                    'data': None
                }), 401
        return f(*args, **kwargs)
    return decorated

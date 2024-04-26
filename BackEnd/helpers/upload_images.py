import os
from flask import request
from werkzeug.utils import secure_filename


def upload_file(name, folder):
    '''Function to upload file to the server'''
    try:
        if name not in request.files:
            return None

        file = request.files[name]

        if file.filename == '':
            return None

        if not os.path.exists('public/' + folder):
            os.makedirs('public/' + folder)

        if file:
            filename = secure_filename(file.filename)
            file_path = os.path.join('public/' + folder + '/', filename)
            file.save(file_path)
            return f"/uploads/{folder}/{filename}"

    except Exception as e:
        return None

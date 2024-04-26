from flask import jsonify, request
from helpers.upload_images import upload_file
from models.user import get_user_by_email
from models.products import add_product
import os
from werkzeug.utils import secure_filename


def add_product_to_shop(email):
    '''Function to add product in the database'''
    try:
        name = request.form.get('name')
        price = request.form.get('price')
        description = request.form.get('description')
        seller = email
        images = request.files.getlist('images')
        tags = request.form.get('tags')
        image = request.files.get('image')

        if not image or not name or not price or not description or not seller or not tags:
            return jsonify(
                {
                    "status": False, "message": "All fields are required",
                    "data": None
                }), 400

        imagesLinks = []
        image = upload_file("image", 'products')

        for file in images:
            filename = secure_filename(file.filename)
            file_path = os.path.join('public/products/', filename)
            file.save(file_path)
            imagesLinks.append(
                f"/uploads/products/{filename}")

        add_product(name, price, description, seller, image, imagesLinks, tags)
        seller = get_user_by_email(seller)

        return jsonify({
            "status": True,
            "message": "Product added successfully",
            "data":
                {
                    "image": image,
                    "images": f"{imagesLinks}",
                    "tags": tags,
                    "name": name,
                    "price": price,
                    "description": description,
                    "seller": {
                        "id": seller[0],
                        "fullName": seller[1],
                        "email": seller[2],
                        "city": seller[4],
                        "phoneNumber": seller[5],
                        "profilePic": seller[6]
                    }
                }
        }), 200

    except Exception as e:
        return jsonify({
            "status": False,
            "message": "Product not added",
            "data": e
        }), 500

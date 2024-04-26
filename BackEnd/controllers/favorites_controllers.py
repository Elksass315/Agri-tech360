from flask import jsonify, request
from models.products import get_product_by_id
from models.user import get_user_by_email
from models.favorites import add_favorite, get_user_favorites, remove_favorite


def add_favorites(email):
    try:
        product_id = request.form.get('product')
        if not product_id:
            return jsonify({
                "status": False,
                "message": "Product id is required",
                "data": None
            }), 400
        add_favorite(email, product_id)
        product = get_product_by_id(product_id)
        user = get_user_by_email(email)

        return jsonify({
            "status": True,
            "message": "Product added to favorites successfully",
            "data": {
                "product": product,
                "user": {
                    "email": user[1],
                    "fullName": user[2],
                    "city": user[4],
                    "phoneNumber": user[5],
                    "profilePic": user[6]
                }
            }
        }), 200
    except Exception as e:
        return jsonify({
            "status": False,
            "message": "Product not added to favorites",
            "data": e
        }), 500


def get_user_fav_products(email):
    try:
        favorites = get_user_favorites(email)
        if not favorites:
            return jsonify({
                "status": False,
                "message": "No favorites found",
                "data": None
            }), 404
        return jsonify({
            "status": True,
            "message": "Favorites fetched successfully",
            "data": favorites
        }), 200
    except Exception as e:
        return jsonify({
            "status": False,
            "message": "No favorites found",
            "data": e
        }), 404


def delete_favorites(email):
    try:
        product_id = request.form.get('product')
        if not product_id:
            return jsonify({
                "status": False,
                "message": "Product id is required",
                "data": None
            }), 400
        favorites = get_user_favorites(email)
        if not favorites:
            return jsonify({
                "status": False,
                "message": "Product is not in favorites",
                "data": None
            }), 404
        remove_favorite(email, product_id)
        return jsonify({
            "status": True,
            "message": "Product removed from favorites successfully",
            "data": None
        }), 200
    except Exception as e:
        return jsonify({
            "status": False,
            "message": "Product not removed from favorites",
            "data": e
        }), 500

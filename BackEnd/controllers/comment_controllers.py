from flask import jsonify, request
from models.comments import add_comment, remove_comment, get_comment_by_product
from models.user import get_user_by_email
from models.products import get_product_by_id
import tensorflow as tf


def classify_comment(comment):
    model = tf.keras.models.load_model('./models/AI_Models/sentiment.h5')
    tokenizer = tf.keras.preprocessing.text.Tokenizer(num_words=5000)
    tokenizer.fit_on_texts([comment])
    tw = tokenizer.texts_to_sequences([comment])
    tw = tf.keras.preprocessing.sequence.pad_sequences(tw, maxlen=200)
    prediction = int(model.predict(tw).round().item())
    prediction_classes = ["Positive", "Negative"]
    return prediction_classes[prediction]


def create_comment(email):
    '''Function to create a comment and add it to database'''
    try:
        comment = request.form.get('comment')
        commenter = email
        product = request.form.get('product')

        if not comment or not product:
            return jsonify(
                {
                    "status": False,
                    "message": "Comment and product id fields are required",
                    "data": None
                }), 400

        prediction = classify_comment(comment)
        add_comment(comment, commenter, product,
                    prediction)
        commenter = get_user_by_email(commenter)
        product = get_product_by_id(product)
        return jsonify(
            {
                "status": True,
                "message": "comment added successfully",
                "data": {
                    "comment": comment,
                    "commenter": {
                        "id": commenter[0],
                        "fullName": commenter[1],
                        "email": commenter[2],
                        "city": commenter[4],
                        "phoneNumber": commenter[5],
                        "profilePic": commenter[6]
                    },
                    "product": product,
                    "prediction": prediction}
            }), 200
    except Exception as e:
        return jsonify(
            {
                "status": False,
                "message": "comment not added",
                "data": e
            }), 404


def delete_comment(email):
    '''Function to delete comment from database'''
    try:
        comment_id = request.form.get('comment_id')
        remove_comment(comment_id, email)
        return jsonify(
            {
                "status": True,
                "message": "comment deleted successfully",
                "data": None
            }), 200
    except Exception as e:
        return jsonify(
            {
                "status": False,
                "message": "comment not found",
                "data": e
            }), 500


def get_comments(product):
    '''Function to get comments from database by product'''
    try:
        comments = get_comment_by_product(product)
        if len(comments) == 0:
            return jsonify(
                {
                    "status": False,
                    "message": "No comments found",
                    "data": []
                }), 200
        return jsonify(
            {
                "status": True,
                "message": "success",
                "data": comments
            }), 200
    except Exception as e:
        return jsonify(
            {
                "status": False,
                "message": "No comments found",
                "data": e
            }), 404

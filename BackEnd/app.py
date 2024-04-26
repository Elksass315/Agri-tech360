# Import mian libraries
from flask import Flask, jsonify, send_from_directory
import os
from dotenv import load_dotenv
from flask_swagger_ui import get_swaggerui_blueprint
from flask_cors import CORS
# Import needed controllers
from controllers.chatBot_controller import chatBot_controller
from controllers.comment_controllers import create_comment, delete_comment, get_comments
from controllers.favorites_controllers import add_favorites, delete_favorites, get_user_fav_products
from controllers.shop_controllers import add_product_to_shop
from controllers.soil_controllers import recommend_crop
from controllers.weather_controller import get_weather
from controllers.user_controllers import register, login, get_user_data, update_user_data, update_password
from controllers.model_controller import classify_image

# import the database models
from models.comments import create_comments_table
from models.favorites import create_favorites_table
from models.plants import create_plants_table, get_all_plants, get_plant_by_name, insert_plants_data_from_json
from models.products import create_products_table, get_all_products, get_products_by_tag
from models.user import create_connection, create_user_table

# import the jwt token authentication
from helpers.jwt_helper import auth_token


# Swagger Configurations
SWAGGER_URL = "/swagger"
API_URL = "/static/swagger.json"
swagger_ui_blueprint = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': 'Agri-tech360 API'
    }
)

load_dotenv()

app = Flask(__name__)
CORS(app)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
# Create the Database Tables before running the app
conn = create_connection()
create_user_table(conn)
create_plants_table(conn)
create_products_table(conn)
create_comments_table(conn)
create_favorites_table(conn)
insert_plants_data_from_json('models/plants_data/data.json')

# Main app endpoints


@app.route('/register', methods=['POST'])
def register_api(): return register(app)


@app.route('/login', methods=['POST'])
def login_api(): return login(app)


@app.route('/user-data', methods=['GET'])
@auth_token
def get_user_data_api(email): return get_user_data(email)


@app.route('/update-user-data', methods=['PUT'])
@auth_token
def update_user_data_api(email): return update_user_data(email)


@app.route('/update-password', methods=['PUT'])
@auth_token
def update_password_api(email): return update_password(email)


@app.route('/get-weather', methods=['GET'])
@auth_token
def get_weather_api(email): return get_weather(email)


@app.route('/plants', methods=['GET'])
@auth_token
def get_plants(email): return get_all_plants()


@app.route('/plants/<plant_name>', methods=['GET'])
@auth_token
def get_plant(email, plant_name): return get_plant_by_name(plant_name)


@app.route('/uploads/<folder>/<filename>', methods=['GET'])
def get_uploaded_file(filename, folder):
    return send_from_directory('public/'+folder+'/', filename)


@app.route('/classify', methods=['POST'])
@auth_token
def classify_api(email): return classify_image()


@app.route('/add-product', methods=['POST'])
@auth_token
def add_product_api(email): return add_product_to_shop(email)


@app.route('/products', methods=['GET'])
@auth_token
def get_products(email): return get_all_products()


@app.route('/products/<product_tag>', methods=['GET'])
@auth_token
def get_products_by_tag_api(email, product_tag):
    products = get_products_by_tag(product_tag)
    if products is not None:
        return jsonify(
            {
                "status": True,
                "message": "Products fetched successfully",
                "data": products
            })
    return jsonify(
        {
            "status": False,
            "message": "No products found",
            "data": None
        }), 404


@app.route('/comments/create', methods=['POST'])
@auth_token
def create_comment_api(email): return create_comment(email)


@app.route('/comments/<product>', methods=['GET'])
@auth_token
def get_comments_api(email, product): return get_comments(product)


@app.route('/comments', methods=['DELETE'])
@auth_token
def delete_comment_from_product_api(email): return delete_comment(email)


@app.route('/add-favorites', methods=["POST"])
@auth_token
def create_favorites_table_api(email): return add_favorites(email)


@app.route('/favorites', methods=["GET"])
@auth_token
def get_user_fav_products_api(email): return get_user_fav_products(email)


@app.route('/remove-favorites', methods=["DELETE"])
@auth_token
def delete_favorite_from_product_api(email): return delete_favorites(email)


@app.route("/recommend-crop", methods=["POST"])
@auth_token
def soil_classify_api(email): return recommend_crop()


@app.route('/chat', methods=["POST"])
@auth_token
def chatBot_api(email): return chatBot_controller()


app.register_blueprint(swagger_ui_blueprint, url_prefix=SWAGGER_URL)
if __name__ == '__main__':
    print(
        f"\n\n\n\033[92m \033[1mProject Docs : http://{os.getenv('HOST') or 'localhost'}:{os.getenv('PORT') or 3000}/swagger \033[0m")
    app.run(host=os.getenv('HOST')
            or 'localhost', port=os.getenv('PORT') or 3000)

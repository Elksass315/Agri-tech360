from flask import jsonify
from models.user import create_connection, get_user_by_email


def create_products_table(conn):
    '''Function to create products table in the database if not exists'''
    query = '''
    CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(100) NOT NULL,
        price FLOAT NOT NULL,
        description TEXT NOT NULL,
        seller INTEGER NOT NULL,
        image TEXT NOT NULL,
        images TEXT,
        tags TEXT NOT NULL,
        FOREIGN KEY (seller) REFERENCES users(email)
    )
    '''
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        conn.commit()
        print("Products table created successfully")
    except Exception as e:
        print(e)
        print("Error creating products table")


def add_product(name, price, description, seller, image, images, tags):
    '''Function to add product in the database'''
    conn = create_connection()
    cursor = conn.cursor()
    images.append(image)
    cursor.execute("INSERT INTO products (name, price, description, seller, image, images, tags) VALUES (?, ?, ?, ?, ?, ?, ?)",
                   (name, price, description, seller, image, f"{images}", tags))
    conn.commit()
    cursor.close()
    conn.close()


def get_all_products():
    '''Function to get all products'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM products")
    products = cursor.fetchall()
    data = []
    if products:
        for i in range(len(products)):
            seller = get_user_by_email(products[i][4])
            data.append({
                "id": products[i][0],
                "name": products[i][1],
                "price": products[i][2],
                "description": products[i][3],
                "seller": {
                    "id": seller[0],
                    "fullName": seller[1],
                    "email": seller[2],
                    "city": seller[4],
                    "phoneNumber": seller[5],
                    "profilePic": seller[6]
                },
                "image": products[i][5],
                "images": products[i][6],
                "tags": products[i][7],
            })
        cursor.close()
        return jsonify(
            {
                "status": True,
                "message": "Products fetched successfully",
                "data": data
            })
    conn.close()
    return jsonify(
        {
            "status": False,
            "message": "No products found",
            "data": None
        }), 404


def get_products_by_tag(tag):
    '''Function to get products by tag'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM products WHERE tags LIKE ?",
                   ('%' + tag + '%',))
    products = cursor.fetchall()
    data = []
    if products:
        for i in range(len(products)):
            seller = get_user_by_email(products[i][4])
            data.append({
                "id": products[i][0],
                "name": products[i][1],
                "price": products[i][2],
                "description": products[i][3],
                "seller": {
                    "id": seller[0],
                    "fullName": seller[1],
                    "email": seller[2],
                    "city": seller[4],
                    "phoneNumber": seller[5],
                    "profilePic": seller[6]
                },
                "image": products[i][5],
                "images": products[i][6],
                "tags": products[i][7],
            })
        cursor.close()
        return data
    conn.close()
    return None


def get_product_by_id(product_id):
    '''Function to get product by id'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM products WHERE id = ?", (product_id,))
    product = cursor.fetchone()
    seller = get_user_by_email(product[4])
    if product:
        cursor.close()
        return {
            "id": product[0],
            "name": product[1],
            "price": product[2],
            "description": product[3],
            "seller": {
                "id": seller[0],
                "fullName": seller[1],
                "email": seller[2],
                "city": seller[4],
                "phoneNumber": seller[5],
                "profilePic": seller[6]
            },
            "image": product[5],
            "images": product[6],
            "tags": product[7],
        }
    conn.close()
    return None

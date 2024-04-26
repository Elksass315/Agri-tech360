from models.products import get_product_by_id
from models.user import create_connection


def create_favorites_table(conn):
    '''Function to create user table in the database if not exists'''
    query = '''
    CREATE TABLE IF NOT EXISTS favorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user TEXT NOT NULL,
        product INTEGER NOT NULL,
        FOREIGN KEY (user) REFERENCES users(email),
        FOREIGN KEY (product) REFERENCES products(id)
    )
    '''
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        conn.commit()
        print("Favorites table created successfully")
    except Exception as e:
        print(e)
        print("Error creating favorites table")


def add_favorite(user, product):
    '''Function to add product to favorites in the database'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO favorites (user, product) VALUES (?, ?)",
                   (user, product))
    conn.commit()
    cursor.close()
    conn.close()


def get_favorite_by_product_and_user(user, product):
    '''Function to get favorite by product and user'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM favorites WHERE user = ? AND product = ?",
                   (user, product))
    data = cursor.fetchone()
    if data:
        cursor.close()
        conn.close()
        return True
    cursor.close()
    conn.close()
    return False


def get_user_favorites(user):
    '''Function to get user's favorites'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM favorites WHERE user =?", (user,))
    data = cursor.fetchall()
    result = []
    if data:
        for i in range(len(data)):
            product = get_product_by_id(data[i][2])
            result.append({
                "product": product
            })
        cursor.close()
        conn.close()
        return result
    cursor.close()
    conn.close()
    return None


def remove_favorite(user, product):
    '''Function to remove product from favorites in the database'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM favorites WHERE user = ? AND product = ?",
                   (user, product))
    conn.commit()
    cursor.close()
    conn.close()

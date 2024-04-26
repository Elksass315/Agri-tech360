from models.products import get_product_by_id
from models.user import create_connection, get_user_by_email


def create_comments_table(conn):
    '''Function to create comments table in the database if not exists'''
    query = '''
    CREATE TABLE IF NOT EXISTS comments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        comment TEXT NOT NULL,
        commenter TEXT NOT NULL,
        product INTEGER NOT NULL,
        prediction TEXT NOT NULL,
        FOREIGN KEY (commenter) REFERENCES users(email),
        FOREIGN KEY (product) REFERENCES products(id)
    )
    '''
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        conn.commit()
        print("Comments table created successfully")
    except Exception as e:
        print(e)
        print("Error creating Comments table")


def add_comment(comment, commenter, product, prediction):
    '''Function to add comment to database'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO comments (comment, commenter, product, prediction) VALUES (?, ?, ?, ?)",
                   (comment, commenter, product, prediction))
    conn.commit()
    cursor.close()
    conn.close()


def get_comment_by_product(product):
    '''Function to get comments by product'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM comments WHERE product =?", (product,))
    data = cursor.fetchall()
    result = []
    if data:
        product = get_product_by_id(product)
        for i in range(len(data)):
            commneter = get_user_by_email(data[i][2])
            result.append({
                "comment": data[i][1],
                "commenter": {
                    "id": commneter[0],
                    "fullName": commneter[1],
                    "email": commneter[2],
                    "city": commneter[4],
                    "phoneNumber": commneter[5],
                    "profilePic": commneter[6]
                },
                "product": product,
                "prediction": data[i][4]
            })
    cursor.close()
    conn.close()
    return result


def remove_comment(comment_id, user_email):
    '''Function to remove comment from database'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute(
        "DELETE FROM comments WHERE id = ? AND commenter = ?", (comment_id, user_email))
    conn.commit()
    cursor.close()
    conn.close()

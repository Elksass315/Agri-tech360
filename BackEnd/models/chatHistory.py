from models.user import create_connection, get_user_by_email


def create_history_table(conn):
    '''Function to create history table in the database if not exists'''
    query = '''
    CREATE TABLE IF NOT EXISTS history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user TEXT NOT NULL,
        message TEXT NOT NULL,
        response TEXT NOT NULL,
        FOREIGN KEY (user) REFERENCES users(email)
    )
    '''
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        conn.commit()
        print("History table created successfully")
    except Exception as e:
        print(e)
        print("Error creating History table")


def add_history(user, message, response):
    '''Function to add history to database'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO history (user, message, response) VALUES (?, ?, ?)",
                   (user, message, response))
    conn.commit()
    cursor.close()
    conn.close()


def get_user_history(user):
    '''Function to get user's history'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM history WHERE user =?", (user,))
    data = cursor.fetchall()
    result = []
    if data:
        for i in range(len(data)):
            result.append({
                "message": data[i][2],
                "response": data[i][3]
            })
        cursor.close()
        conn.close()
        return result
    cursor.close()
    conn.close()
    return None

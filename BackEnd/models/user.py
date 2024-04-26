import sqlite3
import bcrypt


def create_connection():
    conn = sqlite3.connect("database.db")
    return conn


def create_user_table(conn):
    '''Function to create user table in the database if not exists'''
    query = '''
    CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullName TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE, -- Add UNIQUE constraint for emails
    password TEXT NOT NULL,
    city TEXT NOT NULL,
    phoneNumber TEXT NOT NULL,
    profilePic TEXT NOT NULL
);
        '''
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        conn.commit()
        print("User table created successfully")
    except:
        print("Error creating user table")


def register_user(email, password, fullName, city, phoneNumber, profilePic):
    '''Function to register user in the database'''
    conn = create_connection()
    cursor = conn.cursor()
    if profilePic is None:
        profilePic = "https://cdn-icons-png.freepik.com/512/3033/3033143.png"
    cursor.execute("INSERT INTO users (email,password,fullName,city, phoneNumber, profilePic) VALUES (?,?,?,?,?,?)",
                   (email, password, fullName, city, phoneNumber, profilePic))
    conn.commit()
    cursor.close()
    conn.close()


def get_user_by_email(email):
    '''Function to get user by email'''
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE email=?", (email,))
    user = cursor.fetchone()
    conn.close()
    return user

# Function to hash the password


def hash_password(password):
    '''Function to hash the password of the user using bcrypt'''
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed_password

# Function to verify the password


def verify_password(stored_password, provided_password):
    '''Function to verify the password of the user using bcrypt'''
    return bcrypt.checkpw(provided_password.encode('utf-8'), stored_password)

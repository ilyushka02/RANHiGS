import mysql.connector

print(mysql.connector.__version__)

# Укажите параметры подключения
config = {
    'host': 'localhost',  # IP-адрес сервера базы данных
    'user': 'root',  # Имя пользователя
    'password': 'root',  # Пароль
    'database': 'bank'  # Название базы данных
}

try:
    # Подключение к базе данных
    connection = mysql.connector.connect(**config)
    
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        
        cursor = connection.cursor()
        cursor.execute("SELECT DATABASE();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)
except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")

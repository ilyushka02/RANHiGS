import mysql.connector
from config_db_connect import config
from database_module import scripts_for_db as sql_sc

def open_connection():
    """
    Metod for open connection the databases
    """
    try:
        # Подключение к базе данных
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Log: Connected to MySQL Server version ", db_Info)
    except Error as e:
        print("Error while connecting to MySQL", e)

    return connection

def create_cursor(connection):
    return connection.cursor()


def close_connection(connection, cursor):
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("Log: MySQL connection is closed")


def get_count_clients():
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_COUNT_ORGANIZATION__)
    result = cursor.fetchone()[0]
    close_connection(connection, cursor)    
    return result

def get_count_loans():
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_COUNT_LOANS__)
    result = cursor.fetchone()[0]
    close_connection(connection, cursor)    
    return result

def get_full_sum_loans():
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SUM_LOANS__)
    result = cursor.fetchone()[0]
    close_connection(connection, cursor)    
    return result
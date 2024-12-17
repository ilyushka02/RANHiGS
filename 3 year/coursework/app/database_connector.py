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
    """
    Metod for create cursor
    """
    return connection.cursor()


def close_connection(connection, cursor):
    """
    Metod for close connection the databases
    """
    if connection.is_connected():
            cursor.close()
            connection.close()
            print("Log: MySQL connection is closed")


def get_count_clients()->str:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_COUNT_ORGANIZATIONS__)
    result = cursor.fetchone()[0]
    close_connection(connection, cursor)    
    return str(result)

def get_count_loans()->str:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_COUNT_LOANS__)
    result = cursor.fetchone()[0]
    close_connection(connection, cursor)    
    return str(result)

def get_full_sum_loans()->str:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SUM_LOANS__)
    result = cursor.fetchone()[0]
    close_connection(connection, cursor)    
    return str(result)


def get_refund_amounts_by_day()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_REFAUND_AMOUNTS_BY_DAY__)
    result = cursor.fetchall()
    close_connection(connection, cursor)
    result = [(result[index][0], float(result[index][1])) for index in range(len(result))]
    return result


def get_refund_amounts_by_city()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_REFAUND_AMOUNTS_BY_CITY__)
    result = cursor.fetchall()
    close_connection(connection, cursor)   
    result = [(result[index][0], float(result[index][1])) for index in range(len(result))]
    return result

def get_loans()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SELECT_ALL_LOANS__)
    result = cursor.fetchall()
    close_connection(connection, cursor)   
    # result = [(result[index][0], float(result[index][1])) for index in range(len(result))]
    return result


# if __name__ == "__main__":
#     res = get_loans()
#     print(res)

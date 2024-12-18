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
    return result

def get_loans_id()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SELECT_LOAN_ID__)
    result = cursor.fetchall()
    close_connection(connection, cursor)   
    return [value[0] for value in result]

def get_organization_name()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SELECT_ORG_NAME__)
    result = cursor.fetchall()
    close_connection(connection, cursor)   
    return [value[0] for value in result]

def get_status_name()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SELECT_STATUS_NAME__)
    result = cursor.fetchall()
    close_connection(connection, cursor)   
    return [value[0] for value in result]

def set_loan(
        amount:int,
        interest_rate: float,
        date_from: str,
        date_to: str,
        status_id: int,
        organization_id: int,
        returned_amount: int
        ): 
   
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_INSERT_LOAN__, (
        amount,
        interest_rate,
        date_from,
        date_to, 
        status_id,
        organization_id,
        returned_amount))
    connection.commit()
    close_connection(connection, cursor)  

def update_loan(
        amount:int,
        interest_rate: float,
        date_from: str,
        date_to: str,
        status_id: int,
        organization_id: int,
        returned_amount: int,
        id_row_update: int
        ): 
   
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_UPDATE_LOAN__, (
        amount,
        interest_rate,
        date_from,
        date_to, 
        status_id,
        organization_id,
        returned_amount,
        id_row_update))
    connection.commit()
    close_connection(connection, cursor)

def delete_loan(id_row:int): 
   
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_DELETE_LOAN__, (id_row,))
    connection.commit()
    close_connection(connection, cursor)  

# if __name__ == "__main__":
#     res = get_organization_name()
#     print(res)


def get_operations()->list:
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_SELECT_ALL_OPERATIONS__)
    result = cursor.fetchall()
    close_connection(connection, cursor)   
    return result

def set_operation(
        loan_id: int, 
        date_operation: str,
        amount: int
        ): 
   
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_INSERT_OPERATION__, ( 
        loan_id, 
        date_operation,
        amount))
    connection.commit()
    close_connection(connection, cursor)  

def update_operation(
        loan_id: int, 
        date_operation: str,
        amount: int,
        id_row_update: int
        ): 
   
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_UPDATE_OPERATION__, (
        loan_id,
        date_operation,
        amount, 
        id_row_update))
    connection.commit()
    close_connection(connection, cursor)

def delete_operation(id_row:int): 
   
    connection = open_connection()
    cursor = create_cursor(connection)
    cursor.execute(sql_sc.__SQL_DELETE_OPERATION__, (id_row,))
    connection.commit()
    close_connection(connection, cursor)  

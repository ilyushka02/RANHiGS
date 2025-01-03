# REPORTS
__SQL_COUNT_ORGANIZATIONS__ = """
    select
        count(id)
    from bank.organizations
"""

__SQL_COUNT_LOANS__ = """
    select
        count(id)
    from bank.loan
"""

__SQL_SUM_LOANS__ = """
    select
        sum(amount)
    from bank.loan
"""

__SQL_REFAUND_AMOUNTS_BY_DAY__ = """
    select
        date_operation,
        sum(amount) as amount
    from bank.refund_operations oper
    group by date_operation
"""

__SQL_REFAUND_AMOUNTS_BY_CITY__ = """
    select
        cyti.city_name,
        sum(oper.amount) as amount
    from bank.refund_operations oper
    join bank.loan loan on oper.loan_id = loan.id
    join bank.organizations org on loan.organization_id = org.id
    join bank.city cyti on org.city_id = cyti.id
    group by cyti.city_name
    order by sum(oper.amount) desc
"""

# GET DATA
__SQL_SELECT_ALL_LOANS__ = """
    select
        l.id,
        l.amount,
        l.interest_rate,
        l.date_from,
        l.date_to,
        st.name_status,
        org.organization_name,
        l.retern_amount
    from bank.loan l
    join bank.organizations org on l.organization_id = org.id
    join bank.status_loan st on l.status_id = st.id
"""

__SQL_SELECT_ORG_NAME__ = """
    select
        org.id
    from bank.organizations org
"""

__SQL_SELECT_STATUS_NAME__ = """
    select
        st.name_status
    from bank.status_loan st
"""

__SQL_SELECT_ALL_OPERATIONS__ = """
    select
        *
    from bank.refund_operations
"""


__SQL_SELECT_LOAN_ID__ = """
    select
        l.id
    from bank.loan l
"""

__SQL_INSERT_LOAN__ = f"""
    INSERT INTO loan (amount, interest_rate, date_from,
        date_to, status_id, organization_id, retern_amount)
    VALUES (%s, %s, %s, %s, %s, %s, %s);
"""

__SQL_UPDATE_LOAN__ = f"""
    UPDATE loan 
    SET
    amount = %s, 
    interest_rate= %s,
    date_from= %s,
    date_to= %s,
    status_id= %s,
    organization_id= %s,
    retern_amount= %s
    where
    id = %s;
"""

__SQL_DELETE_LOAN__ = f"""
    DELETE FROM loan
    WHERE id = %s;
"""

__SQL_INSERT_OPERATION__ = f"""
    INSERT INTO bank.refund_operations (loan_id, date_operation, amount)
    VALUES (%s, %s, %s);
"""

__SQL_UPDATE_OPERATION__ = f"""
    UPDATE bank.refund_operations
    SET
    loan_id = %s, 
    date_operation = %s,
    amount = %s
    where
    id = %s;
"""

__SQL_DELETE_OPERATION__ = f"""
    DELETE FROM bank.refund_operations
    WHERE id = %s;
"""
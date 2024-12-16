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

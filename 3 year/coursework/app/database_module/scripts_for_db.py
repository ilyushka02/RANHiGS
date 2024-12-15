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

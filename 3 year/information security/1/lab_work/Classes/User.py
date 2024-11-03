"""Базовый класс пользователя"""

class User:
    user_name = ''
    password = ''
    type = ''

    def __init__(self,
                 user_name:str ='',
                 password:str ='',
                 type:str ='user'
                 )->None:
        self.user_name = user_name
        self.password = password
        self.type = type

    def set_username(self, name:str):
        self.user_name = name

    def get_username(self)->str:
        return self.user_name

    def set_password(self, password:str):
        self.password = password

    def get_password(self)->str:
        return self.password

    def set_type(self, type:str):
        self.type = type

    def get_type(self)->str:
        return self.type

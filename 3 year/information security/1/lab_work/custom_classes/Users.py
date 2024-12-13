""""""
from . import User as userClass
from random import choice

class Users:
    list_users = []

    BAD_CODE = -1
    SUCESS = 200

    def __init__(self):
        self.list_users = []

    def generate_users(self, count:int):
        """Generate list random users"""
        def _generate_name():
            PATH = r'./List_names.txt'
            try:
                f = open(PATH, 'r', encoding='utf-8')
                names = [name.replace('\n', '') for name in f.readlines()]
                f.close()
            except:
                names = ['Иван', 'Кристина', 'Ксения',
                         'Тимофей', 'Виктория', 'Мария',
                         'Александр', 'Алексей', 'Максим']
            name = choice(names)
            names.remove(name)
            return name

        self.list_users = [userClass.User() for i in range(0, count)]

        for index, user in enumerate(self.list_users):
            name = _generate_name()
            user.set_username(name)
            user.set_password(name)
            if index == 0:
                user.set_type('admin')
            if index == len(self.list_users) - 1:
                user.set_type('guest')

    def print_all_persen(self):
        len_usn = max([len(user.user_name) for user in self.list_users] + [8])
        len_pass = max([len(user.password) for user in self.list_users] + [8])
        len_type = max([len(user.type) for user in self.list_users] + [5])

        sep_row = '|' + '-' * (len_usn + 4) + '|' + '-' * (len_pass + 4) + '|' + '-' * (len_type + 4) + '|'
        print(sep_row)
        print('| Username', ' ' * (len_usn - 8 + 1),
              '| Password', ' ' * (len_pass - 8 + 1),
              '| Type', ' ' * (len_type - 4 + 1),
              '|'
              )
        print(sep_row)
        for u in self.list_users:
            name = u.get_username()
            password = u.get_password()
            type = u.get_type()

            print(f"| {name}", ' ' * (len_usn - len(name) + 1), '|', end='')
            print(f" {password}", ' ' * (len_pass - len(name) + 1), '|', end='')
            print(f" {type}", ' ' * (len_type - len(type) + 1), '|')
        print(sep_row)

    def autorization(self,
                     username:str,
                     password:str):
        list_usernames = [user.user_name for user in self.list_users]
        if username not in list_usernames: return self.BAD_CODE, 1

        user = self.list_users[list_usernames.index(username)]

        if user.get_password() == password:
            return self.SUCESS, user
        else:
            return self.BAD_CODE, 2

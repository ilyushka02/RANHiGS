import File as fileClass
from random import choice

class Files:
    # Список файлов
    list_files = []

    BAD_CODE = -1
    SUCESS = 200

    def __init__(self):
        self.list_files = []

    def generate_files(self, count, users):
        def _generate_rolls_user():
            acess = [True, False]
            for index in range(0,3):
                user = {'r':'', 'w':'', 's':''}
                value = choice(acess)
                if value == False:
                    return  {'r':False, 'w':False, 's':False}
                user['r'] = value
                value = choice(acess)
                if value == False:
                    return  {'r':True, 'w':False, 's':False}
                user['w'] = value
                user['s'] = choice(acess)
                return  user

        self.list_files = [fileClass.File() for i in range(0, count)]

        admin_access = {'r':True, 'w':True, 's':True}
        user_access =  {'r':True, 'w':False, 's':False}
        guest_access =  {'r':False, 'w':False, 's':False}


    
        for index, file in enumerate(self.list_files):
            if index == 0:
                file.set_filename('PersenData')
                
                admin = {user.get_username():admin_access for user in users.list_users if user.get_type() == 'admin'}
                guest = {user.get_username():guest_access for user in users.list_users if user.get_type() != 'admin'}
    
                file.set_rolls(
                    dict(list(admin.items())+list(guest.items()))
                )
            
            elif index == 1:
                file.set_filename('Access')
    
                admin = {user.get_username():admin_access for user in users.list_users if user.get_type() == 'admin'}
                user = {user.get_username():user_access for user in users.list_users if user.get_type() == 'user'}
                guest = {user.get_username():guest_access for user in users.list_users if user.get_type() != 'admin' and user.get_type() != 'user'}
    
                file.set_rolls(
                    dict(list(admin.items())+list(user.items())+list(guest.items()))
                )
            else:
                file.set_filename(f'Object_{index-1}')
                admin = {user.get_username():admin_access for user in users.list_users if user.get_type() == 'admin'}
                user = {user.get_username():_generate_rolls_user() for user in users.list_users if user.get_type() == 'user'}
                guest = {user.get_username():guest_access for user in users.list_users if user.get_type() != 'admin' and user.get_type() != 'user'}
    
                file.set_rolls(
                    dict(list(admin.items())+list(user.items())+list(guest.items()))
                )
                
    def print_all_access_to_file(self):
        # Вывод 
        usns = list(self.list_files[0].rolls.keys())
        len_usn = max([len(user) for user in usns] + [8])
        len_pers = len("PersenData")
        len_acc = len("Access")
           
        sep_row = '|'+'-'*(len_usn+4)+'|'+'-'*(len_pers+4)+'|'+'-'*(len_acc+6)+'|'
        print(sep_row, end='')
        
        for index, file in enumerate(self.list_files): 
            if index < 2:
                continue
            print('-'*(len(file.file_name)+2), end='|')
        print()
        
        print('| Username', ' '*(len_usn-8+1),
              '| PersenData', ' '*(len_pers-10+1),
              '| Access ', ' '*(len_acc-6+2),
              '|', end=' '
             )
        
        for index, file in enumerate(self.list_files): 
            if index < 2:
                continue
            
            print(f'{file.file_name}', end =' | ')

        print()
        print(sep_row, end='')
        
        for index, file in enumerate(self.list_files): 
            if index < 2:
                continue
            print('-'*(len(file.file_name)+2), end='|')
        print()
        
        for user in usns:   
            print(f"| {user}", ' '*(len_usn-len(user)+2), end='|')
            for index, file in enumerate(self.list_files):
                access = list(file.rolls[user].values())
                if sum(access) == 3:
                    if index == 0:
                        print(" Full", ' '*(len_pers-len("Full")+2),end='|')
                    elif index == 1:
                        print(" Full", ' '*(len_acc-len("Full")+4),end='|')
                    else:
                        print(" Full", ' '*(len(file.file_name)-len("Full")), end='|')
                elif sum(access) == 0:
                    if index == 0:
                        print(" Denied", ' '*(len_pers-len("Denied")+2),end='|')
                    elif index == 1:
                        print(" Denied", ' '*(len_acc-len("Denied")+4), end='|')
                    else:
                        print(" Denied", ' '*(len(file.file_name)-len("Denied")), end='|')
                else:
                    for index_role, value in enumerate(access):
                        if value == False: access[index_role] = '-'
                        elif index_role == 0: access[index_role] = 'r'
                        elif index_role == 1: access[index_role] = 'w'
                        elif index_role == 2: access[index_role] = 's'
                    access = "".join(access)
                    if index == 1:
                        print(f' {access}', ' '*(len_acc-len(access)+4), end='|')
                    else:    
                        print(f' {access}', ' '*(len(file.file_name)-len(access)), end='|')
                    
            print()
        print(sep_row, end='')
        for index, file in enumerate(self.list_files): 
            if index < 2:
                continue
            print('-'*(len(file.file_name)+2), end='|')

    def access_verificate(self, username, filename, action):            
        list_filenames = [file.file_name for file in self.list_files]
        file = self.list_files[list_filenames.index(filename)]
        if file.rolls[username][action]: return self.SUCESS
        else: return self.BAD_CODE
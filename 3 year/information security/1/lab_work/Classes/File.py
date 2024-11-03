class File:
    file_name = ''
    rolls = {}
    
    def __init__(self,
                 file_name = '',
                 rolls = {},
                ):
        self.file_name = file_name
        self.rolls = rolls
         
    def set_filename(self, name):
        self.file_name = name
        
    def get_filename(self):
        return self.file_name

    def set_rolls(self, rolls):
        self.rolls = rolls
        
    def get_rolls(self):
        return self.rolls
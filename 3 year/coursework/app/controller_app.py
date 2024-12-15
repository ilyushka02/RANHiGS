__PAGES__ = {}

def imports():
    from ui.main_window.dashboards.gui import dashboardsWindow
    from ui.autorization.gui import loginWindow
    
    global __PAGES__

    __PAGES__ = {
        'autorization':loginWindow,
        'dashboard':dashboardsWindow
    }

def swap_page(self, name_page: str):
    """
    Method for switching between pages
    Args:
        self - current page
        name_page - the name of the page to go to
    """
    imports()
    print(f"Log:{str(self.title).split('.!')[-1]} --> close")
    self.destroy()
    print(f"Log:{str(self.title).split('.!')[-1]} --> {name_page}")
    __PAGES__[name_page.lower()]()
    

def exit(self):
    """
    Method for exiting the app
    Args:
        self - current page
    """    
    print(f"Log:{str(self.title).split('.!')[-1]} --> exit")
    self.destroy()

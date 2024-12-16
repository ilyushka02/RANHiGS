import pandas as pd
import plotly.express as px
import plotly.graph_objects as go 

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

def create_diagram(data: list, columns_name:list, name_diagram:str):
    df = pd.DataFrame(data, columns=columns_name)
    fig = go.Figure()

    fig.add_trace(go.Bar(
        x=df[columns_name[0]].to_list(),
        y=df[columns_name[1]].to_list()))
    
    fig.update(layout_showlegend=False)
    fig.update_layout(margin=dict(l=0, r=0, t=0, b=0))
    # Сохраняем график в PNG
    fig.write_image(r"D:\РАНХиГС\RANHiGS\3 year\coursework\app\ui\main_window\dashboards\assets\frame0"+f"\{name_diagram}", width=630, height=160)
    

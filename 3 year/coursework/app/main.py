import tkinter as tk
from ui.autorization.gui import loginWindow
from ui.main_window.dashboards.gui import dashboardsWindow
# Main window constructor
root = tk.Tk()  # Make temporary window for app to start
root.withdraw()  # WithDraw the window


if __name__ == "__main__":
    
    # loginWindow()
    dashboardsWindow()

    root.mainloop()
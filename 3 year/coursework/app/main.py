import tkinter as tk
from ui.autorization.gui import loginWindow
from ui.main_window.loans.gui import loansWindow
# Main window constructor
root = tk.Tk()  # Make temporary window for app to start
root.withdraw()  # WithDraw the window


if __name__ == "__main__":
    
    # loginWindow()
    loansWindow()

    root.mainloop()
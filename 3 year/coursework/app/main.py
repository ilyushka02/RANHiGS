import tkinter as tk
from ui.autorization.gui import loginWindow
# Main window constructor
root = tk.Tk()  # Make temporary window for app to start
root.withdraw()  # WithDraw the window


if __name__ == "__main__":

    loginWindow()

    root.mainloop()
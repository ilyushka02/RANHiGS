from pathlib import Path
# Explicit imports to satisfy Flake8
from tkinter import Toplevel , Canvas, Button, PhotoImage
from controller_app import swap_page, exit


OUTPUT_PATH = Path(__file__).parent
ASSETS_PATH = OUTPUT_PATH / Path(r".\assets\frame0")

def relative_to_assets(path: str) -> Path:
    return ASSETS_PATH / Path(path)

def dashboardsWindow():
    Dashboard()

class Dashboard(Toplevel):

    def __init__(self, *args, **kwargs):

        Toplevel.__init__(self, *args, **kwargs)

        self.title("Dashboard - СБС Банк")

        self.geometry("913x570")
        self.configure(bg="#FFFFFF")

        self.canvas = Canvas(
            self,
            bg = "#FFFFFF",
            height = 570,
            width = 913,
            bd = 0,
            highlightthickness = 0,
            relief = "ridge"
        )

        self.canvas.place(x = 0, y = 0)
        
        image_image_1 = PhotoImage(
            file=relative_to_assets("image_1.png"))
        
        image_1 =self.canvas.create_image(
            105.0,
            285.0,
            image=image_image_1
        )

        button_image_1 = PhotoImage(
            file=relative_to_assets("button_1.png"))
        button_1 = Button(
            self.canvas,
            image=button_image_1,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: exit(self),
            relief="flat"
        )
        button_1.place(
            x=9.0,
            y=520.0,
            width=194.0,
            height=41.0
        )

        button_image_2 = PhotoImage(
            file=relative_to_assets("button_2.png"))
        button_2 = Button(
            self.canvas,
            image=button_image_2,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_2 clicked"),
            relief="flat"
        )
        button_2.place(
            x=20.0,
            y=104.0,
            width=172.0,
            height=30.0
        )

        button_image_3 = PhotoImage(
            file=relative_to_assets("button_3.png"))
        button_3 = Button(
            self.canvas,
            image=button_image_3,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_3 clicked"),
            relief="flat"
        )
        button_3.place(
            x=20.0,
            y=146.0,
            width=172.0,
            height=33.0
        )

        button_image_4 = PhotoImage(
            file=relative_to_assets("button_4.png"))
        button_4 = Button(
            self.canvas,
            image=button_image_4,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_4 clicked"),
            relief="flat"
        )
        button_4.place(
            x=20.0,
            y=278.0,
            width=172.0,
            height=32.0
        )

        button_image_5 = PhotoImage(
            file=relative_to_assets("button_5.png"))
        button_5 = Button(
            self.canvas,
            image=button_image_5,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_5 clicked"),
            relief="flat"
        )
        button_5.place(
            x=20.0,
            y=229.0,
            width=172.0,
            height=41.0
        )

        button_image_6 = PhotoImage(
            file=relative_to_assets("button_6.png"))
        button_6 = Button(
            self.canvas,
            image=button_image_6,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_6 clicked"),
            relief="flat"
        )
        button_6.place(
            x=20.0,
            y=187.0,
            width=172.0,
            height=34.0
        )

        button_image_7 = PhotoImage(
            file=relative_to_assets("button_7.png"))
        button_7 = Button(
            self.canvas,
            image=button_image_7,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_7 clicked"),
            relief="flat"
        )
        button_7.place(
            x=19.0,
            y=322.0,
            width=172.0,
            height=52.0
        )

        image_image_2 = PhotoImage(
            file=relative_to_assets("image_2.png"))
        image_2 =self.canvas.create_image(
            3.0,
            123.0,
            image=image_image_2
        )

        image_image_3 = PhotoImage(
            file=relative_to_assets("image_3.png"))
        image_3 =self.canvas.create_image(
            566.0,
            184.0,
            image=image_image_3
        )

        image_image_4 = PhotoImage(
            file=relative_to_assets("image_4.png"))
        image_4 =self.canvas.create_image(
            566.0,
            384.0,
            image=image_image_4
        )

        image_image_5 = PhotoImage(
            file=relative_to_assets("image_5.png"))
        image_5 =self.canvas.create_image(
            339.0,
            103.0,
            image=image_image_5
        )

        image_image_6 = PhotoImage(
            file=relative_to_assets("image_6.png"))
        image_6 =self.canvas.create_image(
            566.0,
            284.0,
            image=image_image_6
        )

        image_image_7 = PhotoImage(
            file=relative_to_assets("image_7.png"))
        image_7 = self.canvas.create_image(
            566.0,
            484.0,
            image=image_image_7
        )

        image_image_8 = PhotoImage(
            file=relative_to_assets("image_8.png"))
        image_8 = self.canvas.create_image(
            566.0,
            103.0,
            image=image_image_8
        )

        image_image_9 = PhotoImage(
            file=relative_to_assets("image_9.png"))
        image_9 = self.canvas.create_image(
            793.0,
            103.0,
            image=image_image_9
        )




        self.resizable(False, False)
        self.mainloop()
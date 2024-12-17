
# This file was generated by the Tkinter Designer by Parth Jadhav
# https://github.com/ParthJadhav/Tkinter-Designer


from pathlib import Path

# from tkinter import *
# Explicit imports to satisfy Flake8
from tkinter import Toplevel, Canvas, Entry, Button, PhotoImage, StringVar
from tkinter.ttk import Treeview
import database_connector as db_connect


OUTPUT_PATH = Path(__file__).parent
ASSETS_PATH = OUTPUT_PATH / Path(r".\assets\frame0")


def relative_to_assets(path: str) -> Path:
    return ASSETS_PATH / Path(path)

def loansWindow():    
    Loans()

class Loans(Toplevel):
    data = {}

   
    def __init__(self, *args, **kwargs):
        Toplevel.__init__(self, *args, **kwargs)

        self.title("Loans - СБС Банк")
        
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
        image_1 = self.canvas.create_image(
            437.0,
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

        button_image_8 = PhotoImage(
            file=relative_to_assets("button_8.png"))
        button_8 = Button(
            self.canvas,
            image=button_image_8,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_8 clicked"),
            relief="flat"
        )
        button_8.place(
            x=239.0,
            y=308.0,
            width=94.0,
            height=22.0
        )

        button_image_9 = PhotoImage(
            file=relative_to_assets("button_9.png"))
        button_9 = Button(
            self.canvas,
            image=button_image_9,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_9 clicked"),
            relief="flat"
        )
        button_9.place(
            x=363.0,
            y=308.0,
            width=94.0,
            height=22.0
        )

        button_image_10 = PhotoImage(
            file=relative_to_assets("button_10.png"))
        button_10 = Button(
            self.canvas,
            image=button_image_10,
            borderwidth=0,
            highlightthickness=0,
            command=lambda: print("button_10 clicked"),
            relief="flat"
        )
        button_10.place(
            x=487.0,
            y=308.0,
            width=94.0,
            height=22.0
        )


        entry_image_1 = PhotoImage(
            file=relative_to_assets("entry_1.png"))
        
        entry_bg_1 = self.canvas.create_image(
            339.5,
            388.0,
            image=entry_image_1
        )
        self.entry_1 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_1.place(
            x=250.0,
            y=375.0,
            width=179.0,
            height=24.0
        )

        entry_bg_2 = self.canvas.create_image(
            557.5,
            388.0,
            image=entry_image_1
        )
        self.entry_2 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_2.place(
            x=468.0,
            y=375.0,
            width=179.0,
            height=24.0
        )

        entry_bg_3 = self.canvas.create_image(
            775.5,
            388.0,
            image=entry_image_1
        )
        self.entry_3 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_3.place(
            x=686.0,
            y=375.0,
            width=179.0,
            height=24.0
        )

        entry_bg_4 = self.canvas.create_image(
            339.5,
            466.0,
            image=entry_image_1
        )
        self.entry_4 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_4.place(
            x=250.0,
            y=453.0,
            width=179.0,
            height=24.0
        )

        entry_bg_5 = self.canvas.create_image(
            557.5,
            466.0,
            image=entry_image_1
        )
        self.entry_5 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_5.place(
            x=468.0,
            y=453.0,
            width=179.0,
            height=24.0
        )

        entry_bg_6 = self.canvas.create_image(
            775.5,
            466.0,
            image=entry_image_1
        )
        self.entry_6 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_6.place(
            x=686.0,
            y=453.0,
            width=179.0,
            height=24.0
        )

        entry_bg_7 = self.canvas.create_image(
            339.5,
            541.0,
            image=entry_image_1
        )
        self.entry_7 = Entry(
            self.canvas,
            bd=0,
            bg="#D9D9D9",
            fg="#000716",
            highlightthickness=0
        )
        self.entry_7.place(
            x=250.0,
            y=528.0,
            width=179.0,
            height=24.0
        )

        self.columns = {
            "ID": "Res. ID",
            "Сумма": "Room ID",
            "% Cтавка": "Check In Time",
            "Дата начала": "Check Out Time",
            "Дата окончания": "Meal",
            "Статус": "Status",
            "Организация": "Guest ID",
            "Возвращенная сумма": "Status",
        }

        self.treeview = Treeview(
            self,
            columns=list(self.columns.keys()),
            show="headings",
            height=200,
            selectmode="browse",
        )

        # Show the headings
        self.treeview.heading(list(self.columns.keys())[0], text="ID")
        self.treeview.heading(list(self.columns.keys())[1], text="Сумма")
        self.treeview.heading(list(self.columns.keys())[2], text="% Cтавка")
        self.treeview.heading(list(self.columns.keys())[3], text="Дата начала")
        self.treeview.heading(list(self.columns.keys())[4], text="Дата окончания")
        self.treeview.heading(list(self.columns.keys())[5], text="Статус")
        self.treeview.heading(list(self.columns.keys())[6], text="Организация")
        self.treeview.heading(list(self.columns.keys())[7], text="Возвращенная сумма")

        # Set the column widths
        self.treeview.column(list(self.columns.keys())[0], width=10)
        self.treeview.column(list(self.columns.keys())[1], width=50)
        self.treeview.column(list(self.columns.keys())[2], width=50)
        self.treeview.column(list(self.columns.keys())[3], width=20)
        self.treeview.column(list(self.columns.keys())[4], width=50)
        self.treeview.column(list(self.columns.keys())[5], width=50)
        self.treeview.column(list(self.columns.keys())[6], width=50)
        self.treeview.column(list(self.columns.keys())[7], width=50)

        self.treeview.place(x=248.0, y=75.0, width=610.0, height=180.0)

        # Insert data
        # self.handle_refresh()
        # def show_data(self):
        # Очистка таблицы перед обновлением данных
        for i in self.treeview.get_children():
            self.treeview.delete(i)
        
        # Получение данных из базы данных
        rows = db_connect.get_loans()
        # Заполнение таблицы данными
        for row in rows:
            self.treeview.insert('', "end", values=row)

        # Add selection event
        self.treeview.bind("<<TreeviewSelect>>", self.on_treeview_select)
        
        self.resizable(False, False)
        self.mainloop()


    def on_treeview_select(self, event=None):
        try:
            self.treeview.selection()[0]
        except:
            self.parent.selected_rid = None
            return
        # Get the selected item
        item = self.treeview.selection()[0]

        values = self.treeview.item(item, "values")
        
        if values:
            self.entry_1.delete(0, 'end')
            self.entry_2.delete(0, 'end')
            self.entry_3.delete(0, 'end')
            self.entry_4.delete(0, 'end')
            self.entry_5.delete(0, 'end')
            self.entry_6.delete(0, 'end')
            self.entry_7.delete(0, 'end')

            self.entry_1.insert(0, values[1])
            self.entry_2.insert(0, values[2])
            self.entry_3.insert(0, values[3])
            self.entry_4.insert(0, values[4])
            self.entry_5.insert(0, values[5])
            self.entry_6.insert(0, values[6])
            self.entry_7.insert(0, values[7])
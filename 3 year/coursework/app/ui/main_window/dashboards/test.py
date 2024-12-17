import tkinter as tk

# Создаем главное окно приложения
root = tk.Tk()
root.title("Пример таблицы")

# Функция для создания строки таблицы
def create_row(row_index, column_names):
    for i, name in enumerate(column_names):
        label = tk.Label(root, text=name, borderwidth=1, relief="solid")
        label.grid(row=row_index, column=i, padx=1, pady=1)

# Заголовки столбцов
column_names = ["Имя", "Возраст", "Город"]
create_row(0, column_names)

# Данные для строк
data_rows = [
    ("Иван", "25", "Москва"),
    ("Анна", "30", "Санкт-Петербург"),
    ("Сергей", "28", "Новосибирск")
]

for row_index, data in enumerate(data_rows, start=1):
    create_row(row_index, data)

# Запускаем основной цикл приложения
root.mainloop()

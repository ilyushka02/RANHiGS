import tkinter as tk
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

# Создаем главное окно приложения
root = tk.Tk()
root.title("Столбчатая диаграмма")

# Данные для графика
labels = ['Январь', 'Февраль', 'Март', 'Апрель']
values = [1000, 1200, 900, 1500]

# Создаем фигуру Matplotlib
fig = Figure(figsize=(6, 4), dpi=100)
ax = fig.add_subplot(111)

# Строим столбчатую диаграмму
ax.bar(labels, values, color='skyblue')

# Добавляем заголовок и подписи осей
ax.set_title('Продажи за первый квартал')
ax.set_xlabel('Месяцы')
ax.set_ylabel('Объем продаж ($)')

# Создаем объект Canvas для отображения графика в Tkinter
canvas = FigureCanvasTkAgg(fig, master=root)
canvas.draw()
canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)

# Запускаем главный цикл обработки событий
root.mainloop()
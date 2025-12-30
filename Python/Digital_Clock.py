from tkinter import Tk
from tkinter import Label
import time

root = Tk()
root.title("Digital Clock")

def present_time():
    display_time = time.strftime("%H:%M:%S %p")
    digi_clock.config(text=display_time)
    digi_clock.after(1000, present_time)

digi_clock = Label(root, font=("Arial", 80), bg="Red", fg="Yellow")
digi_clock.pack(anchor='center')

present_time()
root.mainloop()

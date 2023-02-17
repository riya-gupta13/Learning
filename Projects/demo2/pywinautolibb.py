from pywinauto import  application
import time

app= application.Application()
app.start("Notepad.exe")
time.sleep(3)
app.Notepad.edit.type_keys("Hello World")
time.sleep(2)
# app.Notepad.MenuSelect("File ->SaveAs")
# app.SaveAs.edit.SetText("pywinautodemos.txt")
# app.SaveAs.Save.Click()
# or
app.Notepad.menu_select("File ->Exit")
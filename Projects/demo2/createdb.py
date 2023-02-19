import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root", passwd="rootroot")
mycursor=mydb.cursor()
# Creating database
# mycursor.execute("Create database newdb")

# Displaying all database
mycursor.execute("show databases")
for db in mycursor:
    print(db)
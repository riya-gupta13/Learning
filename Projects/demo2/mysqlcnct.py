import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root", passwd="rootroot")
if (mydb):
    print('connection successful')
else:
    print("connection unsuccessful")
import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root", passwd="rootroot",database="newdb")
mycursor=mydb.cursor()

# Creating table
# mycursor.execute("Create table employee(name varchar(100), salary int(20))")

# Displaying
# mycursor.execute("show tables")
# for t in mycursor:
#     print(t)

# # Inserting
# sqlform = "Insert into employee(name,salary) values(%s, %s)"
# employees=[("Riya", 20000), ("mahima",25000),]
# mycursor.executemany(sqlform, employees)
# mydb.commit()

# # Reading
# mycursor.execute("Select * from employee")
# result=mycursor.fetchall()
# # For one row use fetchone
# for data in result:
#     print(data)

# # Update
# sql="UPDATE employee SET salary=30000 WHERE name='Riya'"
# mycursor.execute(sql)
# mydb.commit()

# Delete

sql= "DELETE from employee WHERE name='mahima'"
mycursor.execute(sql)
mydb.commit()
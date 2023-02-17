import smtplib
sender= "riya130498@gmail.com"
receiver= "riya130498@gmail.com"
message="Hello"
password=input("Enter your password: ")
server= smtplib.SMTP("smtp.gmail.com", 587)
server.starttls()
# for authenticate
server.login(sender,password)
print("Login success")
server.sendmail(sender,
                receiver,
                message)
print("Email sent", receiver)
# server.quit()
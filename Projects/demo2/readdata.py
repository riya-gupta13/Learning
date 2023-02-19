import json
# read
file= open('employee.json','r')
jsondata= file.read()

# parse
obj=json.loads(jsondata)

print(str(obj['username']))
print(str(obj['role']))

list=obj['role']
for rolename in list:
    print(list['rolename'])

# for i in range(len(list)):
#     print('rolename:', list[i].get('rolename'))
#     print('roleid:', list[i].get('roleid'))
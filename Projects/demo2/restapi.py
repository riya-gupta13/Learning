from flask import Flask, jsonify
app= Flask(__name__)

employees = [{
    'empid':1,
    'name':"Riya",
    'sal':25000},
    {
    'empid':2,
    'name':"Rifka",
    'sal':30000},
    {
    'empid':3,
    'name':"Mahima",
    'sal':25000
    }
]

@app.route('/')
def index():
    return "Welcome Back"

@app.route('/users', methods=['GET'])
def getemp():
    return jsonify({'Employees': employees})

@app.route('/users/<int:empid>',methods=['GET'])
def getempbyname(empid):
    return jsonify({'employee': employees[empid]})

@app.route('/users', methods=['POST'])
def create():
    emp= {
    'empid':5,
    'name':"akshita",
    'sal':25000
    }
    employees.append(emp)
    return jsonify({'Created':emp})

@app.route('/users/<int:empid>',methods=['PUT'])
def update(empid):
    employees[empid]['name']= "sdfgh"
    return jsonify({'emp': employees[empid]})

@app.route('/users/<int:empid>',methods=['DELETE'])
def deleted(empid):
    employees.remove(employees[empid])
    return jsonify({'deleted': True})
if(__name__ =="__main__"):
    app.run(debug=True)
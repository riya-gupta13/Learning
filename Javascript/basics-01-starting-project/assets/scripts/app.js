// assignment 1-- VARIABLES
let user_input = 13;
let result;
result += user_input + 18;
result -= 2;
result *= 3;
result = result / 2;
alert(user_input);
alert(result);

// assignment 2-- FUNCTIONS
function first() {
  alert("Hi Murali");
}
function second(name) {
  alert("This is" + name);
}
const task3Element = document.getElementById("task-3");
task3Element.addEventListener("click", first);

function third(a, b, c) {
  result = a + b + c;
  alert(result);
}
first();
second("Rifka");
third("hi", "There", "!!");

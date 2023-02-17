
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
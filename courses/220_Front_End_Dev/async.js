function makeLogger(number) {
  return function() {
    console.log(number); 
  }
}

function delayLog() {
  for (var i = 1; i <= 10; i++) {
    setTimeout(makeLogger(i), i * 1000);
  }
}

//delayLog();

function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}

function startCounting() {
  var i = 0;

  var id = setInterval(function() { 
    console.log(i);
    i++;
  }, 1000);

  return id;
}

function stopCounting(id) {
  clearInterval(id);
}

var id = startCounting();
stopCounting(id);

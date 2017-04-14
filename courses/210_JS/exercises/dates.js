// today
var today = new Date();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

function dateSuffix(dayOfMonth) {
  var suffix = 'th';
  var dateString = dayOfMonth.toString();
  var digit;

  if (dateString.length === 1 ) {
    digit = dateString[0];
  } else if (dateString[0] !== '1') {
    digit = dateString[1];
  }

  if (digit === '1') {
    suffix = 'st';
  } else if (digit === '2') {
    suffix = 'nd';
  } else if (digit === '3') {
    suffix = 'rd';
  }

  return String(dayOfMonth) + suffix;
}

function formattedMonth() {
  return months[today.getMonth()] 
}

function formattedDay() {
  return daysOfWeek[today.getDay()] 
}

function formattedDate() {
  return "Today's day is " + formattedDay() + ', ' + formattedMonth() + ' ' + dateSuffix(today.getDate()) + '.';
}

//console.log(formattedDate());

function formatTime(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();

  return addZero(hours) + ':' + addZero(minutes);
}

function addZero(val) {
  return String(val).length < 2 ? '0' + val : val;  
}

console.log(formatTime(today));

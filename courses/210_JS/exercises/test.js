// mid-way Test

function isEmpty(value) {
  var type = typeof value;

  if (type === 'string' || Array.isArray(value)) {
    return value.length === 0;
  } else if (type === 'object') {
    return Object.keys(value).length === 0;
  }
}

console.log(isEmpty({}));                 // true
console.log(isEmpty({ name: 'Janice' })); // false

console.log(isEmpty(''));                 // true
console.log(isEmpty('Janice'));           // false

console.log(isEmpty([]));                 // should return true
console.log(isEmpty(['Janice']));         // false  

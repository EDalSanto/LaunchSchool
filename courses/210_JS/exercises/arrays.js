function unshift(array, newVal) {
  // Iterate through array backwards to not overwrite numbers I need to later copy
  for (var i = array.length; i > 0; i--) {
    array[i] = array[i - 1];
  }

  array[0] = val;
  return array.length;
}

function shift(array) {
  var toReturn = array[0];

  for (var i = 0; i < array.length; i++) {
    array[i] = array[i + 1];
  }

  array.length -= 1;
  return toReturn;
}

function slice(array, start, end) {
  var newArr = [];

  for (var i = start; i < end; i++) {
    newArr.push(array[i])
  }

  console.log(newArr);
}

//slice([1, 2, 3, 4, 5], 0, 2);                         // [ 1, 2 ]
//slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3);     // [ 'b', 'c' ]

function splice(arr, startIndex, valsToRemove) {
  var spliced = arr.slice(startIndex, startIndex + valsToRemove);

  arr[startIndex] = arr[startIndex + valsToRemove];
  arr.length = arr.length - valsToRemove;

  return spliced;
}

//var count = [1, 2, 3, 4, 5, 6, 7, 8];
//console.log(splice(count, 2, 5));        // [ 3, 4, 5, 6, 7 ]
//console.log(count);                      // [ 1, 2, 8]

function join(arr, separator) {
  var str = '';

  for (var i = 0; i < arr.length - 1; i++) {
    str += String(arr[i]) + separator; 
  }
  
  str += arr[arr.length - 1];

  return str;
}

//console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
//console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'

function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) { return false };

  for (var i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) { return false };
  }

  return true;
}

//console.log(arraysEqual([1], [1]));                               // true
//console.log(arraysEqual([1], [2]));                               // false
//console.log(arraysEqual([1, 2], [1, 2, 3]));                      // false
//console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));       // true
//console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));      // false
//console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]));    // false
//console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));       // false

function combinedArray(even, odd) {
  var newArr = [];

  for (var i = 0; i < even.length; i++) {
    newArr.push(even[i]);
    newArr.push(odd[i]);
  }

  return newArr;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

//console.log(combinedArray(digits, letters)); // Returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]

function mirroredArray(arr) {
  arr.concat(arr.slice().reverse());
}

//var digits = [4, 8, 15, 16, 23, 42];
//mirroredArray(digits); // Returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]
//

function joinArray(arr, joiner) {
  var res = '';
  joiner = joiner || '';

  for (var i = 0; i < arr.length - 1; i++) {
    res += arr[i] + joiner; 
  }
  
  res += arr[arr.length - 1];
  return res;
}

//console.log(joinArray(['a', 'b', 'c'], '+')); // Returns "a+b+c"
//console.log(joinArray([1, 4, 1, 5, 9, 2, 7])); // Returns "1415927"

function sortDescending(arr) {
  return arr.slice().sort(function(a, b) { return b - a; });
}

//var array = [23, 4, 16, 42, 8, 15]
//var result = sortDescending(array); // Returns [42, 23, 16, 15, 8, 4]
//console.log(result);   // Logs [42, 23, 16, 15, 8, 4]
//console.log(array);    // Logs [23, 4, 16, 42, 8, 15])

function matrixSums(arr) {
  var sums = [];

  for (var i = 0; i < arr.length; i++) {
    var subArray = arr[i];

    sums.push(subArray.reduce(function(acc, val) { return acc + val }));
  }

  return sums;
}

//console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]])); // Returns [15, 60, 12]

function uniqueElements(arr) {
  var uniqueArr = [];

  for (var i = 0; i < arr.length; i++) {
    if (!uniqueArr.includes(arr[i])) { uniqueArr.push(arr[i]); }
  }

  return uniqueArr;
}

//console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4])); // Returns [1, 2, 4, 3, 5]

function missing(arr) {
  var missingNums = [];

  for (var i = arr[0]; i <= arr[arr.length - 1]; i++) {
    if (!arr.includes(i)) { missingNums.push(i); } 
  }

  return missingNums;
}

//console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
//console.log(missing([1, 2, 3, 4]));                    // []
//console.log(missing([1, 5]));                          // [2, 3, 4]
//console.log(missing([6]));                             // []

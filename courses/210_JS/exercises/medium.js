// Understand the Problem: rotating elements in an array by one to the left
// Input: array
// Ouptput: new array with elements rotated one to left
// Algo:
//   - guard: if argument not array, return undefined
//   - splice all elements except for first then push first element on new array

function rotateArray(arr) {
  if (!Array.isArray(arr)) {
    return;
  } else if (arr.length === 0) {
    return [];
  }

  var rotated = arr.slice(1).concat(arr[0]); 

  return rotated; 
}

//rotateArray([7, 3, 5, 2, 9, 1])   // [3, 5, 2, 9, 1, 7]
//rotateArray(['a', 'b', 'c'])      // ['b', 'c', 'a']
//rotateArray(['a'])                // ['a']
//rotateArray([1, 'a', 3, 'c']);    // [ 'a', 3, 'c', 1 ]
//rotateArray([{a: 2}, [1, 2], 3]); // [ [1, 2], 3, {a: 2} ]
//rotateArray([])                   // []
//
//// return undefined if the argument is not an array
//rotateArray();                    // undefined
//rotateArray(1);                   // undefined
//
//
//// the input array is not mutated
//x = [1, 2, 3, 4]
//rotateArray(x)                  // [2, 3, 4, 1]
//console.log(x)                  // [1, 2, 3, 4]

// input: number and last n digits of number to rotate once to the left
// output: new number with rotated digits
// algo:
//  - Break up string into "not rotate" and "rotate parts"
//  - rotate "rotate parts" like done in previous exercise
//  - combine result and turn into number
function rotateRightmostDigits(number, lastNDigits) {
  var numStr = String(number);
  var toNotRotate = numStr.slice(0, numStr.length - lastNDigits);
  var toRotate = numStr.slice(numStr.length - lastNDigits);
  var rotated = rotateArray(toRotate.split('')).join('');
  
  return parseInt(toNotRotate + rotated);
}

//rotateRightmostDigits(735291, 1) // 735291
//rotateRightmostDigits(735291, 2) // 735219
//rotateRightmostDigits(735291, 3) // 735912
//rotateRightmostDigits(735291, 4) // 732915
//rotateRightmostDigits(735291, 5) // 752913
//rotateRightmostDigits(735291, 6) // 352917
//rotateRightmostDigits(735291, 0) // 735291 
//rotateRightmostDigits(12, 10)    // 21

// input: num to max rotate
// output: maximally rotated number
// rule:
//   - rotateRightMost from num length to 2 
//   - 

function maxRotation(num) {
  for (var i = String(num).length; i >= 2; i--) {
    num = rotateRightmostDigits(num, i);
  }

  console.log(num);
}

//maxRotation(735291)        // 321579
//maxRotation(3)             // 3
//maxRotation(35)            // 53
//maxRotation(105)           // 15 # the leading zero gets dropped
//maxRotation(8703529146)    // 7321609845

function wordToDigit(str) {
  var nums = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  
  nums.forEach(function(num) {
    var re = new RegExp(num, 'gi');
    str = str.replace(re, nums.indexOf(num) + 1);
  });

  console.log(str);
}

//wordToDigit('Please call me at five five five one two three four. Thanks.');
//'Please call me at 5 5 5 1 2 3 4. Thanks.'

// input: number of fib sequence to return 
// output: nth fib number
function fibonacciProcedural(n) {
  var a = 1;
  var b = 1;

  for (var i = n; i > 2; i--) {
    var temp = b;
    b += a;
    a = temp;
  }

  return b;
}

var fibs = { 1: 1, 2: 1 };
function fibMem(n) {
  if (fibs[n]) {
    return fibs[n];
  } else {
    fibs[n] = fibMem(n - 1) + fibMem(n - 2);
    return fibs[n];
  }
}

//console.log(fibMem(50));

// Input: str
// Output: object containing counts of lower, upper, and neighter
function letterPercentages(str) {
  var percentages = {};
  var lowers = str.match(/[a-z]/g) || [];
  var uppers = str.match(/[A-Z]/g) || [];

  percentages['lowerChars'] = (lowers.length / str.length * 100).toFixed(2); 
  percentages['upperChars'] = (uppers.length / str.length * 100).toFixed(2);
  percentages['neither'] = (100 - percentages.lowerChars - percentages.upperChars).toFixed(2); 

  console.log(percentages);
}

//letterPercentages('abCdef 123') // { lowercase: 50.00, uppercase: 10.00, neither: 40.00 }
//letterPercentages('AbCd +Ef')   // { lowercase: 37.50, uppercase: 37.50, neither: 25.00 }
//letterPercentages('123')        // { lowercase: 0.00, uppercase: 0.00, neither: 100.00 }

// input: sides of a triangle
// output: type of triangle
//   rules:
//     - valid: sum of length of two shortest sides must be greater than the length of
//     longest side and all sides must have length > 0
//     - equal: all three same
//     - isoc: 2 equal
//     - scalene: all different
// algo: 
//   - Check validity
//     - find max and two shortest sides

//function notValid(sides, max) {
//  if (sides[0] === 0 || sides[1] === 0 || sides[2] === 0) {
//    return true;
//  }
//
//  var totalPerimeter = sides.reduce(function(sum, side) {
//    return sum + side;
//  });
//
//  var shortestPerimeter = totalPerimeter - max;
//
//  return shortestPerimeter <= max; 
//}
//
//function sideEqualFirst(element, index, array) {
//  return array[0] === element;
//}
//
//function twoSidesEqual(sides) {
//  return sides[0] === sides[1] || sides[0] === sides[2] || sides[1] === sides[2];
//}
//
//function triangle(side1, side2, side3) {
//  var max = Math.max(side1, side2, side3); 
//  var sides = [ side1, side2, side3 ];
//
//  if (notValid(sides, max)) {
//    console.log('invalid');
//  } else if (sides.every(sideEqualFirst)) {
//    console.log('equilateral');
//  } else if (twoSidesEqual(sides)) {
//    console.log('isosceles');
//  } else {
//    console.log('scalene');
//  }
//}

//triangle(3, 3, 3)   // equilateral
//triangle(3, 3, 1.5) // isosceles
//triangle(3, 4, 5)   // scalene
//triangle(0, 3, 3)   // invalid
//triangle(3, 1, 1)   // invalid

function lessThanOrEqualToZero(angle) {
  return angle <= 0;
}

function lessThanNinety(angle) {
  return angle < 90;
}

function equalNinety(angle) {
  return angle === 90;
}

function triangle(angle1, angle2, angle3) {
  var angles = [ angle1, angle2, angle3 ];
  var totalDegrees = angles.reduce(function(sum, angle) {
    return sum + angle;
  });

  if (totalDegrees !== 180 || angles.some(lessThanOrEqualToZero)) {
    console.log('invalid');
  } else if (angles.every(lessThanNinety)) {
    console.log('acute');
  } else if (angles.some(equalNinety)) {
    console.log('right');
  } else {
    console.log('obtuse');
  }
}

//triangle(60, 70, 50)   // acute
//triangle(30, 90, 60)   // right
//triangle(120, 50, 10)  // obtuse
//triangle(0, 90, 90)    // invalid
//triangle(50, 50, 50)   // invalid

function fridayThe13ths(year) {
  var daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  var thirteenths = [];

  for (var i = 0; i < 12; i++) {
    thirteenths.push(new Date(year, i, 13));
  }

  console.log(thirteenths.reduce(function(sum, thirteenth) {
    if (daysOfWeek[thirteenth.getDay()] === 'Friday') {
      return sum + 1;
    } else {
      return sum;
    }
  }, 0));
}

//fridayThe13ths(2015) // 3
//fridayThe13ths(1986) // 1

// input: num
// output: next featured number after num
//   - featured num rule:
//     - odd number
//     - multiple of 7
//     - digits occur exactly once each
// algo:
//   - create isFeaturedNum function checking for above
//   - increment orignal num until next isFeatured found

function digitsOccurOnce(num) {
  var digits = String(num).split('').sort();
  
  for (var i = 0; i < digits.length - 1; i++) {
    if (digits[i] === digits[i + 1]) {
      return false;
    }
  }

  return true;
}

function isFeaturedNum(num) {
  return (num % 2 !== 0) && (num % 7 === 0) && (digitsOccurOnce(num)); 
}

function featured(num) {
  num++;

  while(!isFeaturedNum(num)) {
    num++;
  }

  console.log(num);
}

//featured(12)        // 21
//featured(20)        // 21
//featured(21)        // 35
//featured(997)       // 1029
//featured(1029)      // 1043
//featured(999999)    // 1023547
//featured(999999987) // 1023456987

function sumSquareDifference(num) {
  var sum = 0;
  var squaredSum = 0;

  for (var i = 1; i <= num; i++) {
    sum += i;
    squaredSum += i**2
  }

  console.log(sum**2 - squaredSum);
}

//sumSquareDifference(3)    // 22
//// -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
//sumSquareDifference(10)   // 2640
//sumSquareDifference(1)    // 0
//sumSquareDifference(100)  // 25164150

function isSorted(array) {
  for (var i = 0; i < array.length - 1; i++) {
    if (array[i] > array[i + 1]) {
      return false;
    }
  }

  return true;
}

function swapElements(array, i) {
  var temp = array[i];
  array[i] = array[i + 1];
  array[i + 1] = temp;
}

function bubbleSort(array) {
  while (!isSorted(array)) {
    for (var i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1]) {
        swapElements(array, i);
      }
    }
  }
}

//var array = [5, 3];
//bubbleSort(array);
//console.log(array);     // [3, 5]
//
//array = [6, 2, 7, 1, 4]
//bubbleSort(array);
//console.log(array);     // [1, 2, 4, 6, 7]
//
//array = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
//bubbleSort(array);
//console.log(array);     // ['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler']

// input: nested array
// outputer: transposed array
// algo:
//   - map over length of array[0] to get col and colidx
//   - map over each nested array
//     - select element from col and row
function transpose(matrix) {
  return matrix[0].map(function(col, colIdx) {
    return matrix.map(function(row) {
      return row[colIdx];
    });
  });
}

var matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

var newMatrix = transpose(matrix)

//console.log(newMatrix); // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
//console.log(matrix);    // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
//
//console.log(transpose([[1, 2, 3, 4]]));       // [[1], [2], [3], [4]]
//console.log(transpose([[1], [2], [3], [4]])); // [[1, 2, 3, 4]]
//console.log(transpose([[1]]));                // [[1]]
//console.log(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]));
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
//

// Rotation of 90 degrees same as tranpose but with elements in reverse order
function rotate90(matrix) {
  return matrix[0].map(function(col, colIdx) {
    return matrix.map(function(row) {
      return row[colIdx]; 
    }).reverse();
  });
}

var matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

var matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

var newMatrix1 = rotate90(matrix1);
var newMatrix2 = rotate90(matrix2);
var newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

//console.log(newMatrix1); // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
//console.log(newMatrix2); // [[5, 3], [1, 7], [0, 4], [8, 2]]
//console.log(newMatrix3); // matrix2

// algo:
//   - since both arrays are sorted, we can compare each element at each index
//   and add, then concat when one is empty
function merge(arr1, arr2) {
  var mergedArray = []; 
  var copy1 = arr1.slice();
  var copy2 = arr2.slice();
  var nextToAdd;

  while (copy1.length && copy2.length) {
    if (copy1[0] < copy2[0]) {
      nextToAdd = copy1[0]; 
      copy1.shift();
    } else {
      nextToAdd = copy2.shift()[0];
      copy2.shift();
    }

    mergedArray.push(nextToAdd);
  }

  mergedArray = mergedArray.concat(copy1, copy2);

  return mergedArray;
}

//console.log(merge([1, 5, 9], [2, 6, 8])) // [1, 2, 5, 6, 8, 9]
//console.log(merge([1, 1, 3], [2, 2]))    // [1, 1, 2, 2, 3]
//console.log(merge([], [1, 4, 5]))        // [1, 4, 5]
//console.log(merge([1, 4, 5], []))        // [1, 4, 5]

function mergeSort(arr) {
  if (arr.length === 1) {
    return arr;
  }

  var firstHalf = arr.slice(0, arr.length / 2);
  var secondHalf = arr.slice(arr.length / 2, arr.length);

  firstHalf = mergeSort(firstHalf);
  secondHalf = mergeSort(secondHalf);

  return merge(firstHalf, secondHalf);
}

function binarySearch(arr, searchTerm) {
  var low = 0;
  var high = arr.length - 1;
  var mid = Math.floor((high + low) / 2);

  while (low <= high) {
    if (arr[mid] === searchTerm) {
      return mid;
    } else if (arr[mid] < searchTerm) {
      low = mid + 1; 
    } else {
      high = mid - 1;
    }

    mid = Math.floor((high + low) / 2);
  }

  return -1;
}

//console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 77));                                // -1
//console.log(binarySearch([1, 5, 7, 11, 23, 45, 65, 89, 102], 89));                                // 7
//console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Peter')); // -1
//console.log(binarySearch(['Alice', 'Bonnie', 'Kim', 'Pete', 'Rachel', 'Sue', 'Tyler'], 'Tyler')); // 6

// Problem: 
//   - bank of switches connected to 1 light numbered from 1 to n
//   - each time you walk down the ailse, you toggle all multiples of the number
//   of repitition you're on
//   - go all the way to n repitions
//   - input: n, the number of repitions to perform, or the number of walks down
//   the switch aisle to make toggles
//   - output: an array of switches that will be on
// Algo:
//   - one way:
//     - iterate from i = 1 to n each time in multiples of i and toggle switches
//     that are multiples of those numbers
//   - antoher way:
//     - create obj with pairing between switches on and off and select only
//     keys that are on at the end
function lightsOn(switches) {
  var lightsStates = [ undefined ];
  var on = [];

  for (var i = 1; i <= switches; i++) {
    lightsStates.push(false); 
  }

  for (var i = 1; i <= switches; i++) {
    lightsStates = lightsStates.map(function(value, index) {
      if (index % i === 0 && index !== 0) {
        return !value;
      } else {
        return value;
      }
    });
  }

  lightsStates.forEach(function(light, index) {
    if (light) {
      on.push(index);
    }
  });

  console.log(on);
}

//lightsOn(5);   // [1, 4];
//
//// detailed result of each round for 5 lights
//// Round 1: all lights are on
//// Round 2: lights 2 and 4 are now off; 1, 3, and 5 are on
//// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
//// Round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
//// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
//
//lightsOn(100);  // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
//lightsOn(1);    // all on
//lightsOn(0);    // []

// PEDAC
// Problem: 
//   -input: odd integer that represents center row of diamond
//   -output: diamond with n center row and rows below and above of odd sizes
// Examples: good set already
// Data Structure: none, just log rows 
// Algo:
//   - log top
//     - loop from 1 to n - 2 in increments of 2
//   - lop center
//   - lop bottom
//     - loop from n - 2 in decremenets of 2

function logTop(n) {
  var whitespace;

  for (var i = 1; i <= n - 2; i += 2) {
    whitespace = (n  - i) / 2;
    console.log(' '.repeat(whitespace) + '*'.repeat(i));
  }
}

function logCenter(n) {
  console.log('*'.repeat(n));
}

function logBottom(n) {
  var whitespace;

  for (var i = n - 2; i >= 1; i -= 2) {
    whitespace = (n - i) / 2;
    console.log(' '.repeat(whitespace) + '*'.repeat(i));
  }
}

function diamond(n) {
  logTop(n);
  logCenter(n);
  logBottom(n);
}

//diamond(1);
// logs
//*

//diamond(3);
// logs
// *
//***
// *

//diamond(9);
// logs
//    *
//   ***
//  *****
// *******
//*********
// *******
//  *****
//   ***
//    *

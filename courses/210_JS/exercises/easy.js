//var lengthRoom = parseInt(prompt('Enter the length of the room in meters: '), 10);
//var widthRoom = parseInt(prompt('Enter the width of the room in meters: '), 10); 
//
//var areaMeters = lengthRoom * widthRoom;

//console.log('The area of the room is ' + areaMeters.toFixed(2) + ' square meters');

//var billTotal = parseInt(prompt('What is the bill?'), 10); 
//var tipPercantage = parseInt(prompt('What is the tip percentage?'), 10); 
//var tip = billTotal * (tipPercantage / 100);
//var total = billTotal + tip;
//
//console.log('The tip is $' + tip.toFixed(2)); 
//console.log('The toal is $' + total.toFixed(2)); 

//var input = parseInt(prompt('Please enter an integer greater than 0:'));
//var operation = prompt('Enter "s" to compute the sum, "p" to compute the product.');
//
//function add(max) {
//  var sum = 0;
//
//  for (var i = 1; i <= max; i++) {
//    sum += i;
//  }
//
//  return sum;
//}
//
//function multiply(max) {
//  var product = 1;
//
//  for (var i = 1; i <= max; i++) {
//    product *= i;
//  }
//
//  return product;
//}
//
//if (operation === 'p') {
//  console.log('The product of integers between 1 and ' + input + ' is ' +  multiply(input));
//} else {
//  console.log('The sum of integers between 1 and ' + input + ' is ' +  add(input));
//}

//function shortLongShort(string1, string2) {
//  var longer = (string1.length > string2.length) ? string1 : string2; 
//  var shorter = (longer === string1) ? string2 : string1;
//
//  console.log(shorter + longer + shorter);
//}
//
//shortLongShort('abc', 'defgh');   // "abcdefghabc"
//shortLongShort('abcde', 'fgh');   // "fghabcdefgh"
//shortLongShort('', 'xyz');        // "xyz"

//function isLeapYear(year) {
//  console.log((year % 400 === 0 || (year % 4 === 0 && year % 100 !== 0))) 
//}
//
//isLeapYear(2016);     // true
//isLeapYear(2015);     // false
//isLeapYear(2100);     // false
//isLeapYear(2400);     // true
//isLeapYear(240000);   // true
//isLeapYear(240001);   // false
//isLeapYear(2000);     // true
//isLeapYear(1900);     // false
//isLeapYear(1752);     // true
//isLeapYear(1700);     // false
//isLeapYear(1);        // false
//isLeapYear(100);      // false
//isLeapYear(400);      // true

//function multiSum(num) {
//  var sum = 0;
//
//  for (var i = 1; i <= num; i++) {
//    if (i % 3 === 0 || i % 5 === 0) {
//      sum += i;
//    }
//  }
//
//  console.log(sum);
//}
//
//multiSum(3);      // 3
//multiSum(5);      // 8
//multiSum(10);     // 33
//multiSum(1000);   // 234168

//function asciiValue(string) {
//  var sum = 0;
//
//  for (var i = 0; i < string.length; i++) {
//    sum += String.prototype.charCodeAt(string[i]);
//  }
//
//  return sum;
//}
//
//asciiValue('Four score');         // 984
//asciiValue('Launch School');      // 1251
//asciiValue('a');                  // 97
//asciiValue('');                   // 0

//function crunch(string) {
//  var crunchedStr = '';
//
//  for (var i = 0; i < string.length; i++) {
//    if (string[i + 1] !== string[i]) {
//      crunchedStr += string[i];
//    }
//  }
//
//  console.log(crunchedStr);
//}
//
//crunch('ddaaiillyy ddoouubbllee');        // 'daily double'
//crunch('4444abcabccba');                  // '4abcabcba'
//crunch('ggggggggggggggg');                // 'g'
//crunch('a');                              // 'a'
//crunch('');                               // ''

//function logInBox(string) {
//  var width = string.length + 2;
//
//  console.log('+' + repeatChar(width, '-') + '+'); 
//  console.log('|' + repeatChar(width, ' ') + '|');
//  console.log('| ' + string + ' |');
//  console.log('|' + repeatChar(width, ' ') + '|');
//  console.log('+' + repeatChar(width, '-') + '+'); 
//
//}
//
//function repeatChar(times, char) {
//  var res = '';
//
//  for (var i = 0; i < times; i++) {
//    res += char 
//  }
//
//  return res;
//}
//
//logInBox('To boldly go where no one has gone before.');

//function stringy(num) {
//  var toAdd = '1';
//  var res = '';
//
//  for (var i = 0; i < num; i++) {
//    res += toAdd;
//    toAdd = (toAdd === '1') ? '0' : '1';
//  }
//
//  console.log(res);
//}
//
//stringy(6) // '101010'
//stringy(9) // '101010101'
//stringy(4) // '1010'
//stringy(7) // '1010101'

//function fib(n) {
//  if (n === 0) { 
//    return 0; 
//  } else if (n === 1) {
//    return 1;
//  } else {
//    return fib(n - 1) + fib(n - 2);
//  }
//}
//
//function findFibonacciIndexByLength(num) {
//  var index;
//  var lastFib = fib(0);
//  var n = 1;
//
//  while (String(lastFib).length < num) {
//    lastFib = fib(n);
//    n++;
//  }
//
//  console.log(n - 1);
//}
//
//findFibonacciIndexByLength(2);     // 7
//findFibonacciIndexByLength(10);    // 45
//findFibonacciIndexByLength(16);    // 74

//function twice(num) {
//  var firstHalf = String(num).slice(0, String(num).length / 2);
//  var secondHalf = String(num).slice(String(num).length / 2, String(num).length);
//
//  if (firstHalf === secondHalf) {
//    console.log(num);
//  } else {
//    console.log(num * 2);
//  }
//}
//
//twice(37);                 // 74
//twice(44);                 // 44
//twice(334433);             // 668866
//twice(444);                // 888
//twice(107);                // 214
//twice(103103);             // 103103
//twice(3333);               // 3333
//twice(7676);               // 7676

//function cleanUp(string) {
//  console.log(string.replace(/[^\w]/g, ' ').replace(/\s{2,}/g, ' '));  
//}
//
//cleanUp('---what\'s my +*& line?');      // ' what s my line '

//function century(year) {
//  var century = String(Math.ceil(year / 100));
//  var lastDigit = century[century.length - 1];
//  var lastTwoDigits = Number(century.slice(century.length - 2, century.length))
//
//  if (lastTwoDigits >= 11 && lastTwoDigits <= 19) {
//    console.log(century + 'th'); 
//  }
//    else if (lastDigit === '1') {
//    console.log(century + 'st');
//  } else if (lastDigit === '2') {
//    console.log(century + 'nd');
//  } else if (lastDigit === '3') {
//    console.log(century + 'rd');
//  } else {
//    console.log(century + 'th'); 
//  }
//}
//
//century(2000);        // '20th'
//century(2001);        // '21st'
//century(1965);        // '20th'
//century(256);         // '3rd'
//century(5);           // '1st'
//century(10103);       // '102nd'
//century(1052);        // '11th'
//century(1127);        // '12th'
//century(11201);       // '113th'


//var age = Math.floor(Math.random() * (200 - 20)) + 20;
//console.log('Teddy is ' + age + ' years old');

//var age = parseInt(prompt('What is your age?'));
//var retirementAge = parseInt(prompt('At what age would you like to retire?'));
//var thisYear = new Date().getFullYear();
//var retirementYear = thisYear + (retirementAge - age);
//
//console.log("It's " + thisYear + '. You will retire in ' + retirementYear + '.');
//console.log('You have only ' + (retirementYear - thisYear) + ' years of work to go!');

//function isRealPalindrome(string) {
//  var reversed = string.split('').reverse().join('').toLowerCase();
//
//  console.log(reversed.replace(/[^\w]/gi, '') === string.toLowerCase().replace(/[^\w]/gi, ''));
//}
//
//isRealPalindrome('madam');               // true
//isRealPalindrome('Madam');               // true (case does not matter)
//isRealPalindrome('Madam, I\'m Adam');    // true (only alphanumerics matter)
//isRealPalindrome('356653');              // true
//isRealPalindrome('356a653');             // true
//isRealPalindrome('123ab321');            // false

//function isPalindromicNumber(num) {
//  console.log(String(num).split('').reverse().join('') === String(num));
//}
//
//isPalindromicNumber(34543);        // true
//isPalindromicNumber(123210);       // false
//isPalindromicNumber(22);           // true
//isPalindromicNumber(5);            // true

//function runningTotal(arr) {
//  var sum = 0;
//
//  var totalArr = arr.map(function(el) {
//    return sum += el;
//  });
//
//  console.log(totalArr);
//}
//
//runningTotal([2, 5, 13]);             // [2, 7, 20]
//runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
//runningTotal([3]);                    // [3]
//runningTotal([]);                     // []

//function swap(string) {
//  var swapped = string.split(' ').map(function(word) {
//    var firstLetter = word[0];
//    var lastLetter = word[word.length - 1];
//
//    word = word.replace(/^\w{1}/, lastLetter);
//    word = word.replace(/\w{1}$/, firstLetter);
//
//    return word;
//  });
//
//  console.log(swapped.join(' '));
//}

//function swap(string) {
//  var wordsArray = string.split(' ');
//  
//  var swapped = wordsArray.map(function(word) {
//    return swapFirstLastCharacters(word);
//  });
//
//  console.log(swapped.join(' '));
//}
//
//function swapFirstLastCharacters(word) {
//  return word[word.length - 1] + word.slice(1, word.length - 1) + word[0]; 
//}
//
//swap('Oh what a wonderful day it is');    // 'hO thaw a londerfuw yad ti si'
//swap('Abcde');                            // 'ebcdA'
//swap('a');                                // 'a'

//function incrementProperty(obj, prop) {
//  if (prop in obj) {
//    obj[prop] += 1;
//  } else { 
//    obj[prop] = 1;
//  }
//}
//
//function wordSizes(string) {
//  var obj = {};
//  if (string === '') { return obj; }
//
//  var wordArr = string.split(' ');
//
//  for (var i = 0; i < wordArr.length; i++) {
//    incrementProperty(obj, wordArr[i].replace(/[^A-Za-z]/g, '').length);
//  }
//
//  console.log(obj);
//}
//
//wordSizes('Four score and seven.');                        // { "3": 1, "4": 1, "5": 2 }
//wordSizes('Hey diddle diddle, the cat and the fiddle!');   // { "3": 5, "6": 3 }
//wordSizes('What\'s up doc?');                              // { "5": 1, "2": 1, "3": 1 }
//wordSizes('');                                             // {}

var MINUTES_IN_DEGREE = 60;
var SECONDS_IN_DEGREE = 60 * MINUTES_IN_DEGREE;
var degree = "\xb0";

function dms(degreesFloat) {
  var degreesInt = Math.floor(degreesFloat);
  var degreesMinutes = Math.floor((degreesFloat - degreesInt) * MINUTES_IN_DEGREE);
  var degreesSeconds = Math.floor(((degreesFloat - degreesInt) * SECONDS_IN_DEGREE) % MINUTES_IN_DEGREE);

  console.log(degreesInt + degree + padZeros(degreesMinutes) + "'" + padZeros(degreesSeconds) + '"');
}

function padZeros(number) {
  return String(number).length < 2 ? ('0' + String(number)) : String(number);
}

//dms(30);        // 30°00'00"
//dms(76.73);     // 76°43'48"
//dms(254.6);     // 254°35'59"
//dms(93.034773); // 93°02'05"
//dms(0);         // 0°00'00"
//dms(360);       // 360°00'00" or 0°00'00"

// Input: two arrays 
// Output: one array
//  - represents union(all values of both arrays with no duplication)
//  Algorithm:
//    - create new array initialized to the values(no side effects) of array1
//      - no duplication
//    - iterate through array2 and add number if not already in newArray

function union(array1, array2) {
  var newArr = [];

  for (var i = 0; i < arguments.length; i++) {
    arguments[i].forEach(function(element) {
      if (!newArr.includes(element)) {
        newArr.push(element);
      }
    });
  }

  console.log(newArr);
}

//union([1, 3, 5], [3, 6, 9]); // [1, 3, 5, 6, 9]
//union([1, 1, 3, 5], [3, 6, 9]); // [1, 3, 5, 6, 9]
//union([], [3, 6, 9]); // [3, 6, 9]
//union([], []); // []

// input: one array
// output: two arrays which represent original array divided in half
// Algorithm: 
//   - Create new array that will contain two halves
//   - Push first half of array into result array
//   - Push second half of array into result array

function halvsies(originalArray) {
  var halves = [];
  var midwayIndex = Math.ceil((originalArray.length / 2));
  var firstHalf = originalArray.slice(0, midwayIndex);
  var secondHalf = originalArray.slice(midwayIndex, originalArray.length);

  halves.push(firstHalf);
  halves.push(secondHalf);
  console.log(halves);
}

//halvsies([1, 2, 3, 4])    // [[1, 2], [3, 4]]
//halvsies([1, 5, 2, 4, 3]) // [[1, 5, 2], [4, 3]]
//halvsies([5])             // [[5], []]
//halvsies([])              // [[], []]

// input: array of numbers
// output: number which is duplicated
// Algo:
//  - iterate through input array
//  - store already seen nums in an already-seen array
//  - if num already in already-seen array, return num

function findDup(array) {
  var alreadySeen = [];

  for (var i = 0; i < array.length; i++) {
    if (alreadySeen.includes(array[i])) {
      return array[i];
    }

    alreadySeen.push(array[i]);
  }
}

//console.log(findDup([1, 5, 3, 1]))                              // 1
//console.log(findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
//         38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
//         14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
//         78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
//         89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
//         41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
//         55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
//         85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
//         40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
//         7,  34, 57, 74, 45, 11, 88, 67,  5, 58]))  // 73

// Input: two arrays
// Output: new array that contains all elements from both arrays in alteration
// Algo: 
//   - Create new interleaved array
//   - Iterate through one array
//   - Add current element of array
//   - Add element at same index for other array
//   - Return new interleaved array

function interleave(array1, array2) {
  var newArr = [];

  for (var i = 0; i < array1.length; i++) {
    newArr.push(array1[i], array2[i]);
  }

  return newArr;
}

//console.log(interleave([1, 2, 3], ['a', 'b', 'c'])) // [1, 'a', 2, 'b', 3, 'c']


// Input: array of integers
// Output: string rounded to decimal places of multiplication of all numbers and division by length of array 
// Algo
//   - reduce to value then round
function showMultiplicativeAverage(array) {
  var multiplicationResult = array.reduce(function(acc, value) {
    return acc * value;
  }, 1);

  var divisionResult = multiplicationResult / array.length

  console.log(String(divisionResult.toFixed(3)));
}

//showMultiplicativeAverage([3, 5])                 // '7.500'
//showMultiplicativeAverage([2, 5, 7, 11, 13, 17])  // '28361.667'

// Input: two arrays of numbers
// Output: array of products each pair of numbers at corresponding indexes 
function multiplyList(array1, array2) {
  return array1.map(function(value, index) {
    return value * array2[index];
  });
}

//console.log(multiplyList([3, 5, 7], [9, 10, 11])) // [27, 50, 77]

function digitList(number) {
  return String(number).split('').map(function(value) {
    return parseInt(value);
  });
}

//console.log(digitList(12345));       // [1, 2, 3, 4, 5]
//console.log(digitList(7));           // [7]
//console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
//console.log(digitList(444));         // [4, 4, 4]

function incrementProperty(obj, element) {
  if (element in obj) {
    obj[element]++;
  } else {
    obj[element] = 1;
  }
}

function countOccurrences(array) {
  var obj = {};

  array.forEach(function(element) {
    incrementProperty(obj, element);
  });

  return obj;
}

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck'];
//console.log(countOccurrences(vehicles));

// console output
//car => 4
//truck => 3
//SUV => 1
//motorcycle => 2

function average(array) {
  var avg = Math.floor(array.reduce(function(sum, val) {
    return sum + val;
  }) / array.length);

  console.log(avg);
}

//average([1, 5, 87, 45, 8, 8])    // 25
//average([9, 47, 23, 95, 16, 52]) // 40

var CONSONANTS = 'abcdfghjklmnpqrstvwxyz';

function doubleConsonants(string) {
  console.log(string.split('').map(function(ch) {
    if (!!ch.match(/[abcdfghjklmnpqrstvwxyz]/i)) {
      return ch.repeat(2);
    } else {
      return ch;
    }
  }).join(''));
}

//repeater('Hello')     // "HHeelllloo"
//repeater("Good job!") // "GGoooodd  jjoobb!!"
//repeater('')          // ''

//doubleConsonants('String')       // "SSttrrinngg"
//doubleConsonants('Hello-World!') // "HHellllo-WWorrlldd!"
//doubleConsonants('July 4th')     // "JJullyy 4tthh"
//doubleConsonants('')             // ""

function reversedNumber(originalNumber) {
  var reversedNumberStr = String(originalNumber).split('').reverse().join('')
 
  console.log(parseInt(reversedNumberStr, 10));
}

//reversedNumber(12345); // 54321
//reversedNumber(12213); // 31221
//reversedNumber(456);   // 654
//reversedNumber(12000); // 21 # Note that zeros get dropped!
//reversedNumber(1);     // 1

function centerOf(str) {
  var center = Math.floor(str.length / 2);

  if ((str.length % 2) === 0) {
    console.log(str.substr(center - 1, 2));
  } else {
    console.log(str.substr(center, 1)); 
  }
}

//centerOf('I love ruby')    // 'e'
//centerOf('Launch School')  // ' '
//centerOf('Launch')         // 'un'
//centerOf('Launchschool')   // 'hs'
//centerOf('x')              // 'x'

function negative(number) {
  if (number >= 0) {
    return number * -1;
  } else {
    return number
  }
}

//negative(5)  // -5
//negative(-3) // -3
//negative(0)  // -0

function sequence(number) {
 var seq = [];
  
  for (var i = 1; i <= number; i++) {
    seq.push(i);
  }

  return seq;
}

//sequence(5) // [1, 2, 3, 4, 5]
//sequence(3) // [1, 2, 3]
//sequence(1) // [1]

function swapName(name) {
  return name.split(' ').reverse().join(', ');
}

//swapName('Joe Roberts') // 'Roberts, Joe'

function sequence(count, firstNumber) {
  var seq = [];

  for (var i = 1; i <= count; i++) {
    seq.push(i * firstNumber);
  }

  console.log(seq);
}

//sequence(5, 1)       // [1, 2, 3, 4, 5]
//sequence(4, -7)      // [-7, -14, -21, -28]
//sequence(3, 0)       // [0, 0, 0]
//sequence(0, 1000000) // []

function reverseSentence(string) {
  var words = string.split(' ');
  var reversedWords = [];
  
  for (var i = words.length - 1; i >= 0; i--) {
    reversedWords.push(words[i]);
  }

  console.log(reversedWords.join(' '));
}

//reverseSentence('');                     // ''
//reverseSentence('Hello World');          // 'World Hello'
//reverseSentence('Reverse these words');  // 'words these Reverse'

function reverseWords(string) {
  var words = string.split(' ');
  
  var res = words.map(function(word) {
    if (word.length >= 5) {
      return word.split('').reverse().join('');
    } else {
      return word;
    }
  }).join(' ');

  console.log(res);
}

//reverseWords('Professional');          // lanoisseforP
//reverseWords('Walk around the block'); // Walk dnuora the kcolb
//reverseWords('Launch School');         // hcnuaL loohcS

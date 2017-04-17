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

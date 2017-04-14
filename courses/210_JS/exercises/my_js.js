// Odd Numbers
// - input: positive integer 
// - output: all odd numbers from 1 up to integer

function logOddNumbers(num) {

  for (var i = 1; i <= num; i += 2) {
    console.log(i);
  }
}

//logOddNumbers(19);

// multipleOfThreeAndFive
// - input: none
// - ouput: all numbers that are multiples of 3 or 5 between 1 and 100 inclusive 
//          - special case: add bang to num if multiple of both

function multipleOfThreeAndFive() {
  for (var i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(i + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(i);
    }
  }
}

//multipleOfThreeAndFive();

// logMultiples
// - input: positive integer
// - output: all odd multiples of number between 1 and 100

function logMultiples(num) {
  for (var i = 1; i <= 100; i++) {
    if (i % num === 0 && i % 2 === 1) {
      console.log(i);
    }
  }
}

//logMultiples(21);
//logMultiples(17);

// FizzBuzz

function FizzBuzz() {
  for (var i = 1; i <= 100; i++) {
    var message = '';
    
    if (i % 3 === 0) {
      message += 'Fizz';
    } 
    if (i % 5 === 0) {
      message += 'Buzz'; 
    }

    console.log(message || i);
  }
}

//FizzBuzz();

// isPrime

function isPrime(num) {

  if (num === 2 || num === 3) { return true; }

  if (num % 2 === 0 || num % 3 === 0 || num === 1) { return false; }

  var i = 5
  var w = 2

  while (i * i <= num) {
    if (num % i == 0) { return false; }

    i += w
    w = 6 - w
  }
  return true;  
}

//console.log(isPrime(1));  // false
//console.log(isPrime(2));  // true
//console.log(isPrime(3));  // true
//console.log(isPrime(43)); // true
//console.log(isPrime(55)); // false
//console.log(isPrime(0));  // false
//

// XOR => only one of the two conditions needs to be true

function isXor(val1, val2) {
  return ((!!val1 && !val2) || (!val1 && !!val2));
}

//console.log(isXor(false, true));     // true
//console.log(isXor(true, false));     // true
//console.log(isXor(false, false));    // false
//console.log(isXor(true, true));      // false
//
//console.log(isXor(false, 3));        // true
//console.log(isXor('a', undefined));  // true
//console.log(isXor(null, ''));        // false
//console.log(isXor('2', 23));         // false

// Password Guessing Program

//var password = 'password';
//var guesses = 0;
//var guessed = false;
//
//while (guesses < 3 && !guessed) {
//  var guess = prompt('What\'s the password?');
//  guessed = (password === guess);
//  guesses++;
//}

// Student Grading

//var grade1 = Number(prompt('Enter Score 1: '));
//var grade2 = Number(prompt('Enter Score 2: '));
//var grade3 = Number(prompt('Enter Score 3: '));
//var average = (grade1 + grade2 + grade3) / 3;
//
//if (average >= 90) {
//  console.log('A');
//} else if (average >= 70) {
//    console.log('B');
//} else if (average >= 50) {
//    console.log('C');
//} else {
//    console.log('F');
//}
//

// GCD

function gcd(num1, num2) {
  if (num2 === 0) {
    return num1;
  } else {
    return gcd(num2, num1 % num2);
  }
}

//gcd(12, 4);   // 4
//gcd(15, 10);  // 5
//gcd(9, 2);    // 1

// Pattern Generation
// input: num rows
// output: square of numbers and asteriks

function generatePattern(rows) {
  for (var i = 1; i <= rows; i++) {
    var row = '';
    var ast = rows - i;

    for (var num = 1; num <= i; num++) {
      row += num;
    }

    row += '*'.repeat(ast); 
    
    console.log(row);
  }
}

//generatePattern(20);

function toLowerCase(string) {
  var lower = '';

  for (var i = 0; i < string.length; i++) {
    asciiNumber = string.charCodeAt(i);

    if ((asciiNumber >= 65) && (asciiNumber <= 90)) {
      asciiNumber += 32;
    }

    lower += String.fromCharCode(asciiNumber);
  }

  console.log(lower);
}

//toLowerCase('ALPHABET');      // "alphabet"
//toLowerCase('123');           // "123"
//toLowerCase('abcDEF');        // "abcdef"

// Rot 13
// -input: string
// -output: rotated 13 chars strings

function isBetweenAOrM(ch) {
  return ((ch >= 65 && ch <= 77) || (ch >= 97 && ch <= 109));
}

function isBetweenNOrZ(ch) {
  return ((ch >= 78 && ch <= 90) || (ch >= 110 && ch <= 122));
}

function rotatedThirteenAheadOf(ch) {
  return String.fromCharCode(ch + 13);
}

function rotatedThirteenBehind(ch) {
  return String.fromCharCode(ch - 13);
}

function rotChar(ch) {
  if (isBetweenAOrM(ch)) {
    return rotatedThirteenAheadOf(ch);
  } else if (isBetweenNOrZ(ch)) {
    return rotatedThirteenBehind(ch);
  } else {
    return String.fromCharCode(ch);
  }
}

function rot13(originalString) {
  var rotatedString = '';

  for (var i = 0; i < originalString.length; i++) {
    var currentAscii = originalString.charCodeAt(i);
    
    rotatedString += rotChar(currentAscii);
  }

  return rotatedString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// logs:
//Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// logs:
//Teachers open the door, but you must enter by yourself.

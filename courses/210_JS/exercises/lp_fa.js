function myForEach(array, func) {
  for (var i = 0; i < array.length; i++) {
    func(array[i]);
  }
}

var min = Infinity;
var getMin = function(value) {
  min = value <= min ? value : min;
};

//myForEach([4, 5, 12, 23, 3], getMin);     // undefined
//console.log(min);                         // 3

function myFilter(array, func) {
  var newArr = [];

  myForEach(array, function(element) {
    if (func(element)) {
      newArr.push(element)
    }
  });

  return newArr;
}

//var isPythagoreanTriple = function(triple) {
//  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
//};
//
//console.log(myFilter([{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13},
//          {a: 1, b: 2, c: 3}], isPythagoreanTriple));
//// returns [{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13}]

function myMap(array, func) {
  var newArr = [];

  array.forEach(function(element) {
    newArr.push(func(element));
  });

  return newArr;
}

//var plusOne = function(n) { return n + 1; };

//console.log(myMap([1, 2, 3, 4], plusOne));       // [2, 3, 4, 5]

//function getBooksTitle(books) {
//  var booksTitle = myMap(books, function(book) {
//    return book.title;
//  });
//  
//  return booksTitle;
//}
//
//var books = [
//  {
//    title: 'JavaScript and JQuery: Interactive Front-End Web Development',
//    author: 'Jon Ducket',
//    edition: '1st',
//  },
//  {
//    title: 'Eloquent JavaScript: A Modern Introduction to Programming',
//    author: 'Haverbeke',
//    edition: '2nd',
//  },
//  {
//    title: 'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics',
//    author: 'Jennifer Niederst Robbins',
//    edition: '4th',
//  },
//];
//
//var getTitle = function(book) {
//  return book['title'];
//};
//
//console.log(getBooksTitle(books));
//// console output
//[
//  'JavaScript and JQuery: Interactive Front-End Web Development',
//  'Eloquent JavaScript: A Modern Introduction to Programming',
//  'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics'
//]

function myReduce(array, func, initial) {
  var res = initial || array[0];

  array.forEach(function(value) {
    res = func(res, value);
  });

  return res;
}

//var smallest = function(result, value) {
//  return result <= value ? result : value;
//};
//
//var sum = function(result, value) {
//  return result + value;
//};
//
//console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
//console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
//
//
//function longestWord(words) {
//  return myReduce(words, longest); 
//}
//
//var longest = function(result, currentWord) {
//  return currentWord.length >= result.length ? currentWord : result;
//};
//
//console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"
//

function myOwnEvery(array, func) {
  for (var i = 0; i < array.length; i++) {
    if (!func(array[i])) { 
      return false;
    }
  }

  return true;
}

var isAString = function(value) {
  return typeof value === 'string';
};

//console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true

function areAllNumbers(array) {
  return myOwnEvery(array, isANumber);
}

var isANumber = function(value) {
  return typeof value === 'number';
};

//console.log(areAllNumbers([1, 5, 6, 7, '1']));             // false
//console.log(areAllNumbers([1, 5, 6, 7, 1]));               // true

function totalArea(rectangles) {
  var areas = rectangles.map(function(innerArray) {
    return innerArray[0] * innerArray[1]
  });

  var total = areas.reduce(function(acc, val) {
    return acc + val;
  });

  return total;
}

function totalSquareArea(rectangles) {
  var squares = rectangles.filter(function(innerArray) {
    return innerArray[0] === innerArray[1];
  });

  var areas = squares.map(function(innerArray) {
    return innerArray[0] * innerArray[1]
  });

  var total = areas.reduce(function(acc, val) {
    return acc + val;
  });

  return total;
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

//console.log(totalArea(rectangles)); // 141
//console.log(totalSquareArea(rectangles)); // 121

var newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

function processReleaseData(data) {
  // Filter out for id and title precense 
  var idAndTitle = data.filter(function(obj) {
    return ('id' in obj && 'title' in obj);
  });

  var res = idAndTitle.map(function(obj) {
    return { id: obj.id, title: obj.title };
  });
  
  return res;
};

//console.log(processReleaseData(newReleases));

// should return:
// [{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];

function octalToDecimal(number) {
  // array of numbers, reduced into decimal
  var digits = number.split('').map(function(stringNum) {
    return parseInt(stringNum);
  });

  var decimal = digits.reverse().reduce(function(acc, value, index) {
    return acc + (value * (8**index)); 
  }, 0);

  return decimal;
}

//console.log(octalToDecimal('1'));           // 1
//console.log(octalToDecimal('10'));          // 8
//console.log(octalToDecimal('130'));         // 88
//console.log(octalToDecimal('17'));          // 15
//console.log(octalToDecimal('2047'));        // 1063
//console.log(octalToDecimal('011'));         // 9

function anagram(word, list) {
  var anagrams = list.filter(function(currentWord) {
    return word.split('').sort().join('') === currentWord.split('').sort().join('');
  });

  return anagrams;
}

//console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); // [ "inlets" ]
//console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));  // [ "enlist", "inlets" ]

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(bands) {
  return bands.map(function(band) {
    var updatedCountry = 'Canada';
    var titleCaseName = titleCasePhrase(band.name);
    var cleanedOfDots = removeDots(titleCaseName); 

    return { 
      name: cleanedOfDots,
      country: updatedCountry,
      active: band.active,
    }
  });

  return processed;
}

function titleCasePhrase(phrase) {
  var wordArr = phrase.split(' ');

  var updatedPhrase = wordArr.map(function(word) {
    var letters = word.split('');
    letters[0] = letters[0].toUpperCase();
    return letters.join('');
  }).join(' ');

  return updatedPhrase;
}

function removeDots(phrase) {
  return phrase.replace(/\./g, '');
}

//console.log(processBands(bands));

// should return:

//[
//  { name: 'Sunset Rubdown', country: 'Canada', active: false },
//  { name: 'Women', country: 'Canada', active: false },
//  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
//]

var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

const EXAM_WEIGHT = 0.65;
const EXERCISES_WEIGHT = 0.35;

function generateClassRecordSummary(scores) {
  var scoreData = Object.keys(scores).map(function(student) {
    return scores[student].scores;
  });

  var examData = scoreData.map(function(score) {
    return score.exams;
  });


  return {
    studentGrades: getFinalStudentGrades(scoreData),
    exams: getExamSummary(examData),
  }
}

// Transposes 2-D array by swapping columns and rows
function transpose(array) {
  // Use inner array for num columns and column index
  return array[0].map(function(col, colIdx) {
    // Map over each inner array for each column and select value at row and colIdx
    return array.map(function(row) {
      return row[colIdx];
    });
  });
}

function getExamSummary(examData) {
  var examsByNumber = transpose(examData);

  return examsByNumber.map(function(examScores) {
    return {
      average: findArrayAverage(examScores),
      minimum: Math.min(...examScores),
      maximum: Math.max(...examScores),
    }
  });
}

function getFinalStudentGrades(scoreData) {
  return scoreData.map(function(student) {
    var averageExamScore = findArrayAverage(student.exams);
    var totalExerciseScore = sumArray(student.exercises);
    var finalPercentGrade = Math.round(findFinalPercentGrade(averageExamScore, totalExerciseScore));
    var letterGrade = findLetterGrade(finalPercentGrade);
    var combinedFinalGrade = composeFinalGrade(finalPercentGrade, letterGrade);

    return combinedFinalGrade;
  });
}

function composeFinalGrade(percentGrade, letterGrade) {
  return String(percentGrade) + ' (' + letterGrade + ' )';
}

function findLetterGrade(percentGrade) {
  if (percentGrade >= 93) {
    return 'A';
  } else if (percentGrade >= 85) {
    return 'B';
  } else if (percentGrade >= 77) {
    return 'C';
  } else if (percentGrade >= 69) {
    return 'D'; 
  } else if (percentGrade >= 60) {
    return 'E';
  } else {
    return 'F';
  }
}

function findFinalPercentGrade(averageExamScore, totalExerciseScore) {
  return (averageExamScore * EXAM_WEIGHT) + (totalExerciseScore * EXERCISES_WEIGHT);
}

function findArrayAverage(arr) {
  var total = arr.reduce(function(acc, val) {
    return acc + val;
  });

  return total / arr.length;
}

function sumArray(arr) {
  return arr.reduce(function(acc, val) {
    return acc + val;
  });
}

//console.log(generateClassRecordSummary(studentScores));

// returns:

//{
//  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//  exams: [
//    { average: 75.6, minimum: 50, maximum: 100 },
//    { average: 86.4, minimum: 70, maximum: 100 },
//    { average: 87.6, minimum: 60, maximum: 100 },
//    { average: 91.8, minimum: 80, maximum: 100 },
//  ],
//}

function alphabeticNumberSort(array) {
  var numberWords = [ 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 
                      'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',                      'eighteen', 'nineteen' ]

  return array.sort(function(val1, val2) {
    var v1English = numberWords[val1]; 
    var v2English = numberWords[val2];

    if (v1English > v2English) {
      return 1;
    } else if (v1English < v2English) {
      return -1;
    } else {
      return 0;
    }
  });
}

//console.log(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

function sum(num) {
  return String(num).split('').reduce(function(acc, val) {
    return acc + parseInt(val, 10);
  }, 0);
}

//console.log(sum(23));          // 5
//console.log(sum(496));         // 19
//console.log(sum(123456789));   // 45

function multiplyAllPairs(arr1, arr2) {
  var newArr = [];

  arr1.forEach(function(val1) {
    arr2.forEach(function(val2) {
      newArr.push(val1 * val2);
    });
  });

  newArr.sort(function(val1, val2) {
    if (val1 > val2) {
      return 1;
    } else if (val1 < val2) {
      return -1;
    } else {
      return 0;
    }
  });

  console.log(newArr);
}

//multiplyAllPairs([2, 4], [4, 3, 1, 2]) // [2, 4, 4, 6, 8, 8, 12, 16]

// input: array of nums
// output: num that represent sum of each leading subsequence
// algo:
//   -reduce by adding slice each time 
function sumOfSums(array) {
  return array.reduce(function(acc, val, index) {
    return acc + array.slice(0, index + 1).reduce(function(acc, val) {
      return acc + val; 
    });
  });
}

//console.log(sumOfSums([3, 5, 2]))       // (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
//console.log(sumOfSums([1, 5, 7, 3]))    // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
//console.log(sumOfSums([4]))             // 4
//console.log(sumOfSums([1, 2, 3, 4, 5])) // 35

function substringsAtStart(string) {
  return string.split('').map(function(element, index) {
    return string.slice(0, index) + element 
  });
}

//console.log(substringsAtStart('abc'))   // ['a', 'ab', 'abc']
//console.log(substringsAtStart('a'))     // ['a']
//console.log(substringsAtStart('xyzzy')) // ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

function substrings(string) {
  return string.split('').map(function(element,index) {
    return substringsAtStart(string.slice(index, string.length)); 
  }).reduce(function(resArr, subArr) {
    return resArr.concat(subArr); 
  });
}

//console.log(substrings('abcde'));
// result
//[ 'a', 'ab', 'abc', 'abcd', 'abcde',
//  'b', 'bc', 'bcd', 'bcde',
//  'c', 'cd', 'cde',
//  'd', 'de',
//  'e' ]

function isPalindrome(string) {
  return (string.split('').reverse().join('') === string && string.length > 1);
}

function palindromes(string) {
  return substrings(string).filter(isPalindrome);
}

//console.log(palindromes('abcd'));  // []
//console.log(palindromes('madam')); // ['madam', 'ada']
//console.log(palindromes('hello-madam-did-madam-goodbye'));
//// result
////[ 'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
////  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
////  '-madam-', 'madam', 'ada', 'oo' ]
//
//console.log(palindromes('knitting cassettes'));
// result
//[ 'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt' ]

function buyFruit(nestedArray) {
  return nestedArray.map(function(subArr) {
    return repeat(subArr); 
  }).reduce(function(flattened, subArr) {
    return flattened.concat(subArr); 
  });
}

function repeat(subArr) {
  var newArr = [];

  for (var i = 0; i < subArr[1]; i++) {
    newArr.push(subArr[0]);
  }

  return newArr;
}

//console.log(buyFruit([['apples', 3], ['orange', 1], ['bananas', 2]]));
// result
//['apples', 'apples', 'apples', 'orange', 'bananas','bananas']

var transactions = [ {id: 101, movement: 'in', quantity: 5, },
                     {id: 105, movement: 'in', quantity: 10, },
                     {id: 102, movement: 'out', quantity: 17, },
                     {id: 101, movement: 'in', quantity: 12, },
                     {id: 103, movement: 'out', quantity: 15, },
                     {id: 102, movement: 'out', quantity: 15, },
                     {id: 105, movement: 'in', quantity: 25, },
                     {id: 101, movement: 'out', quantity: 18, },
                     {id: 102, movement: 'in', quantity: 22, },
                     {id: 103, movement: 'out', quantity: 15, },];

function transactionsFor(itemId, transactions) {
  return transactions.filter(function(transaction) {
    return transaction.id === itemId;
  });
}

function isItemAvailable(itemId, transactions) {
  var total = transactionsFor(itemId, transactions).reduce(function(total, transaction) {
    if (transaction.movement === 'in') {
      return total += transaction.quantity;
    } else if (transaction.movement === 'out') {
      return total -= transaction.quantity;
    }
  }, 0);

  return total > 0;
}

//console.log(isItemAvailable(101, transactions)); // false
//console.log(isItemAvailable(105, transactions)); // true

//console.log(transactionsFor(101, transactions));
// result
//[ { id: 101, movement: 'in', quantity: 5 },
//  { id: 101, movement: 'in', quantity: 12 },
//  { id: 101, movement: 'out', quantity: 18 }, ]

function isUppercase(str) {
  console.log(!str.match(/[a-z]/));
}

//isUppercase('t')          // false
//isUppercase('T')          // true
//isUppercase('Four Score') // false
//isUppercase('FOUR SCORE') // true
//isUppercase('4SCORE!')    // true
//isUppercase('')           // true

function removeVowels(array) {
  console.log(array.map(function(element) {
    return element.replace(/[aeiuo]/gi, '');
  }));
}

//removeVowels(['abcdefghijklmnopqrstuvwxyz']);             // ['bcdfghjklmnpqrstvwxyz']
//removeVowels(['green', 'YELLOW', 'black', 'white']);      // ['grn', 'YLLW', 'blck', 'wht']
//removeVowels(['ABC', 'AEIOU', 'XYZ']);                    // ['BC', '', 'XYZ']

// input: string
// output: object that counts lowercase letters, uppercase letters, and neither
// algo: 
function letterCaseCount(str) {
  var returnObj = { lowercase: 0, uppercase: 0, neither: 0 }; 

  for (var i = 0; i < str.length; i++) {
    if (!!str[i].match(/[A-Z]/)) {
      returnObj['uppercase']++;
    } else if (!!str[i].match(/[a-z]/)) {
      returnObj['lowercase']++;
    } else {
      returnObj['neither']++;
    }
  }

  console.log(returnObj);
}

//letterCaseCount('abCdef 123')    // { lowercase: 5, uppercase: 1, neither: 4 }
//letterCaseCount('ab!!Cdef  123') // { lowercase: 5, uppercase: 1, neither: 7 }
//letterCaseCount('AbCd +Ef')      // { lowercase: 3, uppercase: 3, neither: 2 }
//letterCaseCount('123')           // { lowercase: 0, uppercase: 0, neither: 3 }
//letterCaseCount('')              // { lowercase: 0, uppercase: 0, neither: 0 }

function wordCap(str) {
  console.log(str.split(' ').map(function(word) {
    return word.slice(0, 1).toUpperCase() + word.slice(1, word.length);
  }).join(' '));
}

//wordCap('four score and seven')    // 'Four Score And Seven'
//wordCap('the javaScript language') // 'The Javascript Language'
//wordCap('this is a "quoted" word') // 'This Is A "quoted" Word'

// input: string
// output: string with each char case swapped
// algo: 
//   - split, map on case and use opposite, join
function swapcase(string) {
  var swapped = string.split('').map(function(char) {
    if (!!char.match(/[A-Z]/)) {
      return char.toLowerCase();
    } else if (!!char.match(/[a-z]/)) {
      return char.toUpperCase();
    } else {
      return char;
    }
  }).join('');

  console.log(swapped);
}

//swapcase('CamelCase')         // 'cAMELcASE'
//swapcase('Tonight on XYZ-TV') // 'tONIGHT ON xyz-tv'
//swapcase('') // ''

function staggeredCase(str) {
  var toUpper = true;

  var stagged = str.split('').map(function(char) {
    if (char.match(/[a-z]/i)) {
      if (toUpper) {
        char = char.toUpperCase();
      } else { 
        char = char.toLowerCase();
      }

      toUpper = !toUpper;
      return char;
    } else {
      return char;
    }
  }).join('');

  console.log(stagged);
}

//staggeredCase('I Love Launch School!')     // 'I lOvE lAuNcH sChOoL!'
//staggeredCase('ALL CAPS')                  // 'AlL cApS'
//staggeredCase('ignore 77 the 444 numbers') // 'IgNoRe 77 ThE 444 nUmBeRs'

function wordLengths(str) {
  console.log(str.split(' ').map(function(word) {
    return word + ' ' + word.length;
  }));
}

//wordLengths('cow sheep chicken');
//// result
//['cow 3', 'sheep 5', 'chicken 7']
//
//wordLengths('baseball hot dogs and apple pie');
//// result
//['baseball 8', 'hot 3', 'dogs 4', 'and 3', 'apple 5', 'pie 3']
//
//wordLengths('It ain\'t easy, is it?');
//// result
//['It 2', 'ain\'t 5', 'easy, 5', 'is 2', 'it? 3']
//
//wordLengths('Supercalifragilisticexpialidocious');
//// result
//['Supercalifragilisticexpialidocious 34']
//
//wordLengths('');
//// result
//[]

function searchWord(word, text) {
  var regex = new RegExp(("\\b" + word + "\\b"), 'gi');
  var highlighted = text.replace(regex, '**' + word.toUpperCase() + '**');
  console.log(highlighted);
}

var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?'

searchWord('sed', text);   // 3

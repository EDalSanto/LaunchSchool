
// Algorithm
//  - Go through each char in string
//    - Find char in blocks array; if not present, return false
//      - iterate through blocks array:
//        - index = subArray.indexOf(currentLetter) 
//        - if index >= 0 // Char is present
//          // check if pair is present in string
//          - if index === 0 && string.includes(subArray[1]) || index === 1 &&
//          string.includes(subArray[0]  
//              return false
//  - return true if done checking each char in string


function removeCurrentBlock(char, blocks) {
  for (var i = 0; i < blocks.length; i++) {
    if (blocks[i].includes(char)) {
      blocks.splice(i, 1);
      return 1;
    }
  }

  return -1;
}

function isBlockWord(word) {
  var blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], 
               ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], 
               ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

  word = word.toUpperCase();

  for (var i = 0; i < word.length; i++) {
    var currentChar = word[i];
    var removedIndex = removeCurrentBlock(currentChar, blocks);

    if (removedIndex === -1) {
      return false;
    }
  }

  return true;
}

console.log(isBlockWord('BATCH')); // true
console.log(isBlockWord('BUTCH')); // false
console.log(isBlockWord('jest'));  // true
console.log(isBlockWord('Bo')); // false
console.log(isBlockWord('Aaapple')); // false 

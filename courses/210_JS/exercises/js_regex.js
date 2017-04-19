function isUrl(text) {
  return !!text.match(/^https?:\/\/\S+$/);
}

//console.log(isUrl('http://launchschool.com'));   // -> true
//console.log(isUrl('https://example.com'));       // -> true
//console.log(isUrl('https://example.com hello')); // -> false
//console.log(isUrl('   https://example.com'));    // -> false

function fields(text) {
  console.log(text.split(/[,\s]+/));
}

//fields("Pete,201,Student");
//// -> ['Pete', '201', 'Student']
//
//fields("Pete \t 201    ,  TA");
//// -> ['Pete', '201', 'TA']
//
//fields("Pete \t 201");
// -> ['Pete', '201']

function mysteryMath(text) {
  console.log(text.replace(/[+\-*\/]/g, '?'));
}

//mysteryMath('4 + 3 - 5 = 2');
//// -> '4 ? 3 - 5 = 2'
//
//mysteryMath('(4 * 3 + 2) / 7 - 1 = 1');
//// -> '(4 ? 3 + 2) / 7 - 1 = 1'

function danish(text) {
  console.log(text.replace(/\b(apple|blueberry|cherry)\b/, 'danish')); 
}

//danish('An apple a day keeps the doctor away');
//// -> 'An danish a day keeps the doctor away'
//
//danish('My favorite is blueberry pie');
//// -> 'My favorite is danish pie'
//
//danish('The cherry of my eye');
//// -> 'The danish of my eye'
//
//danish('apple. cherry. blueberry.');
//// -> 'danish. cherry. blueberry.'
//
//danish('I love pineapple');
//// -> 'I love pineapple'

function formatDate(text) {
  console.log(text.replace(/^(\d{4})([\-\/])(\d{2})\2(\d{2})$/, '$4.$3.$1'));
}

formatDate('2016-06-17'); // -> '17.06.2016'
formatDate('2016/06/17'); // -> '2016/06/17' (no change)
formatDate('2015/01-31'); // -> '2015/01-31' (no change)


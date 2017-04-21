var language = "JavaScript";
//
//var idx = language.indexOf('S');
////console.log(idx);
//var charCode = language.charCodeAt(idx);
//console.log(charCode);
//console.log(String.fromCharCode(charCode));
//console.log(language.lastIndexOf('a'));

//var a = 'a';
//var b = 'b';
//console.log(a > b);
//b = 'B';
//console.log(a > b);

//var aIndex = language.indexOf('a');
//var vIndex = language.indexOf('v');
//
//console.log(language.substring(aIndex, 4));
//console.log(language.substring(vIndex, 4));

//var fact1 = 'Javascript is fun';
//var fact2 = 'Kids like it too';
//
//var compoundSentence = fact1 + ' and ' + fact2.toLowerCase();
//console.log(fact1[0], fact2[0]);

//var pi = 22 / 7;
//pi = String(pi);
//console.log(pi.lastIndexOf(14));

//var boxNumber = (356).toString();
////console.log(boxNumber);
//boxNumber = parseInt(boxNumber);
//console.log(typeof boxNumber);
//boxNumber = String(boxNumber);
//console.log(typeof boxNumber);

//var name = prompt('What is your name?');
//if (name[name.length - 1] === '!') {
//  console.log('HELLO ' + name.toUpperCase() + '. WHY ARE WE SCREAMING?');
//} else {
//  console.log(name);
//}

function acronym(string) {
  console.log(string.split(/[\s\-]/).map(function(element) {
    return element[0].toUpperCase(); 
  }).join(''));
}

//acronym('Portable Network Graphics');                 // "PNG"
//acronym('First In, First Out');                       // "FIFO"
//acronym('PHP: HyperText Preprocessor');               // "PHP"
//acronym('Complementary metal-oxide semiconductor');   // "CMOS"
//acronym('Hyper-text Markup Language');                // "HTML"

function isValidEmail(email) {
  console.log(!!email.match(/^[a-z0-9]+@([a-z]+\.[a-z]+){1,}$/i));
}

//isValidEmail('Foo@baz.com.ph');          // returns true
//isValidEmail('Foo@mx.baz.com.ph');       // returns true
//isValidEmail('foo@baz.com');             // returns true
//isValidEmail('foo@baz.ph');              // returns true
//isValidEmail('HELLO123@baz');            // returns false
//isValidEmail('foo.bar@baz.to');          // returns false
//isValidEmail('foo@baz.');                // returns false
//isValidEmail('foo_bat@baz');             // returns false
//isValidEmail('foo@bar.a12');             // returns false
//isValidEmail('foo_bar@baz.com');         // returns false
//isValidEmail('foo@bar.....com');         // returns false

function isBalanced(str) {
  var count = 0;

  for (var i = 0; i < str.length; i++) {
    if (count < 0) { return false; }
    
    if (str[i] === '(') {
      count++;
    } else if (str[i] === ')') {
      count--;
    }
  }

  return count === 0;
}

//console.log(isBalanced('What (is) this?'));        // true
//console.log(isBalanced('What is) this?'));         // false
//console.log(isBalanced('What (is this?'));         // false
//console.log(isBalanced('((What) (is this))?'));    // true
//console.log(isBalanced('((What)) (is this))?'));   // false
//console.log(isBalanced('Hey!'));                   // true
//console.log(isBalanced(')Hey!('));                 // false
//console.log(isBalanced('What ((is))) up('));       // false

var textExcerpt = 'To be or not to be-that is the question:\n' +
  'Whether \'tis nobler in the mind to suffer\n' +
  'The slings and arrows of outrageous fortune,\n' +
  'Or to take arms against a sea of troubles,\n' +
  'And, by opposing, end them. To die, to sleep-\n' +
  'No more-and by a sleep to say we end\n' +
  'The heartache and the thousand natural shocks\n' +
  'That flesh is heir to-\'tis a consummation\n' +
  'Devoutly to be wished. To die, to sleep-\n' +
  'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
  'For in that sleep of death what dreams may come,\n' +
  'When we have shuffled off this mortal coil,\n' +
  'Must give us pause. There\'s the respect\n' +
  'That makes calamity of so long life.\n' +
  'For who would bear the whips and scorns of time,\n' +
  'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
  'The pangs of despised love, the law’s delay, [F: disprized]\n' +
  'The insolence of office, and the spurns\n' +
  'That patient merit of the unworthy takes,\n' +
  'When he himself might his quietus make\n' +
  'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
  'To grunt and sweat under a weary life,\n' +
  'But that the dread of something after death,\n' +
  'The undiscovered country from whose bourn\n' +
  'No traveler returns, puzzles the will\n' +
  'And makes us rather bear those ills we have\n' +
  'Than fly to others that we know not of?\n' +
  'Thus conscience does make cowards of us all,\n' +
  'And thus the native hue of resolution\n' +
  'Is sicklied o\'er with the pale cast of thought,\n' +
  'And enterprises of great pitch and moment, [F: pith]\n' +
  'With this regard their currents turn awry, [F: away]\n' +
  'And lose the name of action.-Soft you now,\n' +
  'The fair Ophelia.-Nymph, in thy orisons\n' +
  'Be all my sins remembered';

var positiveRegex = /(fortunes?)|(dream(s|t|ed)?)|(love(s|ed)?)|(respect(s|ed)?)|(patien(ce|t)?)|(devout(ly)?)|(noble)|(resolut(e|ion)?)/gi;
var negativeRegex = /(die(s|d)?)|(heartached?)|(death)|(despise(s|d)?)|(scorn(s|ed)?)|(weary)|(troubles?)|(oppress(es|ed|or)?)/gi;

function sentiment(text) {
  var cleanedOfPunctuation = text.replace(/[^a-z\s]/gi, '');
  var words = cleanedOfPunctuation.split(/\s/);

  var posWordsFound = words.filter(function(word) {
    return word.match(positiveRegex); 
  });

  var negWordsFound = words.filter(function(word) {
    return word.match(negativeRegex); 
  });

//  console.log('There are ' + posWordsFound.length + ' positive words in the text.');
//  console.log('Positive sentiments: ' + posWordsFound.join(', '));
//  console.log('\n');
//  
//  console.log('There are ' + negWordsFound.length + ' negative words in the text.');
//  console.log('Negative sentiments: ' + negWordsFound.join(', '));
//  console.log('\n');
 
}

//sentiment(textExcerpt);

// Output: 
//  - number of email messages found in string
//    - delimeter string between emails: ##||##
//  - date range of email messages
//    - delimeter string within emails of parts: #/#

function mailCount(emailData) {
  var emails = emailData.split('##||##');
  var numEmails = emails.length;

  var emailDateStrings =  emails.map(function(email) {
    return email.split('#/#')[2].split(' ')[1];
  });

  var dateObjs =  emailDateStrings.map(function(dateStr) {
    var dateParts = dateStr.split('-'); 
    var month = dateParts[0];
    var day = dateParts[1];
    var year = dateParts[2];

    var date = new Date(year + ', ' + month + ', ' +  day);

    return date;
  });

  var minDate = dateObjs.reduce(function(date1, date2) {
    return date1 < date2 ? date1 : date2;
  });

  var maxDate = dateObjs.reduce(function(date1, date2) {
    return date1 > date2 ? date1 : date2;
  });

  console.log('Count of Email: ' + numEmails);
  console.log('Date Range: ' + displayableDate(minDate) + ' - ' + displayableDate(maxDate));
}

function displayableDate(dateObj) {
  return dateObj.toDateString();
}

mailCount(emailData);

// console.output
//Count of Email: 5
//Date Range: Sat Jun 25 2016 - Thu Aug 11 2016


// Traversing DOM

function walk(node, callback) {
  callback(node);

  for (var i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

//var html = document.childNodes[1]; // skip doctype
//var body = html.lastChild;         // skip head and text nodes
//var h1 = body.childNodes[1];       // skip text node
//h1.style.color = 'red';
//h1.style.fontSize = '48px';

//walk(document, function(node) {
//  var first = true;
//
//  if (node.tagName === 'P') {
//    if (first) {
//      first = false;
//    } else {
//      node.classList.add('stanza');
//    }
//  }
//});  

// Polar Bear

//var images = [];
//
//walk(document, function(node) {
//  if (node.tagName === "A") {
//    a.style.color = 'red';
//  }
//});
//
//console.log(images.length);    
//
//var pngs = images.filter(function(i) {
//  return i.getAttribute('src').match(/png$/);
//}).length;

function getElementsByName(node, name) {
  var matches = [];

  walk(node, function(node) {
    if (node.tagName === name.toUpperCase()) {
      matches.push(node);
    }
  });

  return matches;
}

function addClassToElements(className, elements) { 
  for (var i = 0; i < elements.length; i++) {
    elements[i].classList.add(className);
  }
}

var paragraphsInIntroClass = document.querySelectorAll('.intro p');
for (var i = 0; i < paragraphsInIntroClass.length; i++) {
  paragraphsInIntroClass[i].classList.add('article-text');
}

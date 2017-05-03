// Objects

// People
var me = {
  firstName: 'Eddie',
  lastName: 'Dal Santo',
};

var friend = {
  firstName: 'Tux',
  lastName: 'Wildman',
};

var mother = {
  firstName: 'Karen',
  lastName: 'Dal Santo',
};

var father = {
  firstName: 'Mike',
  lastName: 'Dal Santo',
};

var people = {
  collection: [ me, friend, mother, father ],

  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },

  rollCall: function() {
    this.collection.forEach(this.fullName);
  },

  add: function(person) {
    if (isInvalidPerson(person)) { return; }

    this.collection.push(person);
  },

  getIndex: function(person) {
    var index = -1;
    this.collection.forEach(function(comparator, i) {
      if (comparator.firstName === person.firstName && 
          comparator.lastName === person.lastName) {
        index = i;
      }
    });

    return index;
  },

  get: function(person) {
    if (isInvalidPerson(person)) { return; }

    this.collection[this.getIndex(person)];
  },

  update: function(person) {
    if (isInvalidPerson(person)) { return; }

    var existingPersonId = this.getIndex(person);
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  },

  remove: function(person) {
    if (this.isInvalidPerson(person)) { return; }

    var index = this.getIndex(person);

    if (index === -1) { return; } 

    this.collection.splice(index, 1);
  },
  
  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
  },
};

// Invoices

var invoices = {
  unpaid: [],

  paid: [],

  add: function(clientName, amount) {
    this.unpaid.push({ name: clientName, amount: amount });
  },

  totalDue: function() {
    return this.unpaid.reduce(function(sum, invoice) {
      return sum + invoice.amount
    }, 0);
  },

  totalPaid: function() {
    return this.paid.reduce(function(sum, invoice) {
      return sum + invoice.amount
    }, 0);
  },

  payInvoice: function(name) {
    var stillUnpaid = [];

    for (var i = 0; i < this.unpaid.length; i++) {
      if (this.unpaid[i].name === name) {
        this.paid.push(this.unpaid[i]);
      } else {
        stillUnpaid.push(this.unpaid[i]);
      }
    }

    this.unpaid = stillUnpaid;
  },
};

// Functions as Object Factories

function makeCar(accelRate, breakingRate) {
  return {
    speed: 0,
    accelRate: rate,
    breakingRate: breakingRate, 

    accelerate: function() {
      this.speed += this.rate;
    },

    breaking: function() {
      if (this.speed < this.breakingRate) {
        this.speed = 0;
      } else {
        this.speed -= this.breakingRate;
      }
    }
  }
}

// 

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  circumference: function() {
    return 2 * (this.width + this.height);
  }
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.circumference = RECTANGLE.circumference.call(this);
}

//var rect1 = new Rectangle(2, 3);
//console.log(rect1.area);
//console.log(rect1.circumference);



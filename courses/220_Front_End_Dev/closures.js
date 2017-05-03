// Exercises

function makeCounterLogger(startingNumber) {
  return function (endNumber) {
    if (startingNumber < endNumber) {
      for (var i = startingNumber; i <= endNumber; i++) {
        console.log(i);
      }
    } else {
      for (var i = startingNumber; i >= endNumber; i--) {
        console.log(i);
      }
    }
  }
}

//var countlog = makeCounterLogger(5);
//countlog(8);
//countlog(2);

function makeList() {
  var todos = [];

  return {
    add: function(todo) {
      todos.push(todo);
      console.log(todo + ' ' + 'added!');
    }, 
    list: function() {
      todos.forEach(function(todo) {
        console.log(todo)
      });
    },
    remove: function(todo) {
      var todoIndex = this.getIndex(todo);

      todos.splice(todoIndex, 1);
      console.log(todo + ' removed!');
    },
    getIndex: function(todo) {
      return todos.indexOf(todo);
    },
  }
}

//var list = makeList();
//list.add("peas");
////peas added!
//list.list();
////peas
//list.add("corn");
////corn added!
//list.list();
////peas
////corn
//list.remove("peas");
////peas removed!
//list.list();
//corn

function makeMultipleLister(num) {
  return function() {
    for (var i = num; i < 100; i+= num) {
      console.log(i);
    }
  }
}

//var lister = makeMultipleLister(13);
//lister();

var total = 0;

function add(num) {
  total += num;
  console.log(total);
}

function subtract(num) {
  total -= num;
  console.log(total);
}

//add(1);
//add(42);
//subtract(39);

function later(func, arg) {
  return function() {
    func(arg);
  }
}

//var logWarning = later(console.log, 'The system is shutting down!');
//logWarning()
//The system is shutting down!

// Banking with Objects and Closures

function makeBank() {
  var accounts = [];
  var lastAccountNumber = 101;

  function makeAccount() {
    return {
      balance: 0,
      transactions: [], 
  
      deposit: function(amount) {
        this.balance += amount;
        this.transactions.push({ type: 'deposit', amount: amount });
        return amount;
      },
  
      withdraw: function(amount) {
        if (amount > this.balance) {
          amount = this.balance;
        }
        this.balance -= amount;
        this.transactions.push({ type: 'withdraw', amount: amount });
        return amount;
      },
    }
  }

  return {
    openAccount: function() {
      var newAccount = makeAccount();
      newAccount.number = lastAccountNumber; 
      lastAccountNumber++;
      accounts.push(newAccount);
      return newAccount;
    },

    transfer: function(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    }
  }
}


//var bank = makeBank();
//var source = bank.openAccount();
//source.deposit(10);
//var destination = bank.openAccount();
//bank.transfer(source, destination, 7);
//console.log(source.balance);
//console.log(destination.balance);
//
//console.log(source.number);
////101
//var secondAccount = bank.openAccount();
//console.log(secondAccount.number);
//102

//var account = makeAccount();
//console.log(account.deposit(15));
//console.log(account.balance);
//
//var otherAccount = makeAccount();
//console.log(otherAccount.balance);


// Partial Function Application

function makeAddN(addend) {
  // inner reference to addend is retained in a closure
  // and is valid when the function is invoked
  return function(number) {
    return addend + number;
  }
}

var add1 = makeAddN(1);
add1(1);  // 2
add1(42); // 43

var add9 = makeAddN(9);
add9(1);  // 10
add9(42); // 43

// reference to addend variable "carried around" by the function returned in
// makeAddN()

function greet(arg1, arg2) {
  return arg1 + ', ' + arg2;
}

function partial(func, arg1) {
  return function(arg2) {
    return func(arg1, arg2);
  };
}

//greet('howdy', 'joe');
//greet('good morning', 'sue');

//sayHi = partial(greet, 'HI');
//console.log(sayHi('Joe'));



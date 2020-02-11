/*
function sum(){
  let sum = 0;
  // const arr = Array.from(arguments);
  // for (let i = 0; i < arguments.length; i++){
  //   sum += arguments[i]
  // }
  const args = [...arguments]
  for (let i = 0; i < args.length; i++) {
    sum += args[i]
  }
  return sum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);
class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

Function.prototype.myBind = function(context, ...arguments){
  let args = Array.from (arguments);

  return (...params) => {
    if (params === undefined){
      return this.apply(context, args);
    } else {
      let paramsArr = Array.from(params);
      args = args.concat(paramsArr);
      return this.apply(context, args);
    }
  } 
};

// markov.says.myBind(pavlov, "meow", "Kush")();
// markov.says.myBind(pavlov)("meow", "a tree");
// markov.says.myBind(pavlov, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

Function.prototype.curry = function (numArgs) {
  if(numArgs === 0){
    return 0;
  }
  let sum = 0;
  return function (num1){
    if (num1 === undefined) {
      return sum;
    } 
    sum += num1;
    numArgs--;
    return function (num2){
      if (num2 === undefined) {
        return sum;
      }
      sum += num2;
      numArgs--;
      return function (num3) {
        if (num3 === undefined) {
          return sum;
        }
        sum += num3;
        return sum;
      }
    }
  }
}

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30
*/

function curriedSum(numOfInt){
  let numbers = [];
  function _curriesSum (num){
    numbers.push(num);
    if (numbers.length === numOfInt){
      return numbers.reduce((a,b)=>{return a+b;})
    }
    return _curriesSum;
  }
  return _curriesSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function (numArgs){
  let args = [];
  const that = this;
  // if(args.length === numArgs)
  function insideFunc(param){
    args.push(param);
    if (args.length === numArgs){
      return that.apply(null, args);
    } else {
      return insideFunc;
    }
  }
  return insideFunc;
}
Function.prototype.inherits = function(ParentClass, ChildClass){
  // function Surrogate(){};
  // Surrogate.prototype = ParentClass.prototype;
  // ChildClass.prototype = new Surrogate();
  // ChildClass.prototype.constructor = ChildClass;
  ChildClass.prototype = Object.create(ParentClass.prototype);
  ChildClass.prototype.constructor = ChildClass;
}

function MovingObject() { }

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

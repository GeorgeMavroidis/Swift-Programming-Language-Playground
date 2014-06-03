// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Shape{
    var numOfSides = 0
    func simpleDesc() -> String{
        return "A shape with \(numOfSides) sides"
    }
}

var shape = Shape()
shape.numOfSides = 7
var shapeDesc    = shape.simpleDesc()

//The version of Shape above is missing something important - the init to set up the class when an instance is created. Use init to create one

class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    init(name:String){
        self.name = name
    }
    
    func simpleDescription() ->String{
        return "A shape with \(numberOfSides) sides"
    }
    
}
var new_shape = NamedShape(name: "circle")
new_shape.numberOfSides = 5
new_shape.simpleDescription()

//Notice how self is used to dist the name prop fromt he name arg to theinit. The arg to the init are passed like a function call when you crate an instace of the class
//Every prop needs a value assigned - either in its declaration or in the init


//Use deinit to create a deinitializer if you need to perform some cleanup before the obj is dealloc
//Subclasses include their superclass name after thir class name, separated by a colon. There is no req for classes to subclass any std root class, so you can include or omit a superclass as needed
class Square:NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name:String){
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String{
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "My test square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape{
    var sideLength:Double = 0.0
    
    init(sideLength:Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter:Double{
        get{
            return 3.0*sideLength
        }
        set{
            sideLength = newValue/3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "A triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

/*
Notice the init for the EquilateralTriangle class has three different steps:
    1. Setting the val of properties that the subclass declares
    2. Calling the superclass's init
    3. Changing the value of properties defined by the superclass. Any additional setup work that used methods, getters, or setters can also be done at this point

*/

class TriangleAndSquare{
    var triangle: EquilateralTriangle{
    willSet{
        square.sideLength = newValue.sideLength
    }
    }
    var square:Square{
    willSet{
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size:Double, name:String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength


//Methods on classes have one important difference from functions. Parameters names in functions are used only within the function, but parameters names in methods are also used when you call the method (except for hte first param. By default a method has the same name for its params when you call it and within the method itself. You can specify a second name, which is used inside the method

class Counter{
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times:Int){
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

//When working with optional values, you can write ? before operations like methods, properties and subscriptings
//If the value before the ? nil, everything after the ? is ignored and the value of the whole expression is nil.
//Otherwise the optional value is unwrapped, and everything after the ? is ignored and the value of the whole expression is nil
//In both cases, the value of the whole expression is an optional value

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optoinal square")
let sideLength = optionalSquare?.sideLength




// Playground - noun: a place where people can play

import Cocoa

//Use protocol to declare a protocol
protocol ExampleProtocol{
    var simpleDescription: String { get }
    mutating func adjust()
}

//Classes, enums and structs can all adopt protocols

class SimpleClass:ExampleProtocol{
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust(){
        simpleDescription += "Now 100% adjusted"
    }
}


var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure:ExampleProtocol{
    var simpleDescription:String = "A simple structure"
    mutating func adjust(){
         simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


//Notice the use of the mutating keyword in the declaration of SimpleStructure to mark a method that modifies the structure. The declaration of SimpleClass deosn't need any of its methods marked as mutating because methods on a class can always modify the class

//Use extension to add functionality to an existing type, such as new methods and computed properties.
//You can use an extention to add protocol conformance to a type that is declared elswhere, or even to a type that you imported from a library or framework

extension Int:ExampleProtocol{
    var simpleDescription: String{
    return "The number \(self)"
    }
    mutating func adjust(){
        self += 42
    }
}
7.simpleDescription

//Use a protocol name just like any other named type = for example, to create a collection of object that have different types but all conform to a single protocol
//When working with values whose type is a protocol type, methods outside the protocol def are not allowed

let protocolValue:ExampleProtocol = a
protocolValue.simpleDescription

//Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol
//This means that you cant accidentally access methods or properties that the class implements in addition to its protocol conformance




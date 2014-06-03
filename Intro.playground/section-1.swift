// Playground - noun: a place where people can play

import Cocoa

let vegetable = "pepper"
switch vegetable{
case "celery":
    let vegetableComment = "Add some raising"
case "cucumebt", "watercress":
    let vegetableComment = "That would be good"
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup"
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fib":[1,1,2,3,4,8],
    "Square":[1,4,9,16,25]
    
]

var largest = 0
for(kind, numbers) in interestingNumbers{
    for number in numbers{
        if(number > largest){
            largest = number
        }
    }
}

largest

//these two loops do the same thing
var n = 2
while n < 100{
    n = n*2
}
n

var m = 2
do{
    m = m*2
}while m < 100

m

var firstForLoop = 0
for i in 0..3{
    firstForLoop += 1
}
firstForLoop

var secFL = 0
for var i = 0; i<3; ++i{
    secFL += 1
    
}
secFL

func greet(name: String, day:String, lunch:String) -> String{
    return "Hello \(name), today is \(day), special is \(lunch)"
}

greet ("Bob", "Tuesday", "Beef")

func getGasPrices() -> (Double, Double, Double){
    return (3.59, 3.69, 3.79)
}
getGasPrices()

func sumOf(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

func returnFifteen() -> Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> (Int->Int){
    func addOne(number:Int) -> Int{
        return 1+number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: Int[], condition:Int->Bool)->Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number:Int)->Bool{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

//Functions are actually a special case of closures. You can write a closure without name by surrounding code with braces ({}) Use in to separate the arguments and trurn typr from the body
numbers.map({
    (number: Int)-> Int in
    let result = 3*number
    return result
})

//Single statement closures implicityly return the value of their only statement
numbers.map({number in 3*number})

//You can refer to params by number instead of by name - this approach is especially useful in very short closures. A closure passed as the last arg to a function can appear immediately after the parens
sort([1, 5, 3, 12, 2]) { $0 > $1 }








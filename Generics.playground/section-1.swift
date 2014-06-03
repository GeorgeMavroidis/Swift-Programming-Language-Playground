// Playground - noun: a place where people can play

import Cocoa

//Write a name inside angle brackets to make a generic function or type
func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[]{
    var result = ItemType[]()
    for i in 0..times{
        result += item
    }
    return result
}
repeat("knock", 4)

//You can make generic forms of functions and methods as well as classes enums and structs

//Reimplement the Swift standard librarys optional type
enum OptionalValue<T>{
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

//Use where after the type name to specify a list of requirments  - for example to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass

func anyCommonElements <T, U where T:Sequence, U:Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element>(lhs:T, rhs:U) ->Bool {
    for lhsItem in lhs{
        for rhsItem in rhs{
            if lhsItem == rhsItem{
                return true
            }
        }
    }
    return false
}
anyCommonElements([1,2,3], [3])

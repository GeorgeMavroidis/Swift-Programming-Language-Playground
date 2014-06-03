// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them

enum Rank:Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDesc()->String{
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()

//In the ex above the raw value type of the enum is Int, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enum
//Use toRaw and fromRaw functions to convert between the raw val and the enum val
if let convertedRank = Rank.fromRaw(3){
    let threeDesc = convertedRank.simpleDesc()
}

enum Suit{
    case Spades, Hearts, Diamonds, Clubs
    func simpleDEsc()->String{
        switch self{
        case .Spades:
            return "spaced"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartDesc = hearts.simpleDEsc()

//Use struct to create a structure. Structures support many of the same behaviors as classes, includeing methods and inits. One of the most important differences between trucs and classes is that structures are always copied when they are passed around in your code, but classes are passed by ref
struct Card{
    var rank: Rank
    var suit:Suit
    func simpleDescr() ->String{
        return "The \(rank.simpleDesc()) of \(suit.simpleDEsc())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescr = threeOfSpades.simpleDescr()

//An instance of an enum member can have values associated with the instance
//Instances of the same enum meber can have different values associated with them
//You provide the associated values when you create the instance. Associated values and raw values are diffrent
//The raw value of an enum member is the same for all of its instances and you provide the raw value when you define the enum

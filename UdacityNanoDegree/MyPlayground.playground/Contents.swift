//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//: This is a variable of type float
var mySalary: Float


struct student {
    let name: String
    var age: Int
    var school: String
}

var ayush = student(name: "Ayush", age: 18, school: "Udacity")

var sentence = "Never odd or even"
Array(sentence.characters)
for char in sentence.characters {
    char
}

var dict = ["kk": "a", 2: "b"]
dict[3] = "c"
dict[4]
if let a = dict[4] {
    print("Good")
} else {
    print("Bad")
}


struct SuitedCard {
    enum Suit {
        case Hearts
        case Spades
        case Diamonds
        case Clubs
    }
    
    enum Value {
        case Two
        case Three
        case Four
        case Five
        case Six
        case Seven
        case Eight
        case Nine
        case Ten
        case Jack
        case Queen
        case King
        case Ace
    }
    
    let suit: Suit
    let value: Value
    
    var suitDisplay: String {
        switch suit {
        case .Hearts:
            return "♡"
        case .Spades:
            return "♤"
        case .Diamonds:
            return "♢"
        case .Clubs:
            return "♧"
        }
    }
    
    var valueDisplay: String {
        switch value {
        case .Two:
            return "2"
        case .Three:
            return "3"
        case .Four:
            return "4"
        case .Five:
            return "5"
        case .Six:
            return "6"
        case .Seven:
            return "7"
        case .Eight:
            return "8"
        case .Nine:
            return "9"
        case .Ten:
            return "10"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        case .Ace:
            return "A"
        }
    }
    
    var isFaceCard: Bool {
        switch value {
        case .Jack:
            return true
        case .Queen:
            return true
        case .King:
            return true
        default:
            return false
        }
    }
    func equalPoints(otherCard: SuitedCard) -> Bool {
        return otherCard.value == value
    }
}

let s = SuitedCard(suit: .Hearts, value: .Jack)
s.suitDisplay
s.valueDisplay
s.isFaceCard

public struct Beaker {
    public let volumeMilliliters: Double
    // The contents are pairs of (description, milliliters)
    private var contents:[String:Double] = [:]
    
    public init(volumeMilliliters: Double) {
        self.volumeMilliliters = volumeMilliliters
    }
    private var currentVolumeOfContents: Double = 0
    
    // Adds contents to beaker without overflowing the beaker's volume
    public mutating func addContents(name: String, amount: Double) {
        let amountWithoutOverflowing = min(volumeMilliliters - currentVolumeOfContents, amount)
        
        if let existingAmount = contents[name] {
            contents[name] = existingAmount + amountWithoutOverflowing
        } else {
            contents[name] = amountWithoutOverflowing
        }
        
        currentVolumeOfContents += amount
        
    }
    
    public func listContents() -> String {
        return contents.description
    }
    
    
}



protocol PlayingCard {
    var isFaceDown:Bool { get set }
    var shortName:String { get }
}





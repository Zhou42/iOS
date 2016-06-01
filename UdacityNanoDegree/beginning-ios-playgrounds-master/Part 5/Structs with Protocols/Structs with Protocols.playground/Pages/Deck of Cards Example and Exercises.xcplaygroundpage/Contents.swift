//: [Previous](@previous)
/*:
## Deck of Cards Example and Exercises
*/
//: ### PlayingCard Protocol
/*:
This protocol describes what are the necessary traits for something to be considered a `PlayingCard`. For example, to be considered a `PlayingCard` you must have the following properties:

- a `Bool` variable called `isFaceDown`
- a computed `String` variable property called `shortName`.
*/
protocol PlayingCard {
    var isFaceDown: Bool { get set }
    var shortName: String { get }
}

//: ### A Joker is-a PlayingCard
struct Joker: PlayingCard {
    
    enum Color {
        case Red
        case Black
    }
    
    let color: Color
    
    // for a Joker to be considered a PlayingCard it must provide these properties!
    var isFaceDown: Bool
    var shortName: String {
        if isFaceDown {
            return "???"
        }
        
        switch color {
        case .Red:
            return "R 🃏"
        case .Black:
            return "B 🃏"
        }
    }
}

//: ### A SuitedCard is-a PlayingCard
struct SuitedCard: PlayingCard, Comparable {
    
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
        switch self.suit {
        case .Hearts:
            return "♥"
        case .Spades:
            return "♠"
        case .Diamonds:
            return "♦"
        case .Clubs:
            return "♣"
        }
    }
    
    var valueDisplay: String {
        switch self.value {
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
    
    // for a SuitedCard to be considered a PlayingCard it must provide these properties!
    var isFaceDown: Bool
    var shortName: String {
        if isFaceDown {
            return "???"
        }
        
        if valueDisplay.characters.count == 1 {
            // Add a space so the width is always three.
            return "\(suitDisplay) \(valueDisplay)"
        }
        
        return "\(suitDisplay)\(valueDisplay)"
    }
}

// compare re-definition

func ==(l: SuitedCard, r: SuitedCard) -> Bool {
    switch l.value {
    case .Ten, .Jack, .Queen, .King:
        switch r.value {
        case .Ten, .Jack, .Queen, .King:
            return true
        default:
            return false
        }
    default:
        return l.value == r.value
    }
}

func <(l: SuitedCard, r: SuitedCard) -> Bool {
    var lhsValue = 0
    var rhsValue = 0
    
    switch l.value {
    case .Two:
        lhsValue = 2
    case .Three:
        lhsValue = 3
    case .Four:
        lhsValue = 4
    case .Five:
        lhsValue = 5
    case .Six:
        lhsValue = 6
    case .Seven:
        lhsValue = 7
    case .Eight:
        lhsValue = 8
    case .Nine:
        lhsValue = 9
    case .Ten:
        lhsValue = 10
    case .Jack:
        lhsValue = 10
    case .Queen:
        lhsValue = 10
    case .King:
        lhsValue = 10
    case .Ace:
        lhsValue = 11
    }
    
    switch r.value {
    case .Two:
        rhsValue = 2
    case .Three:
        rhsValue = 3
    case .Four:
        rhsValue = 4
    case .Five:
        rhsValue = 5
    case .Six:
        rhsValue = 6
    case .Seven:
        rhsValue = 7
    case .Eight:
        rhsValue = 8
    case .Nine:
        rhsValue = 9
    case .Ten:
        rhsValue = 10
    case .Jack:
        rhsValue = 10
    case .Queen:
        rhsValue = 10
    case .King:
        rhsValue = 10
    case .Ace:
        rhsValue = 11
    }
    
    return lhsValue < rhsValue
}



var myCard_1: SuitedCard = SuitedCard(suit: .Hearts, value: .King, isFaceDown: true)
var myCard_2: SuitedCard = SuitedCard(suit: .Spades, value: .Ten, isFaceDown: true)

myCard_1 > myCard_2


let suits:[SuitedCard.Suit] = [.Hearts, .Diamonds, .Clubs, .Spades]
let values:[SuitedCard.Value] = [.Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten, .Jack, .Queen, .King, .Ace]

struct Deck {
    var cards: [PlayingCard] = []
    
    init() {
        for suit in suits {
            for value in values {
                cards.append(SuitedCard(suit: suit, value: value, isFaceDown: true))
            }
        }
        
        cards.append(Joker(color: .Red, isFaceDown: true))
        cards.append(Joker(color: .Black, isFaceDown: true))
        
        shuffle()
    }
    
    func shuffle() {
        // TODO: implement shuffle
        
    }
    
    mutating func dealHand() -> (PlayingCard, PlayingCard) {
        if var card = cards.popLast(),
            var faceUp = cards.popLast() {
            card.isFaceDown = true
            faceUp.isFaceDown = false
            return (card, faceUp)
        }
        fatalError("out of cards")
    }
}

var myDeck = Deck()
myDeck.cards
myDeck.dealHand()
myDeck.dealHand()




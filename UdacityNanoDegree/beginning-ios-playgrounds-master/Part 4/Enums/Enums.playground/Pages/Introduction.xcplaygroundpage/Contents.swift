//: ## Enumerations

//: ### Enums can represent any value in a finite set of related values.  Here are some examples ...

// Primary colors
enum PrimaryColor {
    case Red
    case Blue
    case Yellow
}

// Baseball teams of the American League West
enum AmericanLeagueWest: String {
    case As
    case Astros
    case Angels
    case Mariners
    case Rangers
}
print("\(AmericanLeagueWest.As.rawValue)")

//: [Next](@next)

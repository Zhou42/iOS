//: [Previous](@previous)

import Foundation
import UIKit

//: ### Optional Chaining
// Example: More with UIImageView
var anotherImageView = UIImageView()
anotherImageView.image = UIImage(named:"puppy_in_box")

var size = anotherImageView.image?.size
size.dynamicType

if let imageSize = anotherImageView.image?.size {
    print("Here's the image size: \(imageSize)")
} else {
    print("This image hasn't been set.")
}
// imageView.image

// Example: Animals With and Without Tails

var animal = Animal(name: "Lenny", species: "lemur", tailLength: 12)

//animal = Animal(name: "Gilbert", species: "Gorilla", tailLength: nil )

if let tailLength = animal.tail?.length {
    print("\(animal.name)'s tail is \(tailLength) cm long")
} else {
    print("\(animal.name) doesn't have a tail.")
}

let w = Int("123")
w!

class BetterViewController: UIViewController {
    var myButton: UIButton!
    override func viewDidLoad() {
        
    }
    
}


var romanticString = "How do I love thee? Let me count the ways."
var modifiedRomanticString = ""

for character in romanticString.characters {
    if character == "o" {
        modifiedRomanticString.append(Character("💋"))
    } else {
        modifiedRomanticString.append(character)
    }
}
modifiedRomanticString

//: [Next](@next)



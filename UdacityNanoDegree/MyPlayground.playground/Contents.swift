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

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var x = 42

var myString = "Hello"

// control flow
if x < 50 {
    print("X is less than 50")
} else {
    print("X is greater than or equal to 50")
}

// class
class ViewController: UIViewController {
    
}


// Functions
func printHello() {
    print("Hello")
}

printHello()

func printHello(helloString: String) {
    print(helloString)
}

printHello("Oi!")
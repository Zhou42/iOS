//: [Previous](@previous)
/*:
## Checkerboard Final
*/
print("The final answer is below!")
for i in 1...8 {
    for j in 1...8 {
        if j % 2 == i % 2 {
            print("⬛", terminator: "")
        } else {
            print("◻️", terminator: "")
        }
    }
    print("")
}

var sum: Int = 0;

var intArray: [Int?] = [1, 2, 3, nil]
for value in intArray {
    if let myValue = value {
        sum += myValue
        print("\(myValue)")
    }
}
sum
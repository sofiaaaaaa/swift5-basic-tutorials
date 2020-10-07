import UIKit

/*:

 # For loop
 
 
 */

for index in 1...10 {
    print("hello \(index)")
}

// Wildcard Pattern
for _ in 10...20 {
    print("hello")
}

let power = 10
var result = 1

for _ in 1 ... power {
    result *= 2
}

print(result)


for num in stride(from: 0, to: 10, by: 2) {
    print(num)
}


let list = ["Apple", "Kapple", "Bapple"]


for fruit in list {
    print(fruit)
}


for i in 2 ... 9 {
    for j in 1 ... 9 {
        print("\(i) * \(j) = \(i*j)")
    }
}

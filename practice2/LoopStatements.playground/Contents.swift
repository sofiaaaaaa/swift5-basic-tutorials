import UIKit

/*:
 
 # Loop Statements
 
 ## for-in Loop
 for-in 반복문을 통해 지정된 횟수만큼 코드를 반복하고 컬렉션을 열거하는 방법에 대해 공부합니다.

## Syntax
 
```
 for loopConstant in Range {
    statements
 }
 ```
 
 */

for index in 1 ... 10 {
    
    print("Hello")
}

let power = 10
var result = 1

for _ in 1 ... power {
    result += 2
}

for num in stride(from: 0, to: 10, by: 2) {
    print(num)
}

/*:
 
 ## Syntax
 
 ```
 for loopConstant in Collection {
    statements
 }
 
 
 
 ```
 
 */

let list = ["Apple", "Banana", "Orange"]

for fruit in list {
    print(fruit)
}

for i in 2 ... 9 {
    for j in 1 ... 9 {
        print("\(i) X \(j) = \(i*j)")
    }
}

/*:
 
 ## while Loop
 
 ```
 while condition {
    statements
 }
 
 repeat {
    statements
 } while condition
 
 ` ``
 
 */

var num = 1
var sum = 0

while num <= 100 {
    sum += num
    num += 1
}

// 조건을 먼저 판단해야하면 while문 사용
num = 0
while num < 100 {
    num += 1
}

// 코드를 먼저 실행해야하면 repeat를 사용
num = 0
repeat {
    num += 1
} while num < 100

import UIKit

/*:

 # While
 
```
     while condition {
        statements
     }
 ```
 
 */


var num = 1
var sum = 1

while num <= 100 {
    sum += num
    num += 1
}




/*:

 #  Repeat-While
 
```
     repeat {
        statements
     } while condition
 ```
 
 */


num = 0

repeat {
    num += 1
} while num < 100

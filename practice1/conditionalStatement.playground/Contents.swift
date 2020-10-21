import UIKit

/*:
 # Conditional Statements
  
## Value Binding Pattern

### Syntax
    
 ```
 case let name:
 case var name:
 ```
 */

let a = 1
switch a {
case let x:
    print(x)
default:
    break
}

// "Switch must be exhaustive" error meaning : 모든 케이스를 구현해야한다

switch a {
case let x where x > 100:
    print(x)
default:
    break
}

let pt = (1,2)

switch pt {
case let(x,y):
    print(x,y)
case (let x, let y):
    print(x,y)
case (let x, var y):
    print(x, y)
case let(x, _):
    print(x)
}



/*:
 ## Expression Pattern
 
 
 */


switch a {
case 0...10:
    print("0~10")
default:
    break
}

/*:
    ### Pattern Matching Operator
```
    a ~= b
```
*/

struct Size {
    var width = 0.0
    var height = 0.0
    
    static func ~=(left: Range<Int>, right: Size ) -> Bool {
        return left.contains(Int(right.width))
    }
}

let s = Size(width: 10, height: 20)

switch s {
case 1..<9:
    print("1~9")
case 10..<99:
    print("10~99")
default:
    break
}

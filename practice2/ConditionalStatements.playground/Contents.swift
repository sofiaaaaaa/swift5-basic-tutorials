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
    case var x where x > 100 :
        x = 200
        print(x)
    default:
        break
}

let pt = (1,2)

switch pt {
case let(x, y):
    print(x, y)
case (let x, let y):
    print(x, y)
case (let x, let _):
    print(x)
default:
    break
}

/*:
 
 ## Expression Pattern
 직접 구현한 형식에 대해 패턴 매칭을 적용하는 방법에 대해 공부합니다.
 
 ### Pattern Matching Operator
 
```
 a ~= b
 ```

 */

let b = 1

switch b {
    case 0...10:
        print("0 ~ 10")
    default:
        break
}


struct Size {
    var width = 0.0
    var height = 0.0
    
    static func ~=(left: Range<Int>, right: Size) -> Bool {
        return left.contains(Int(right.width))
    }
}

let s = Size(width: 10, height: 20)

switch s {
case 1..<11:
    print("a")
default:
    print("default")
}


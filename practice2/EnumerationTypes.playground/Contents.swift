import UIKit

/*:

#  Enumeration Types
 제한된 경우의 수를 표현하는 자료형에 대해 공부합니다.

 열거형 선언 문법
 열거형 사용 이유

 * 연관된 상수들을 묶어서 하나의 자료형으로 표현. 여기서 상수 하나하나를 case라고 지칭한다.
 * 코드의 가독성과 안정성을 높이기 위해 사용함.
 
 
 ## Syntax
 
```
 enum TypeName {
    case caseName,
    case caseName, caseName
 }
 
```
  
 */

let left = 0
let center = 1
let right = 2

var alignment = center

// 값만으로 어떤 역할을 하는지 파악할 수 있어야한다. 중복된 이름은 삭제한다.

enum Alignment {
    case left
    case right
    case center
}

Alignment.center

//   textAlignment 변수의 자료형은 enum Alignment
var textAlignment = Alignment.center

textAlignment = .right

if textAlignment == .center {
    
}

switch textAlignment {
case .left:
    print("left")
default:
    break
}

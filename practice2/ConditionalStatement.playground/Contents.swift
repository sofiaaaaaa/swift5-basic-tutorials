import UIKit

/*:
 
 # Conditional Statements

 ## switch Statement
 switch 문에서 값을 매칭시키고 실행할 코드를 결정하는 방법에 대해 공부합니다.

 Pattern Matching
 Interval Matching
 Fall through
 
 ### Syntax
 
 ```
 switch valueExpression {
    case pattern:
        statements
    case pattern, pattern:
        statements
    default:
        statements
 }
 
 ```

 */

let num = 1

switch num {
case 1:
    print("one")
case 2, 3:
    print("two or three")
default:
   break
}


/*:
 
 
 ### Syntax
 
 ```
 switch valueExpression {
    case pattern where condition:
        statements
    default :
        statements
 }
 
 ```
 
 */

switch num {
    case let n where n <= 10:
        print(n)
    default:
        print("others")
}

/*:
 
 ## Interval Matching
 
 * 범위연산자 사용

 */

let temperature = -8

switch temperature {
case ..<10:
    print("Cold")
    // 이어지는 블록 실행
    fallthrough
case 11..<20:
    print("Cool")
default:
    break
}


/*:
 
 ## guard Statement
 
 * Early Exit : 조건에 맞지 않으면, 일찍 코드를 종료함...
 guard 문을 활용해서 Early Exit 패턴을 구현하는 방법에 대해 공부하고, 동일한 코드를 if 문과 guard 문으로 구현하고 차이점을 비교합니다.

 ### Syntax
 
 ```
 guard condition else {
    statements
 }
 
 guard optionalBinding else {
    statements
 }
 ```
 
 */

func validate(id: String?) -> Bool {
//    guard let id = id else {
//        return false
//    }
//
//    guard id.count >= 6  else {
//        return false
//    }
    
    guard let id2 = id, id2.count >= 6 else {
        return false
    }
    
    return true
}


validate(id: nil)
validate(id: "abc")

func validateUsingIf() {
    var id: String? = nil
    
    if let str = id {
        if str.count >= 6 {
            print(str)
        }
    }
}

func validateUsingGuard() {
    var id: String? = nil
    
    guard let str = id else { return }
    guard str.count >= 6 else { return }
    print(str)
}

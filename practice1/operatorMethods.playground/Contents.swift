import UIKit

/*:

 #  Operator Methods
 
 * 연산자 메소드 선언 문법
 
 static func 연산자(파라미터) -> 리턴형 { 실행할 코드 }

 */
extension Double {
    static func +(left: Int, right: Double) -> Double {
        return Double(left) + Double(right)
    }
    static func +(left: Double, right: Int) -> Double {
        return Double(left) + Double(right)
    }
}

let a = 1
let b = 2.3

var validCount = 0

if a + b == 3.3 {
   validCount += 1
}

if b + a == 3.3 {
   validCount += 1
}

print(validCount)

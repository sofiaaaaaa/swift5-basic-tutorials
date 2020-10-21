import UIKit

/*:

 # Custom Operators

 * 문법 설명
 연산자 선언 문법
 
 ```
 prefix operator 연산자 postfix operator 연산자 infix operator 연산자
 static prefix func 연산자(파라미터) -> 리턴형 {
 실행할 코드
 }

 static postfix func 연산자(파라미터) -> 리턴형 {
 실행할 코드
 }

 static func 연산자(파라미터) -> 리턴형 {
 실행할 코드
 }
 ```
 
 */


infix operator **: MultiplicationPrecedence
extension Int {
    static func **(left: Int, right: Int) -> Int {
        var result = left
        for num in 1..<right{
            result *= left
        }
        return result
    }
}


var validCount = 0

if 2 ** 3 == 8 {
   validCount += 1
}

if 2 ** 10 == 1024 {
   validCount += 1
}

print(validCount)

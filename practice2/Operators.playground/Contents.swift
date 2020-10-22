import UIKit

/*:
 
 # Operator
 
 * Unary Operator : +a
 * Binary Operator : a + b
 * Ternary Operator : a ? b : c
 
 공백의 위치가 중요함.

 
    * Prefix Operator :  +a
    * Postfix Operator : a+
    * Infix Operator : a + b
 
 */


/*:
 
 ## Arithmetic Operators

 ### Remainder Operator (= Modulo Operator)
 
 */
//
//let a = 0
//let b = 1
//
//// 정수만 지원함.
//a % b
//
//let c = 1.0
//let d = 3.4
//
//c.truncatingRemainder(dividingBy: d)

/*:
 
 ### Overflow
 
 * 컴파일 타임에 발견할 수 없는 경우도 있다. 최종값을 예측할 수 없는 경우에 작은 자료형으로 선언하면 overflow가 생길 수 있다.
 
 */

// compile error: Operators.playground:46:23: error: arithmetic operation '81 * 9' (on type 'Int8') results in an overflow

//let num: Int8 = 9 * 9 * 9

/*:
 
 ## Comparison Operators
 값이 동일성과 크기를 비교하는 방법에 대해 공부합니다.

 == 연산자
 != 연산자
 < 연산자
 <= 연산자
 > 연산자
 >= 연산자
 
 */


/*:
 
 ## Logical Operators
 참과 거짓을 구분하는 논리 연산에 대해 공부합니다.
 
 ! 연산자 : Logical Not Operators
 && 연산자 : Logical AND Operators
 || 연산자 : Logical OR Operators
 
 */


/*:
 
 ## Ternary Conditional Operator
 조건을 판단한 후 실행할 코드를 결정하는 조건 연산자에 대해 공부합니다.
 
 삼항연산자
 
 ### Syntax
 
 ```
 condition ? expr1 : expr2
 ```

 */

let hour = 12

hour < 12 ? "am" : "pm"

/*:
 
 ## Short-circuit Evaluation, Side Effect
 논리 연산자가 논리식을 평가하는 방법에 대해 공부합니다.

 ## 단락 평가 (Short-circuit Evaluation)
 
 * 논리식에서 결과를 얻는데 필요한 최소한의 코드만 실행하는 것.
 
 
 
 ## Side Effect
 
 * side effect는 예측가능한 결과, 의도한 결과 범주에 있어야한다.
 * 표현식을 평가했을 때 값이 변경되거나 상태가 변경되는 것을 의미함


 */

// false &&
// true ||

//var a = 1
//var b = 1
//
//func updateLeft() -> Bool {
//    a += 1
//    return true
//}
//
//func updateRight() -> Bool {
//    b += 1
//    return true
//}
//
//if updateLeft() || updateRight() {
//
//}
//
//a
//b // updateRight 함수가 호출되지 않음
//
//// side effect 발생
//a = 1
//
//
//let resultA = updateLeft()
//
//let resultB = updateRight()
//
//if resultA && resultB {
//
//}

//a
//b


/*:
 
 ## Bitwise Operators
 
 * 장점 : 메모리 연산속도가 빠르고, 짧은 코드로 복잡한 로직을 구현할 때 유용.
 * 하드웨어 드라이버, 임베디드 프로그램, 암호화 코드 작성시 사용..
 * 논리연산자와 비슷하다.
 * Unsigned Type에서는 Logical shift (단순히 0을 옆 비트로 이동시킴)로 처리하고 signed Type에서는 Arithmetic shift(부호비트가 1이면 1로 채워짐) 로 처리함.

```
 // NOT operator
 ~a
 
 // AND
 a & b
 
 // OR
 a | b
 
 // XOR : 두비트가 다를 때만 최종비트가 1이 됨
 a ^ b
 
 // Left Shift : 곱하기와 같은 효과. 새로 추가된 비트에는 0이 추가됨.
 a << n
 
 // Right Shift : 나누기와 같음. 2의 배수로.
 a >> n
 
 ```
 
 */
//
//let bit: UInt8 = 0b0000_0010
//~bit
//
//let aaa: UInt8 = 0b0010_0010
//let bbb: UInt8 = 0b1100_1110
//
//aaa & bbb

// Unsigned Int 8bit
let aaa: UInt8 = 0b0010_0010 // 34
let bbb: UInt8 = 0b1100_1110 // 206

//// 238
//aaa | bbb
//
//// 236
//aaa ^ bbb
//
//// aaa * 2와 같은 계산
//aaa << 1
//
//// aaa * 4
//aaa << 2


// 17.   aaa/2
aaa >> 1


// signed Int 8bit

/*:
 
 ## Assignment Operators
 값을 저장하는데 사용하는 할당 연산자와 복합 할당 연산자에 대해 공부합니다.

 = 연산자
 lvalue와 rvalue
 += 연산자
 -= 연산자
 *= 연산자
 /= 연산자
 %= 연산자
 &= 연산자
 |= 연산자
 = 연산자
 <<= 연산자
 >>= 연산자

 
 */

//let a = 12

// lvalue : memory 공간을 의미
// rvalue : literal이나 임시값. 메모리값이 없음.

/*:
 
 ## Compound Assignment Operators
 복합할당 연산자
 
 ```
 // Addition Assignment Operater
 a += b
 a = a + b
 ```
 
 */

//var a = 1
//var b = 2
//a = a + b
//a += b


/*:
 
 ## Range Operators
 범위 연산자를 통해서 범위를 표현하는 방법에 대해 공부합니다.

 * Closed Range Operator
 * Half-open Range Operator
 * One-Sided Range
 

 ###  Closed Range Operator

 * a = lower bound, b = upper bound
 * a는 b보다 작아야한다.
 
```
 a ... b  // 공백 주의
 a... // 공백없이 붙여서
 ...a
 ```
 
 */

//
//(1 ... 10).reversed()
//12.34 ... 67.22 // 실수도 사용할 수 있다.
//
//var sum = 0
//for num in 1 ... 10 {
//    sum += num
//}
//
//let list = ["A", "B", "C", "D", "E"]
//list[2...] // prefix
//list[...2] // postfix

/*:
 
 ### Half-Open Range Operator
 
 ```
 a ..<b
 ..<a
 ```

 ### One-Sided Range
 
 ```
 ```
 
 */

//let list = ["A", "B", "C", "D", "E"]
//list[..<2]
//
//let range = 0 ... 5
//range.contains(7)
//
//let range2 = ...5 // lower bound가 무한대
//range2.contains(Int.min)


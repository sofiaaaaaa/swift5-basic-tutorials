import UIKit

/*:
 
 # Overflow Operators
 값 오버플로우가 무엇인지, 그리고 오버플로우 연산자를 사용해서 오버플로우를 허용할 때 값이 어떻게 변경되는지에 대해 공부합니다.

 오버플로우
 &+ 연산자
 &- 연산자
 &* 연산자

 * 산술연산자는 오버플로우를 허용하지 않는다.
 
 */

Int8.min // -128
Int8.max // 127

// compile error : Arithmetic operation '127 + 1' (on type 'Int8') results in an overflow
//let num: Int8 = Int8.max + 1


/*:
 
 ## Overflow Addition Operator
 
 * +, -, * 연산자에 & 기호를 붙여서 오버플로우 허용 가능
 
 ```
 a &+1
 
 ```
 
 */

// Int8에는 8비트의 데이터를 저장할 수 있다.
let a: Int8 = Int8.max // 127
let b: Int8 = a &+ 1 // -128


let c: Int8 = Int8.min // -128
let d: Int8 = c &- 1 // 127


/*:
 
 ## Overflow Multiplication Operator
  
 ```
 a &*1
 
 ```
 
 */

let e: Int8 = Int8.max &* 2  // -2

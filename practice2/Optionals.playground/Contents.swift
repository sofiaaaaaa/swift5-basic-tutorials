import UIKit

/*:
 
 # Optionals
 
 값이 없음을 표현하는 옵셔널에 대해 설명하고, 값이 없음을 나타내는 특별한 값인 nil과 옵셔널 형식에 저장된 값을 추출하는 방법에 대해 공부합니다.

 * Optional Type, Non-optional Type
 * nil
 * Forced Unwrapping
 
 * nil로 초기화할 때는 타입추론을 할 수 없다.
 
 */

let num: Int = 0
// 네트워크가 중간에 끊겼다거나 할 때 고려.
print(num)

let optionalNum: Int? = nil // 아무것도 저장하지 않겠다.

/*:
 
 ## Optional Type
 
 ```
 // Non-optional Type
 TypeName
 
 
 // Optional Type
 TypeName?
 
 ```
 
 */


let str: String = "Swift"
let optionalStr: String? = nil

let a: Int? = nil
let b = a

/*:
 
 ## Unwrapping
 
 *  값을 추출하는 방법
 
 1. Forced Unwrapping : !

 
 
 */

var numnum: Int? = nil
print(numnum)

numnum = 123
print(numnum)

print(numnum!)

numnum = nil

// app에서 crash가 발생하고 종료됨.
//numnum!
 
if numnum != nil {
    print(numnum!)
}

numnum = 123

// Optional Int
let before = numnum

// Int
let after = numnum!

/*:
 
 ## Optional Binding
 옵셔널 바인딩을 통해 안전하게 처리하는 방법에 대해 공부합니다.
 
 ### Syntax
 
 ```
 if let name: Type = OptionalExpression {
    statements
 }
 
 while let name: Type = OptionalExpression {
    statements
 }
 
 guard let name: Type = OptionalExpression else {
    statements
 }
 ```
 
 */

 
/*:
 
 ## Implicitly Unwrapped Optionals
 특정 컨텍스트에서 값이 자동으로 추출되는 IUO에 대해서 공부합니다.
 
 Type!
 
 */

var numnumnum: Int! = 12

let aaa = num

// Int
aaa

let bbb: Int = numnumnum

/*:
 
 ## Nil-Coalescing Operator
 Nil-coalescing 연산자를 활용해서 옵셔널에 값이 저장되어 있지 않을 때 사용할 값을 지정하는 방법에 대해 공부합니다.
 
 */

var msg = ""
var input: String? = "Swift"

if let inputName = input {
    msg = "Hello, " + inputName
} else {
    msg = "Hello, Stranger"
}

print(msg)

var sstr = "Hello, " + (input != nil ? input! : "Stranger" )
print(sstr)


/*:
 
 ### Syntax
 ```
 a ?? b
 OptionalExpression ?? Expression
 
 ```
 * 단락평가를 수행한다. 오른쪽 표현식에는 side-effect가 발생하는 코드를 포함하지 않아야한다.
 
 */

input = nil
sstr = "Hello, " + (input ?? "Stranger")
print(sstr)

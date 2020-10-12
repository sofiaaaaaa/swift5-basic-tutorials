import UIKit

/*:
 # Tuple
 
 ```
// Unnamed Tuple
 (expr1, expr2, ...)
 
 ```
 * expr1 <- Tuple Member 멤버의 값은 바꿀 수 있지만 멤버의 수는 변경할 수 없다.
 * 두개이상의 값을 저장가능하다.
 * tuple은 Unnamed Tuple과 Named Tuple이 있다.

*/

// Scalar Type
//let i  = 12, 23


let i = (12, 34)

// Immutable Tuple
let data = ("<html>", 200, "OK", 12.34)

/*:
 
 ## Explicit Member Expression
 
 ```
    tuple.n
 ```
 
  * 0-based Index
 */

//Unnamed Tuple
data.0
data.1
data.2
data.3

//Cannot assign to property: 'data' is a 'let' constant
//data.1 = 404

// Mutability = 가변성. 값을 바꿀 수 있는 변수
var mutableTuple =  data;

mutableTuple.1 = 404



/*:
 
 ##  Named Tuple
 
 ```
 (name1: expr1, name2: expr2, ...)

 ```
 
 */

let data2 = (body: "<html>", statusCode: 200, statusMessage: "OK", dataSize: 12.34)

data2.0
data2.body


/*:
 
 ## Tuple Docomposition
 
 ```
 let (name1, name2, ...) = tuple Expr
 let (name1, name2, ...) = tuple Expr
 
 ```
  * 튜플에 저장된 멤버를 개별 상수나 개별 변수에 저장하는 방법
  * 튜플 분해
  * 튜플에 정의된 멤버만큼 변수를 선언해야함.
  * 특정한 멤버만 변수에 저장하고 싶을 때는 wildcard 사용 underscore. '_'
 */

let data3 =  ("<html>", 200, "OK", 12.34)

//let body = data.0
//let code = data.1
//let message = data.2
//let size = data.3


let (body, code, message, size) = data

body

let (body2, _, _, _) = data

body2

/*:
 ## Tuple Matching
 
 * switch 문을 활용해서 튜플에 저장된 값을 매칭시키는 방법
 
 
 */

let resolution = (3840.0, 2160.0)

if resolution.0 == 3840 && resolution.1 == 2160 {
    print("4K")
}


switch resolution {
// interval matching
case (3840...4096, 2160):
    print("4K")
// wild card
case ( _ , 1080):
    print("1080p")
// value binding
case let(w, h) where w/h == 16.0 / 9.0:
    print("16:9")
default:
    break
}


func convertToTuple(name: String, age: Int, address: String) -> (name: String, age: Int, address:String) {
    return (name, age, address)
    
}

let name = "John doe"
let age = 34
let address = "Seoul"

let t = convertToTuple(name: name, age: age, address: address)

print(t.name, t.age, t.address)

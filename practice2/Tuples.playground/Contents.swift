import UIKit

/*:
 
 # Tuples
 
 두 개 이상의 값을 저장하는 Compound Type인 튜플에 대해 공부합니다.

 튜플 형식
 튜플 선언 문법
 Explicit Member Expression
 튜플의 가변성
 
 ## Unnamed Tuple
 
 */

// Int는 Scala Type.  값을 하나만 저장할 수 있다.
//let i = 12, 34

// Unnamed Tuple
let i = (12, 34)

let data = ("<html>", 200, "OK", 12.34)

// 0-based Index
data.0

//data.1 = 404


// Tuple은 Value Type이다.
var mutableTuple = data
mutableTuple.1 = 404


/*:
 
 ## Named Tuple
 
 ```
 (name1: expr1, name2: expr2)
 ```
 
 */

let  data3 = (body: "<html>", statusCode: 200, statusMessage: "OK", dataSize: 12.34)

data3.body

/*:
 
 ## Tuple Decomposition
 튜플에 저장된 멤버를 개별 상수나 개별 변수에 저장하는 방법에 대해 공부합니다.
 
 */

let data5 = ("<html>", 200, "OK", 12.34)
let (body, code, message, dataSize) = data5
body

let (body3, code3, message3, _) = data5

/*:
 
 ## Tuple Matching
 switch 문을 활용해서 튜플에 저장된 값을 매칭시키는 방법에 대해 공부합니다.
 
 */

let resolution = (3840.0, 2160.0)

switch resolution {
    case let(w, h) where w / h == 16.0 / 9.0 :
        print("16:9")
    case (_, 1080):
        print("1080p")
    case (3840...4096, 2160) :
        print("4k")
    default :
        break
}


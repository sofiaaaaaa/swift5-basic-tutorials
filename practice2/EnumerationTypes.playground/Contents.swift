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


/*:
 
 ## Raw Values
 case에 값을 저장하고 읽는 방법에 대해 공부합니다.

 Raw Value 문법
 Raw Value Type에 따른 기본값

  * 원시값이라고 부른다.
 * RawValueType에 허용되는 자료형은 String, Character, Number type이다.
 
 
 ## Syntax
 
```
 enum TypeName: RawValueType {
    case caseName = Value
 }
 
```
 */


enum Alignment2: Int {
    case left
    case right
    case center
}

// rawvalue를 지정하지 않으면 0, 1, 2 이렇게 되고, 값을 지정하면 다음 값은 자동으로 이전값보다 1 증가한 값이 저장된다.
print(Alignment2.left.rawValue)


Alignment2(rawValue: 0) // left

enum Weekday: String {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday =  "토요일"
}

// sunday
Weekday.sunday.rawValue


// Character 형은 값을 꼭 지정해줘야한다.
enum ControlChar: Character {
    case tab = "\t"
    case newLine = "\n"
}



/*:
 
 ## Associated Values
 case에 연관 값을 저장하는 방법에 대해 공부합니다.

 Associated Value 문법
 Raw Value와의 차이점
 
 ### Syntax
 
```
 enum TypeName {
    case caseName(Type)
    case caseName(Type, Type, ...)
 }
 
```
 
 */

// 아마추어에겐 당연하지만, 프로에게 불편한 코드 : 숫자로 변환하는 과정이 필요하고, 하나의 값만 저장됨
//enum VideoInterface: String {
//    case div = "1028x768"
//    case hdmi  = "2048x1536"
//    case displayPort  = "3840x2160"
//}


enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(Int, Int, Double, Bool)
    case displayPort(CGSize)
}

var input = VideoInterface.dvi(width: 2048, height: 536)

switch input {
case .dvi(2048, 1536):
    print("a")
case .dvi(2048, _):
    print("a any")
case .dvi:
    print("dvi")
case .hdmi(let width, let height, let version, let audioEnabled):
    print("\(width) * \(height)")
case let .displayPort(size):
    print("dp \(size)")
default:
    break
}

input = .hdmi(3840, 1,  2.1, true)
input



/*:
 
 ## Enumeration Case Pattern
 조건문과 반복문에서 연관 값을 매칭시키는 방법에 대해 공부합니다.
 
 
 ### Syntax
 
 ```
 case Enum.case(let name):
 case Enum.case(var name):
 
 case let Enum.case(name):
 case var Enum.case(name):
 
 ```
* Enum명은 생략가능.
 
 */


enum Transportation {
    case bus(number: Int)
    case taxi(company: String, number: String)
    case subway(lineNumber: Int, express: Bool)
}

var tpt = Transportation.bus(number: 471)

switch tpt {
case .bus(let n):
    print(n)
case .taxi(let c, _):
    print(c)
case let .subway(l, e):
    print(l, e)
default:
    break
}

tpt = Transportation.subway(lineNumber: 2, express: false)


//  enum case를 조건문에서 쓰는 방법

//  let을 외부에서 사용하면 express를 상수로 활용할 수 있다.
if case let .subway(2, express) = tpt {
    if express {
        
    } else {
        
    }
}

if case .subway(_, true) = tpt {
    print("express")
}

let list = [
    Transportation.subway(lineNumber: 2, express: false),
    Transportation.bus(number: 22),
    Transportation.subway(lineNumber: 7, express: true),
    Transportation.taxi(company: "KakaoTaxi", number: "1234")
]

for case let .subway(n, _)  in list {
    print("subway \(n)")
}

for case let .subway(n, true) in list {
    print("subway \(n)")
}

for case let .subway(n, true) in list where n == 2 {
    print("subway \(n)")
}

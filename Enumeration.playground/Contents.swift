import UIKit

/*:
 
 # Enumeration
 
 * case : Enumeration type 내에 정의된 각 constant를 의미함
 
 */

//let left = 0
//let center = 1
//let right = 2
//
//
//var alignment = center


/*:
 
 ## Syntax
 
```
 // camelcase 형식 주의!!
 enum TypeName: RawValueType {
    case caseName = Value
    case caseName, caseName
 }
 
 ```

 */

// case에 값을 입력하지 않으면 default로 입력된다.
enum Alignment: Int {
    case left = 100
    case right
    case center
}

Alignment.center
Alignment.left

var textAlignment = Alignment.center
textAlignment = .left
// textAlignment = .justify

if textAlignment == .center {
    
}

switch textAlignment {
    case .left:
        print("l")
    case .right:
        print("r")
    case .center:
        print("r")
    //default:
    //    break
}



// 값을 따로 지정해놓으면 다음 case는 그 전의 값보다 1씩 증가하며 선언된 이후에는 rawValue를 바꿀 수 없다.
Alignment.left.rawValue
Alignment.right.rawValue


Alignment(rawValue: 0)
Alignment(rawValue: 200) // nil

enum Weekday: String  {
    case sunday
    case monday
    case tuesday
    case wednesday
    case tursday
    case firday
    case saturday
}

// String형은 별도로 값을 지정하지 않으면 case의 이름과 동일한 값이 저장됨
Weekday.sunday.rawValue

// Charcter형은 값을 직접 저장해야함.
enum ControlChar: Character {
    case tab = "\t"
    case newLine = "\n"
}

enum HttpStatusCode: Int {
   case ok = 200
   case badRequest = 400
   case unauthorized = 401
   case notFound = 404
   case internalServerError = 500
   case badGateway = 502
}

func solution(_ statusCode:Int) -> String {

var result = ""
    
switch statusCode {
    case HttpStatusCode.ok.rawValue:
            result =  "OK"
        case HttpStatusCode.badRequest.rawValue:
            result =  "Bad Request"
        case HttpStatusCode.unauthorized.rawValue:
            result =  "Unauthorized"
        case HttpStatusCode.notFound.rawValue:
            result =  "Not Found"
         case HttpStatusCode.internalServerError.rawValue:
            result =  "Internal Server"
         case HttpStatusCode.badGateway.rawValue:
            result =  "Bad Gateway"
        default:
            result =  "Unsupported Code"
    }
    
    return result

}

/*:
 
 ## Associated Values
 
```
 enum TypeName {
    case caseName(Type)
    case caseName(Type, Type, ...)
 }
 
 ```
 
 // Associated Values 연관값
 
 */


enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(Int, Int, Double, Bool)
    case displayPort(CGSize)
}

var input = VideoInterface.dvi(width: 2048, height: 1536)

switch input {
    case .dvi(2048, 1536):
        print("dvi 2048 * 1536")
    case .dvi(2048, _) :
        print("dvi 2048 * Any")
    case .dvi :
        print("dvi")
    case .hdmi(let width, let height, let version, var audioEnabled) :
        print("hdmi \(width) \(height)")
    case let .displayPort(size):
        print("dp")
}

input = .hdmi(3840, 2170, 2.1, true)


/*:
 
 ## Enumeration Case Pattern
 
 * 조건문과 반복문에서 연관 값을 매칭시키는 방법
 
```
    case Enum.case(let name):
    case Enum.case(var name):
 
    case let Enum.case(name):
    case var Enum.case(name):
 
 ```
 
 // Associated Values 연관값
 
 */

enum Transportation {
    case bus(number: Int)
    case taxi(company: String, number: String)
    case subway(lineNumber: Int, express: Bool)
}

var tpt = Transportation.bus(number: 7)

switch tpt {
case .bus(let n):
    print(n)
case .taxi(let c, var n):
    print(c, n)
case .taxi(let c, _):
    print(c)
case let .subway(l, e):
    print(l, e)
default:
    break
}

tpt = Transportation.subway(lineNumber: 2, express: false)

// 2호선인지 확인후 급행여부에 따라 분기 처리 (express는 immutable 변수)
if case let .subway(2, express) = tpt  {
    if express {
        
    } else {
        
    }
}

// 값을 바인딩하지 않음.
if case .subway(_, true) = tpt {
    print("express")
}

let list = [
    Transportation.subway(lineNumber: 2, express:   false),
    Transportation.bus(number: 4412),
    Transportation.subway(lineNumber: 7, express: true),
    Transportation.taxi(company: "SeoulTaxi", number: "1234")
]

// for 문에서 enum은 패턴과 일치하는 것만 열거한다.
for case let .subway(n, _) in list {
    print("Subway \(n)")
}


// 급행 지하철만 열거
for case let .subway(n, true) in list {
    print("subway \(n)")
}

for case let .subway(n, true) in list where n == 2 {
    print(" 2호선 지하철 ")
}

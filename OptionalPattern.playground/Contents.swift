import UIKit

/*:
 # Optional Pattern

 * 옵셔널 코드 정의를 살펴보면 enum 형의 제네릭으로 지정되어있어서 모든 데이터 타입이 옵셔널로 선언할 수 있다.
 
 @frozen public enum Optional<Wrapped> : ExpressibleByNilLiteral {

     /// The absence of a value.
     ///
     /// In code, the absence of a value is typically written using the `nil`
     /// literal rather than the explicit `.none` enumeration case.
     case none

     /// The presence of a value, stored as `Wrapped`.
     case some(Wrapped)
 
 ```
 let b: Optional<Int> = 0
 
 ```
 *
 
 */

let a: Int? = 0
let b: Optional<Int> = 0

if let x = a {
    print(x)
}

/*:
 
 # enum의 case를  활용한 nil 값 탈출 방법
 
 */

if case .some(let x) = a {
    print(x)
}

if case let x? = a {
    print(x)
}


let list: [Int?] = [0, nil, nil, 3, nil, 5]

for item in list {
    guard let x = item else { continue }
    print(x)
}

for case let x? in list {
    print(x)
}

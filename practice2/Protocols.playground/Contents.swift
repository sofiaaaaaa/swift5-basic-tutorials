import UIKit

/*:

# Protocols
## Protocol Syntax
프로토콜 선언 문법과 프로토콜 채용 문법에 대해 공부합니다.

프로토콜 선언 문법
프로토콜 채용 문법
요구사항 구현
AnyObject 프로토콜
클래스 프로토콜

 ```
 protocol ProtocolName {
    propertyRequirements
    methodRequirements
    initializerRequirements
    subscriptRequirements
 }
 
 protocol ProtocolName: Protocol, ... {
 
 
 }
 ```
 
 
*/

protocol Something {
    func doSomthing()
}

protocol SomthingObject: AnyObject, Something {
    
}

//struct Value: SomthingObject {
//    
//}

class Object: SomthingObject {
    func doSomthing() {
        
    }
}

/*:
 
 ## Initializer Requirements
 프로토콜에서 생성자를 선언하고 형식에서 요구사항을 구현합니다.

 구조체와 클래스에서 생성자 구현의 차이
 final 클래스에서 프로토콜 구현
 상속과 중복 선언 오류
 Non-failable Initializer와 Failable Initializer

 ```
 protocol ProtocolName {
    init(param)
    init!(param)
    init?(param)
 }
 ```
 */

//protocol Figure {
//    var name: String { get }
//    init(n: String)
//}
//
//struct Rectangle: Figure {
//    var name: String
//
//    init(n: String) {
//        name = n
//    }
//}
//
//class Circle: Figure {
//    var name: String
//
//    required init(n: String) {
//        name = n
//    }
//}
//
//final class Triangle: Figure {
//    var name: String
//
//    init(n: String) {
//        name = n
//    }
//}
//
//class oval: Circle {
//    var prop: Int
//    init() {
//        prop = 0
//        super.init(n: "Oval")
//    }
//
//    required convenience init(n: String) {
//        self.init()
//    }
//}

//protocol Grayscale {
//    init(white: Double)
//}
//
//
//struct Color: Grayscale {
//
//    // Non-failable initializer requirement 'init(white:)' cannot be satisfied by a failable initializer ('init?')
////    init?(white: Double) {
////
////    }
//
//    init!(white: Double) {
//
//    }
//}

protocol Grayscale {
    init?(white: Double)
}


struct Color: Grayscale {
    
    init?(white: Double) {

    }
    
//    init!(white: Double) {
//
//    }
}

/*:
 
 ## Subscript Requirements
 프로토콜에서 서브스크립트를 선언하고 형식에서 요구사항을 구현합니다.

 ```
 protocol ProtocolName {
    subscript(param) -> ReturnType { get set }
 }
 ```
 
 */

//protocol List {
//    subscript(idx: Int) -> Int { get }
//}
//
//struct DataStore: List {
//    subscript(idx: Int) -> Int {
//        return 0
//    }
//}

protocol List {
    subscript(idx: Int) -> Int { get set }
}

struct DataStore: List {
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {
            
        }
    }
}

/*:
 
 ## Protocol Types
 프로토콜 타입과 프로토콜 적합성에 대해 공부합니다.
 
 프로토콜 타입
 프로토콜과 타입 캐스팅
 프로토콜 적합성
 상속과 유사한 패턴 구현
 
 */

//protocol Resettable {
//    func reset()
//}
//
//class Size: Resettable {
//    var width = 0.0
//    var height = 0.0
//
//    func reset() {
//        width = 0.0
//        height = 0.0
//    }
//}
//
//let s = Size()

// upcasting 프로토콜형식으로 저장하면 프로토콜에 저장된 멤버만 사용가능하다.
//let r: Resettable = Size()

/*:
 
 ### Protocol Conformace
 프로토콜 적합성
 
 */
//
//s is Resettable
//s is ExpressibleByNilLiteral
//
//let r = Size() as Resettable
//r as? Size


/*:
 
## Protocol composition
다수의 프로토콜을 병합해서 하나의 임시 프로토콜을 만드는 방법을 공부합니다.

 */

//protocol Resettable {
//    func reset()
//}
//
//protocol Printable {
//    func printValue()
//}
//
//class Size: Resettable, Printable {
//    var width = 0.0
//    var height = 0.0
//
//    func reset() {
//        width = 0.0
//        height = 0.0
//    }
//
//    func printValue() {
//        print(width, height)
//
//    }
//}
//
//class Circle: Resettable {
//    var radius = 0.0
//
//    func reset() {
//        radius = 0.0
//    }
//}
//
//class Oval: Circle {
//
//}
//
//let r: Resettable = Size()
//let p: Printable = Size()
//
//var rp: Resettable & Printable = Size()
////rp = Circle()
//
//var cr: Circle & Resettable = Circle()
//
//cr = Oval()


/*:
 
 ## Optional Requirements
 선택적 요구사항을 선언하는 방법에 대해 공부합니다.

 @objc Attribute
 optional Modifier
 선택적 요구사항과 옵셔널 체이닝

 ```
 @objc protocol ProtolName {
    @objc optional requirements
 }
 ```
 
 */
//
//@objc protocol Drawable {
//
//    @objc optional var strokeWidth: Double { get set }
//    @objc optional var strokeColor: UIColor { get set }
//    func draw()
//    @objc optional func reset()
//
//}
//
//class Rectangle: Drawable {
//    func draw() {
//
//    }
//}
//
//let r2: Drawable = Rectangle()
//r2.draw()
//r2.strokeWidth // nil
//r2.reset?()

/*:
 
 ## Protocol Extension
 프토토콜 익스텐션을 통해 공통 구현을 제공하는 방법에 대해 공부합니다.

 프로토콜 확장
 멤버 우선순위
 멤버 추가 형식 제한
 
 */

protocol Figure {
    var name: String { get }
    func draw()
}


// 형식이 Equatable 프로토콜도 채용해야한다.
extension Figure where Self: Equatable {
    func draw() {
        print("draw figure")
    }
}

// 위 extension에서 draw를 미리 구현해놨기 때문에 여기서 구현하지 않아도 된다. 
struct Rectangle: Figure, Equatable {
    var name = ""
    
//    func draw() {
//        print("draw Rectangle")
//    }
}

let r = Rectangle()
r.draw()




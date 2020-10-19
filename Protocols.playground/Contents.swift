import UIKit

/*:
 
 # Protocols
 프로토콜 선언 문법과 프로토콜 채용 문법에 대해 공부합니다.

 프로토콜 선언 문법
 프로토콜 채용 문법 Adopting Protocols
 요구사항 구현
 AnyObject 프로토콜
 클래스 프로토콜
 
 ## Protocols Syntax
 
 * 형식에서 구현해야하는 멤버
 * 두개이상의 상속 허용. 다중상속허용
 
 ```
 protocol ProtocolName {
    
    propertyRequiredMents
    methodRequirements
    initializerRequirements
    subscriptRequirements
    
 }
 
 protocol ProtocolName: Protocol, ... {
 
 }
 
 // Adopting Protocols
 enum TypeName: ProtocolName, ... {
 
 }
 
 struct TypeName: ProtocolName, ... {
 
 }
 
 // super class 가 먼저 나와있어야함.
 class TypeName: SuperClass, ProtocolName, ... {
 
 }
 
 ```
 
 
 
 */

protocol Something {
    
    func doSomething()
    
}

struct Size: Something {
    // method head만 일치시키고, method body는 자유롭게 구현가능
    func doSomething() {
        <#code#>
    }
}


/*:
 
 ## Class-Only Protocols
 
 ```
 protocol ProtocolName: AnyObject {
 
 }
 ```
 */

protocol SomethingObject: AnyObject, Something {
    
}

// 프로토콜에 class가 상속된 경우 struct에서 상속받을 수 없다.
//struct StructTest: SomethingObject {
//}

class Object: SomethingObject {
    func doSomething() {
        <#code#>
    }
}


/*:
 
 ## Property Requirements

 프로토콜에서 속성을 선언하고 형식에서 요구사항을 구현합니다.

 var 키워드 용법
 가변성 선언
 static 키워드와 class 키워드
 
 * var 키워드로 선언해야함
 
 ```
 protocol ProtocolName {
    var name: Type { get set }
    static var name: Type { get set }
 }
 ```
 */

protocol Figure {
    // get, set키워드가 있으면 읽기, 쓰기 계산속성을 추가해야함.
//    var name: String { get  set }
    
    //형식 속성으로 추가해야함
    static var name: String { get  set }
}

struct Rectangle: Figure {
    static var name = "Rect"
}

struct Triangle: Figure {
    static var name = "Triangle"
}

//struct Circle: Figure {
//    static var name: String {
//
//        get {
//            return "Circle"
//        }
//
//        set {
//
//        }
//    }
//}


// overriding하려면 class를 사용해야한다.
class Circle: Figure {
    class var name: String {
        
        get {
            return "Circle"
        }
        
        set {
            
        }
    }
}


/*:
 
 ## Method Requirements
 프로토콜에서 메소드를 선언하고 형식에서 요구사항을 구현합니다.

 mutating 메소드 선언
 static 키워드와 class 키워드
 
 ```
 protocol ProtocolName {
    func name(param) -> ReturnType
    static func name(param) -> ReturnType
    mutating func name(param) -> ReturnType
 }
 
 ```
 
 */

protocol Resettable {
//    func reset()
    // type 메서드
    static func reset()
}

class Size4: Resettable {

    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
    
    // 이름이 동일한 메소드를 type메서드와 인스턴스 메서드로 동시에 구현할 수 있다.
//    static func reset() {
//        <#code#>
//    }
    
    class func reset() {
        <#code#>
    }
}


protocol ResettableM {
//    func reset()
    mutating func reset()
    
}

struct Size6: ResettableM {
    var width = 0.0
    var height = 0.0
    
    // struct의 속성의 값을 바꾸려면 mutating 키워드를 추가해야한다. 이때 protocol의 메서드에도 mutating 키워드가 선언되어있어야한다.
    mutating func reset() {
        width = 0.0
        height = 0.0
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
    init?(param)
    init!(param)
 }
 
 ```
 
 */

protocol Figure1 {
    var name: String { get }
//    init(name: String)
    // 생성자의 파라미터가 속성과 달라지면 명시적으로 구현해야함.
    init(n: String)
}

class Rectangle1: Figure1 {
    var name: String
    
    // 프로토콜의 요구사항을 충족시키기 위해 init 메서드를 구현하고 required키워드를 추가해서 서브클래스가 해당 클래스를 상속받았을 때 이 메서드를 구현하도록 해야한다.
   required init(n: String) {
        name = n
    }
}


// final class는 상속 금지 클래스라는 뜻이고 init()에 required 키워드를 명시하지 않아도 된다.
final class Triangle1: Figure1 {
    var name: String
    
    init(n: String){
        name = n
    }
}

class Circle1: Figure1 {
    var name: String
    
    required init(n: String) {
         name = n
     }
}

// Circle1에  Figure1이 채용되어있으므로 에러남
//class Oval: Circle1, Figure1 {
//
//}

class Oval: Circle1 {
    var prop: Int

    init() {
        prop = 0
        super.init(n: "Oval")
    }
    
    required convenience init(n: String){
        self.init()
    }
}

//protocol Grayscale {
//    init(white: Double)
//}
//
//struct Color: Grayscale {
//    // 초기화에 실패하면 런타임에러가 난다.
//    init!(white: Double) {
//     }
//}

protocol Grayscale {
    init?(white: Double)
}

struct Color: Grayscale {
    init(white: Double) {
        
    }
    
//    init?(white: Double) {
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
//    subscript(idx: Int) -> Int { get set }
//}
//
//struct DataStore: List {
//    subscript(idx: Int) -> Int {
//        get {
//            return 0
//        }
//
//        set {
//
//        }
//    }
//}


protocol List {
    subscript(idx: Int) -> Int { get }
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


struct Color2: Equatable {
   let red: Int
   let green: Int
   let blue: Int
   
   static var black: Color2 {
      return Color2(red: 0, green: 0, blue: 0)
   }
   
   static var white: Color2 {
      return Color2(red: 255, green: 255, blue: 255)
   }
    
    static func ==(lhs: Color2, rhs: Color2) -> Bool {
        return lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue
    }
    
    static func !=(lhs: Color2, rhs: Color2) -> Bool {
        return lhs.red != rhs.red || lhs.green != rhs.green || lhs.blue != rhs.blue
    }
}





// 아래에 있는 코드는 수정하지 마세요.
let b = Color2.black
let w = Color2.white

print(b == w)

/*:
 
 ## Protocol Types
 
 프로토콜 타입과 프로토콜 적합성에 대해 공부합니다.
 * First-class Citizen : 독립적인 형식. 변수나 상수, 파라미터, return시 자료형으로 사용할 수 있다.
 
 프로토콜 타입
 프로토콜과 타입 캐스팅
 프로토콜 적합성
 상속과 유사한 패턴 구현
 
 */

protocol Resettable2 {
    func reset()
}

class Size22: Resettable2 {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
}

let sss = Size22()

// upcasting과 같다.
let rrr: Resettable2 = Size22()
rrr.reset()

/*:
 
 ## Protocol Conformance
 * 프로토콜 적합성은 특정 형식이 프로토콜을 채용하고 있는지 측정하는 척도
 
 ```
 
 instance is ProtocolName
 
 // compile time casting
 instance as ProtocolName
 
 // runtime casting
 instance as? ProtocolName
 instance as! ProtocolName

 ```
 */

sss is Resettable2

let r = Size22() as Resettable2

r as? Size22

/*:
 
 ## Collection of Protocol Types
 
 
 */

protocol Figure5 {
    func draw()
}

struct Triangle5: Figure5 {
    func draw() {
        print("draw triangle")
    }
}

class Rectangle5: Figure5 {
    func draw() {
        print("draw rect")
    }
}

class Circle5: Figure5 {
    var radius = 0.0
    
    func draw() {
        print("draw circle")
    }
}

let t6 = Triangle5()
let r6 = Rectangle5()
let c6 = Circle5()

let list : [Figure5] = [t6, r6, c6]

for item in list {
    item.draw()
    
    if let c = item as? Circle5 {
        c.radius
    }
}

/*:
 
 ## Protocol composition
 다수의 프로토콜을 병합해서 하나의 임시 프로토콜을 만드는 방법을 공부합니다.
 
 */

protocol Resettable10 {
    func reset()
}

protocol Printable10{
    func printValue()
}

class Circle10: Resettable10 {
    var radius = 0.0
    func reset() {
        radius = 0.0
    }
}

class Oval10: Circle10 {
    
}

class Size10: Resettable10, Printable10 {
    var width = 0.0
    var height = 0.0
    
    func reset() {
        width = 0.0
        height = 0.0
    }
    
    func printValue() {
            print("aaaaa")
    }
}

let sizeR: Resettable10 = Size10()
let sizeP: Printable10 = Size10()


// protocol & protocol
var rp: Resettable10 & Printable10 = Size10()

//rp = Circle10()

// class & protocol
var cr: Circle10 & Resettable10 = Circle10()
cr  = Oval10()


/*:
 
 # Optional Protocol Requirements
 
 * 클래스에서만 사용할 수 있다. AnyObject를 자동으로 상속하기 때문.
 
 ```
 @objc protocol ProtocolName {
    @objc optional requirements
 }
 ```
 
 */


// 이 프로토콜을 채용하는 자료형에서는 모든 멤버를 선언해야한다.
@objc protocol Drawable {
    @objc optional var strokeWidth: Double { get set }
   @objc optional var strokeColor: UIColor { get set }
    func draw()
    @objc optional func reset()
}

class Rectangle20: Drawable {
    func draw() {
        
    }
}

let r20: Drawable = Rectangle20()
r20.draw()

// optional
r20.strokeWidth

// optional method
r20.reset?()

/*:
 
 ## Protocol Extension
 프토토콜 익스텐션을 통해 공통 구현을 제공하는 방법에 대해 공부합니다.

 프로토콜 확장
 멤버 우선순위
 멤버 추가 형식 제한

 */

protocol Figure30 {
    var name: String { get }
    func draw()
}

// Equatable 프로토콜도 채용해야 해당 extension이 적용된다.
extension Figure30 where Self: Equatable{
    func draw() {
        print("draw figure")
    }
}

struct Rectangle30: Figure30 , Equatable{
    var name = ""

//    func draw() {
//        print("draw figure333")
//    }
}

let r30 = Rectangle30()
// 직접 구현한 메서드가 높은 우선순위를 가진다.
r30.draw()


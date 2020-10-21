import UIKit

/*:
 
 # Generic Function
 특정 형식과 연관되지 않은 함수를 구현하는 방법에 대해 공부합니다.

 제네릭 함수
 Type Parameters
 Type Constraints
 Specialization
 
 ```
 func name<T>(parameters) -> Type {
    code
 }
```
 
 */

/*
 
 // 파라미터가 특정형식에 제한되어있다.
func swapInteger(lhs: inout Int, rhs: inout Int) {
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var a = 10
var b = 20

swapInteger(lhs: &a, rhs: &b)
a
b

 */

//
//func swapValue<T>(lhs: inout T, rhs: inout T) {
//    let tmp = lhs
//    lhs = rhs
//    rhs = tmp
//}
//
//var a = 10
//var b = 20
//swapValue(lhs: &a, rhs: &b)
//a
//b
//
//var c = 1.2
//var d = 3.5
//swapValue(lhs: &c, rhs: &d)


/*:
 
 ## Type Constraints
 
 <TypeParameter: ClassName>
 <TypeParameter: ProtocolName>
 
 */



func swapValue<T: Equatable>(lhs: inout T, rhs: inout T) {
    print("generic swapValue")
    // Equatable없으면 error: Binary operator '==' cannot be applied to two 'T' operands
    if lhs == rhs {
        return
    }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

func swapValue(lhs: inout String, rhs: inout String) {
    print("String swapValue")
    
    if lhs.caseInsensitiveCompare(rhs) == .orderedSame {
        return
    }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}
//
//var a = 1
//var b = 2
//
//swapValue(lhs: &a, rhs: &b)

//
//var a = "a"
//var b = "b"
//
//swapValue(lhs: &a, rhs: &b)



//// 여기에서 제네릭 함수를 구현해 주세요.
//func equal<T: Equatable>(lhs: T, rhs: T) -> Bool {
//    if lhs == rhs {
//        return true
//    }
//
//    return false
//}
//
//// Color 값을 비교할 수 있도록 구현해 주세요.
//struct Color: Equatable {
//   let r: Double
//   let g: Double
//   let b: Double
//}
//
//let a = equal(lhs: 1, rhs: 1)
//let b = equal(lhs: 12.34, rhs: 12.34)
//let c = equal(lhs: "Hello", rhs: "Hello")
//let d = equal(lhs: Color(r: 0, g: 0, b: 0), rhs: Color(r: 0, g: 0, b: 0))
//
//print(a && b && c && d)


/*:
 
 ## Generic Types
 제네릭 타입을 선언하고 형식 내부에서 사용하는 다양한 형식을 타입 파라미터로 대체하는 방법을 공부합니다.

 제네릭 타입
 형식 표기 방식
 익스텐션으로 제네릭 타입 확장
 확장 대상 제한

 
```
 
 // Generic Type
 
 class Name<T> {
    code
 }
 
 struct Name<T> {
    code
 }
 
 enum Name<T> {
    code
 }
 
 ```
 
 */

struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

var c = Color(red: 128, green: 80, blue: 200)

// error: Type of expression is ambiguous without more context
//c = Color(red: 128.0, green: 80.0, blue: 200.0)

//var d: Color = Color(red: 128.0, green: 80.0, blue: 200.0)

//var d: Color<Int>

// 단축 문법
//let arr: [Int]

let arr: Array<Int>

let dict: Dictionary<String, Double>

// where T: FixedWidthInteger 구문을 추가하면 int형 클래스에만 제한된다.
extension Color where T: FixedWidthInteger {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents()

let dblColor = Color(red: 1.0, green: 2.0, blue: 3.0)

// error: Referencing instance method 'getComponents()' on 'Color' requires that 'Double' conform to 'FixedWidthInteger'
//dblColor.getComponents()


extension Color where T == Double {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

dblColor.getComponents()

/*:
 
 ## Associated Types
 프로토콜 내에서 실제 형식으로 대체되는 연관 형식을 선언하는 방법에 대해 공부합니다.

 제네릭 프로토콜
 Associated Types
 typealias 를 통한 실제 형식 선언
 연관 형식에 제약 추가
 
 ```
    associatedtype Name
 
    typealias AssociatedTypeName = Type
 ```
 
 */

// error: Protocols do not allow generic parameters; use associated types instead
//protocol QueueCompatible<T> {
//    func enqueue(value: T)
//    func dequeue() -> T?
//}

//프로토콜에서 실제 형식으로 대체되는 placeholder
protocol QueueCompatible {
//    associatedtype Element
    
    // Equatable 등 특정 프로토콜로 제한 가능
    associatedtype Element: Equatable
    func enqueue(value: Element)
    func dequeue() -> Element?
}

class IntegerQueue: QueueCompatible {
    typealias Element = Int // 생략가능함
    
    func enqueue(value: Int) {
        
    }
    
    func dequeue() -> Int? {
        return 0
    }
}

class DoubleQueue: QueueCompatible {
    func enqueue(value: Double) {
        
    }
    
    func dequeue() -> Double? {
        return 0
    }
}

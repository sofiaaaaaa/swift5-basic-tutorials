import UIKit

/*:
 
 # Generic
 
 ## Generic Function
 특정 형식과 연관되지 않은 함수를 구현하는 방법에 대해 공부합니다.

 제네릭 함수
 Type Parameters
 Type Constraints
 Specialization
 
 */

func swapValue<T>(lhs: inout T, rhs: inout T) {
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var a = 1
var b = 2
swapValue(lhs: &a, rhs: &b)

var c = 1.2
var d = 3.4
swapValue(lhs: &c, rhs: &d)

/*:
 
 ## Type Constraints
 ```
 <TypeParameter: ClassName>
 <TypeParameter: ProtocolName>
 ```
 */

func swapValue2<T: Equatable>(lhs: inout T, rhs: inout T) {
    
    if lhs == rhs { return }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

/*:
 
 ## Specialization
 
 */

func swapValue(lhs: inout String, rhs: inout String) {
    print("Speicalized Version")
    
    if lhs.caseInsensitiveCompare(rhs) == .orderedSame {
        return
    }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

a = 1
b = 2

swapValue(lhs: &a, rhs: &b)

var e = "a"
var f = "b"
// generic함수보다 string으로 지정한 함수가 우선순위가 높다.
swapValue(lhs: &e, rhs: &f)




/*:
 
 ## Generic Types
 제네릭 타입을 선언하고 형식 내부에서 사용하는 다양한 형식을 타입 파라미터로 대체하는 방법을 공부합니다.

 제네릭 타입
 형식 표기 방식
 익스텐션으로 제네릭 타입 확장
 확장 대상 제한
 
 ```
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

var g = Color(red: 129, green: 90, blue: 20)

// error: Generic.playground:114:5: error: cannot assign value of type 'Color<Double>' to type 'Double'
//c = Color(red: 128.0, green: 80.0, blue: 20.0)


let arr: Array<Int>


extension Color where T: FixedWidthInteger {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

extension Color where T == Int {
    func getComponents() -> [T] {
        return [red, green, blue]
    }
}

// 생성자에 전달된 파라미터의 형식에 따라 형식을 추론한다. 여기서는 Int로 추론한다.
let intColor = Color(red: 1, green: 2, blue: 3)
intColor.getComponents()

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
//
//protocol QueueCompatible {
//    associatedtype Element
//
//    func enqueue(value: Element)
//    func dequeue() -> Element?
//}
//
//// typealias는 생략가능하다.
//class IntegerQueue: QueueCompatible {
//    typealias Element = Int
//
//    func enqueue(value: Int) {
//
//    }
//
//    func dequeue() -> Int? {
//        return 0
//    }
//}
//
//class DoubleQueue: QueueCompatible {
//    func enqueue(value: Double) {
//
//    }
//
//    func dequeue() -> Double? {
//        return 0.0
//    }
//}



protocol QueueCompatible {
    // type 제한 
    associatedtype Element: Equatable
    
    func enqueue(value: Element)
    func dequeue() -> Element?
}

// typealias는 생략가능하다.
class IntegerQueue: QueueCompatible {
    typealias Element = Int
    
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
        return 0.0
    }
}

import UIKit

/*:
 
 # Structure and Classes
 
 ## Structures and Classes
 구조체와 클래스에 대한 기초적인 내용과 구현 문법에 대해 공부합니다.

 프로그래밍 패러다임
 객체와 추상화
 클래스 선언 문법
 구조체 선언 문법
 인스턴스 생성
 클래스와 구조체 비교

 * 객체지향 프로그래밍에서는 클래스를 주로 사용한다.
 * 함수형 프로그래밍 , 프로토콜 프로그래밍 등 멀티 패러다임을 지원하기 위해 struct는 클래스의 대부분의 기능을 지원한다. 값 형식이다.
 * swift에서는 클래스와 구조체에서 생성한 객체를 모두 instance라고 부른다.
 
 ## Struct Syntax
 
 ```
 struct StructName {
    property
    method
    initializer
    subscript
 }
 
 ```
 
 * structure 에서는 deinitializer, lnheritance, reference counting이 지원되지 않는다.
 
 */


struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
}

let p = Person(name: "Steve", age: 50)

let name = "Paul"
name

p.name
p.age
p.speak()

/*
 
## Class Syntax

```
class StructName {
   property
   method
   initializer (init, deinit 두종류임)
   subscript
 
}

```

*/

class Person2 {
    var name = "John Doe"
    var age = 0
    
    func speak() {
        print("Hello")
    }
}


/*:
 
 ## Initializer Syntax
 가장 기본적인 형태의 생성자를 구현하고 호출하는 방법에 대해 공부합니다.

 생성자 구현
 생성자 호출

 ```
 init(parameters) {
    statements
 }
 ```
 
 */

let str = "123"
let num = Int(str)

class Position {
    var x: Double
    var y: Double
    
    // property들을 초기화하는 용도로 사용
    init() {
        x = 0.0
        y = 0.0
    }
    
    init(value: Double) {
        x = value
        y = value
    }
}

let a = Position() // init()함수 호출
a.x

let b = Position(value: 100) // init(value:)함수 호출
b.x

/*:
 
 ## Value Types vs Reference Types
 값 형식과 참조 형식의 차이점에 대해 공부합니다.

 값 형식의 메모리 처리 방식
 참조 형식의 메모리 처리 방식
 일반적인 구현 지침
 
 * value type : structure, tuple, enum
 * reference type : class, closure
 
 * init()을 따로 구현하지 않으면 기본 생성자가 자동 생성된다.
 
 
 */

struct PositionValue {
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

var v = PositionValue()

var o = PositionObject()

var v2 = v
var o2 = o

v2.x = 12
v2.y = 34

// structure는 인스턴스를 복사하면 새로운 메모리에  생성된다.
v // x = 0 , y = 0
v2 // x = 12, y = 34


// class는 원본 메모리 주소값을 새로운 변수에 넘기기 때문에 새 변수의 속성값을 변경하면 원본도 바뀐다.

o2.x = 12
o2.y = 34

o.x // 12
o2.x // 12


/*:
 
 ## Identity Operator
 항등 연산자를 통해 참조를 비교하는 방법에 대해 공부합니다.

 동일성 비교
 Identical To Operator
 Not Identical To Operator
 Identical 과 Equal의 차이
 
*  항등연산자는 메모리 주소를 비교할 때 사용한다. reference type은 stack과 heap에 모두 저장되며, stack에는 heap에 저장된 실제 값의 메모리 주소를 저장한다.
 
 ```
 // identical to Operator
 classInstance === classInstance
 
 // not identical to Operator
 classInstance !== classInstance
 ```
 
 */

class A {
    
}

let aa = A()
let bb = a
let cc = A()

aa === bb

/*:
 
 ## Nested Types
 하나의 형식 내부에 다른 형식을 선언하고 새로운 인스턴스를 생성하는 방법에 대해 공부합니다.

 Nested Type 선언 문법
 Nested Type 표기법
 
 ```
 
 String.CompareOptions
 
 ```
 
 */

class One {
    
    // Nested Type
    struct Two {
        enum Three {
            case a
            
            class Four {
                
            }
        }
    }
    
    var a = Two()
}

let two: One.Two = One.Two()

// 예시
// NumberFormatter
// DateFormatter



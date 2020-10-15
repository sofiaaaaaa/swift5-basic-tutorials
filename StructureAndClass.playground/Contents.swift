import UIKit

/*:
 
  # Structure and Class
 
 * Custom data type : structure, enum, class
 * Swift 언어의 특징:
    * Object-Oriented Programming
 
   ## Structure : 함수형 프로그래밍, 프로토콜 프로그래밍에서는 함수를 구현할 때 대부분 structure구조체로 구현한다. class와 달리 객체가 아닌 값으로 분류된다.
 
 ```
 struct StructName {
    property
    method
    initializer
    subscript
 }
 ```
 
 */

struct Person {
    var name: String
    var age: Int
    
    func speak() {
        print("Hello")
    }
}

let p = Person(name: "Steve", age: 50)

p.name
p.age

//함수는 이름만으로 호출하지만 메서드는 인스턴스를 통해서 호출한다.
p.speak()


/*:
 
 ## Class
 
 * instance는 생성자를 통해 생성한다.
 * 구조체와 클래스의 차이점
 * Structure는 Stack 메모리영역에 값을 저장하고 값을 복사할 때마다 복사본을 생성하고, Value Type 이다. value type에는 Structure, Enumeration, 기본자료형이 있다.
 * Class는 Heap 메모리영역에 값을 저장하고 Stack에는 heap에 저장한 값의 주소를 저장한다. 값을 복사하면 주소를 전달한다. class와 closure가 Reference Type이다.
 
  * class는 소멸자(deinitializer), 상속(inheritance)이 가능하며, 메모리 관리 방식에서 Value Type은 애플리케이션이 실행되는 범위  scope에서 벗어나면 메모리에서 삭제되는데 class는 코드에서 전체적으로 참조되는 숫자인 Reference counting에 의해 삭제된다.
 
 ```
 class ClassName {
    property
    method
    initializer
    deinitializer
    subscript
 }
 ```
 
 */


class Person2 {
    var name = "Jone Re"
    var age = 0
    
    func speak() {
        print("Hello")
    }
    
}

let pp = Person2()


/*:
 
 ## Initializer Syntax

 * 새로운 인스턴스 생성하는 방법

```
 init(parameters) {
    statements
 }
 ```
 
 */

let str = "123"
let num = Int(str)

// 메소드와 생성자는 문법적으로 비슷함

class Position {
    let x: Double
    let y: Double
    
    // 위에 선언된 모든 속성을 초기화해줘야한다.
    init(){
        x = 0.0
        y = 0.0
    }
        
    // structure도 동일하게 사용한다.
    init(value: Double) {
        x = value
        y = value
    }
}

let a = Position()
a.x
a.y


let b = Position(value: 100)
b.x
b.y



// 여기에서 새로운 Color 구조체를 선언해 주세요.
struct Color {
    var r: Int = 0
    var g: Int = 0
    var b: Int = 0
    
    init(r: Int, g: Int, b: Int) {
        self.r = r
        self.g = g
        self.b = b
    }
}

func solution(_ r:Int, _ g:Int, _ b:Int) -> String {
    // 여기에서 새로운 인스턴스를 생성해 주세요.
    let color = Color(r: r, g: g, b: b)
   
    // 여기에서 문자열을 리턴해 주세요.
    return "R:\(color.r) G:\(color.g) B:\(color.b)"
}


// 여기에서 새로운 Color 클래스를 선언해 주세요.
class Color2 {
    var r = 0
    var g = 0
    var b = 0
    
    init(r:Int, g:Int, b:Int) {
        self.r = r
        self.g = g
        self.b = b
    }
    
}

func solution2(_ r:Int, _ g:Int, _ b:Int) -> String {
    // 여기에서 새로운 인스턴스를 생성해 주세요.
    let color = Color2(r:r, g:g, b:b)
   
    // 여기에서 문자열을 리턴해 주세요.
    return "R:\(color.r) G:\(color.g) B:\(color.b)"
}


/*:
    ## Value Types vs Reference Types

    * class : 객체지향 프로그래밍, 참조를 전달해야하는 경우, 상속을 구현해야할 때는 class사용.
    * struct : 함수형 프로그래밍, 프로토콜 지향 프로그래밍, 값형식은 모두 struct로 구현함 (한번만 사용하면 tuple로 구현, 상수값의 열거형인 경우는 enum으로 구현)

 
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
var o2 = o // o2, o 둘다 주소값만 저장하고 있다.

// v에는 값의 변화가 없다.
v2.x = 12
v2.y = 34

// o의 값도 변경되었다.
o2.x = 12
o2.y = 34





import UIKit

/*:
 
 # Inheritance and Polymorphism
 * 상속을 통해 코드 중복을 줄이는 방법과 OOP의 특징 중 하나인 다형성에 대해 공부합니다.
 * 다중상속은 안됨. 프로토콜을 구현해서 사용한다.
 
 ```
 class ClassName: SuperClassName {
 
 }
 
 ```
 
 */

class Figure {
    var name  = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
//    final func draw() {
//        print("draw \(name)")
//    }
    
     func draw() {
        print("draw \(name)")
    }

}

class Circle: Figure {
    var radius = 0.0
    
}

let c = Circle(name: "Circle")
c.radius
c.name
c.draw()

/*:

## final class

```
final class ClassName: SuperClassName {

}

```
 
 * final 클래스는 상속이 불가능한 클래스이다.

*/

final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}
//
//class Square: Rectangle {
//
//}


/*:
 
 ## Overriding
 
 * Super Class로부터 상속한 멤버를 재정의하는 방법에 대해 공부합니다.
 * override 키워드를 붙여 재정의한다. 상위 클래스의 메서드를 실행할 때는 super.메서드명() 으로 구문을 추가해야한다.
    
 */


class Circle2: Figure {
    var radius = 0.0
    
    var diameter: Double {
        return radius * 2
    }
    // final키워드로 선언된 메서드는 재정의할 수 없다.
//    override func draw() {
//        super.draw()
//        print("drawss \(name)")
//    }
}

let c2 = Circle2(name: "Circle")

c2.draw()

class Oval: Circle2 {
    // 멤버 변수를 재정의 할 때 getter, setter를 모두 구현해야함
    // willset, didSet은 지원하지 않는다.
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius = newValue / 2
        }
    }
    
    override var radius: Double {
        get {
            return super.radius
        }
        
        set {
            super.radius = newValue
        }
    }
}


class Figure2 {
   let width: Double
   let height: Double
    
   init(width: Double, height: Double) {
      self.width = width
      self.height = height
   }
   
   func area() -> Double {
      return width * height
   }
}

// 여기에서 Rectangle 클래스를 선언해 주세요.
class Rectangle2: Figure2 {
    var isSquare: Bool {
        return super.width == super.height
    }
}


// 여기에서 Circle 클래스를 선언해 주세요.
class Circle3: Figure2 {
    var radius: Double = 0.0;
    
    override func area() -> Double {
        return self.radius * self.radius * Double.pi
    }
}


// 여기에서 Triangle 클래스를 선언해 주세요.
class Triangle: Figure2 {
    override func area() -> Double {
        return super.area() / 2
    }
}



// 아래에 있는 코드는 수정하지 마세요.
var validCount = 0

let r = Rectangle2(width: 100, height: 200)
if r.area() == 20000 {
   validCount += 1
}

if !r.isSquare {
   validCount += 1
}

let c3 = Circle3(width: 100, height: 200)
c3.radius = 60
if Int(c3.area()) == 11309 {
   validCount += 1
}

print(validCount == 3)

/*:
 
 ## Upcasting and Downcasting
 
 * 인스턴스를 동일한 클래스 계층에 존재하는 다른 클래스 형식으로 처리하는 방법
 
 */

class Rectangle4: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    override func draw() {
        super.draw()
        print("\(width) * \(height)")
    }
   
}

class Square5: Rectangle4 {
    
}

let f = Figure(name: "Unknown")
f.name

let rr = Rectangle4(name: "Rect")
rr.width
rr.height
rr.name


// upcasting 2 level
let s: Figure = Square5(name: "Square")
//s.width
//s.height
s.name


// downcasting
let downcastedS = s as! Square5
downcastedS.width
downcastedS.height
downcastedS.name

// upcasting 1 level
let downcastedS2 = s as! Rectangle4
downcastedS2.width
downcastedS2.height
downcastedS2.name

class Rhombus: Square5 {
    var angle = 45.0
}


// downcasting error: Execution was interrupted, reason: signal SIGABRT.The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.
//let dr = s as! Rhombus

/*:

## Type Casting

* 인스턴스를 동일한 클래스 계층에 존재하는 다른 클래스 형식으로 처리하는 방법
* Type Check는 Runtime 때 실행된다. 코드를 실행해야 결과를 알 수 있다.
* Type Check Operator
* Type Casting Operator
* 다형성
 
```
 // Type Check Operator  'is' return type : Boolean
 expression is Type
 
```
 
*/

let num = 123
num is Int
num is Double
num is String


class Triangle2: Figure {

}

class Rectangle6: Figure {

}

class Square6: Rectangle6 {

}

class Circle6: Figure {
    var radius: Double = 0.0;
}

// Type Check는 Runtime 때 실행된다. 코드를 실행해야 결과를 알 수 있다.
let t = Triangle2(name: "Triangle")
let rrr = Rectangle6(name: "Rec")
let ss = Square6(name: "Square")
let cc = Circle6(name: "Circle")

rrr is Rectangle6
rrr is Figure
rrr is Square6

/*:
 
 ## Type Casting Operator
 
 ```
 // Compile Time Cast : bridging 서로 호환되는 형식을 캐스팅하는 것.
 expression as Type
 
 // Runtime Cast - Conditional Cast : casting에 옵셔널 개념이 포함되어있다.
 exprestion as? Type
 
 // Runtime Cast - Forced Cast
 expression as! Type
 ```
 
 */

// Compile Time Cast
let nsstr = "str" as NSString

// 컴파일 에러 발생
//"str" as Int


// Runtime Cast
t as? Triangle2
t as! Triangle2

var upcasted: Figure = ss
upcasted = ss as Figure

upcasted as? Square6
upcasted as! Square6

upcasted as? Rectangle6
upcasted as! Rectangle6

// nil
upcasted as? Circle6
// app crash!
//upcasted as! Circle6

if let ccc = upcasted as? Circle6 {
    
}

// let list: [Figure] 가장 상위 클래스인 Figure 클래스 배열로 선언됨. 최상위인 figure형식의 배열의 멤버 인스턴스의 메서드를 호출하더라도 오버라이딩한 메서드가 호출된다. Polymorphism.
let list = [t, rrr, ss, cc]
for item in list {
    item.draw()
    
    // 하위클래스의 멤버변수에 접근하려면 downcasting해야한다.
//    item.radius
    if let ccc = item as? Circle {
        ccc.radius
    }
}


/*:
 
 ## Any (값 형식) , AnyObject (참조형식)
 * 가능하면 사용하지 않는다
 * Type-Erasing Wrapper
 * Any 형식의 데이터를 사용하려면 type casting이 필요하다.
 
 */

// 형식에 관계없이 모든 데이터를 저장할 수 있다.
var data: Any = 1
data = 2.3
data = NSString() // 참조형식도 저장할 수 있다.

var obj: AnyObject = NSString()


// NSString과 string은 상호호환이 가능함. (= bridging)
if let str = data as? String {
    print(str.count)
}

/*:

## Type Casting Pattern

*/

switch data {
    case let str as String:
        print(str.count)
    case let list as [Int]:
        print(list.count)
    case is Double:
        print("Double Value")
    default:
        break
}



let list5: [Any] = [1, "2", 3.5, "Hello", -123]

var intList = [Int]()
var doubleList = [Double]()
var strList = [String]()

for item in list5 {
    switch item {
    case let i as Int:
        intList.append(i)
    case let d as Double:
           doubleList.append(d)
    case let s as String:
           strList.append(s)
    default:
        break
    }
}


print(intList.count, doubleList.count, strList.count)

/*:
 
 ## Overloading
 
 * 오버로딩을 통해 동일한 이름을 가진 멤버를 구현하는 방법
 * 함수 오버로딩
 * 메소드 오버로딩
 * 네 가지 오버로딩 규칙
    - 함수이름이 동일하면 파라미터 수로 식별
    - 함수 이름, 파라미터 수가 동일하면 파라미터 자료형으로 식별
    - 함수 이름, 파라미터가 동일하면 Argument Label로 식별
    - 함수 이름, 파라미터, Argument Lable이 동일하면 return type으로 식별 : 4번째 규칙, 이것보다는 함수이름을 바꿔서 사용하는게 낫다

 */

// 동일한 메서드는 선언할 수 없다.
//func process() {
//
//}
//
//func process() {
//
//}


func process(value: Int) {
    print("process Int")
}

func process(value: String) {
    print("process String")
}


func process(value: String, another: String) {
    print("process String")
}

func process(_ value: Double) -> Int {
    return Int(value)
}

func process(_ value: String) -> String? {
    return String(value)
}

process(value: 0)
process(value: "str")

let result = process(12.34) as Int

struct Rectangle10 {
    func area() -> Double {
        return Double(0)
    }
    
    static func area() -> Double {
        return 0.0
    }
}

let rrrr = Rectangle10()
rrrr.area()
Rectangle10.area()

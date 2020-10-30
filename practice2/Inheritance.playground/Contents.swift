import UIKit

/*:
 
 # Inheritance and Polymorphism
 상속을 통해 코드 중복을 줄이는 방법과 OOP의 특징 중 하나인 다형성에 대해 공부합니다.

## Inheritance
 클래스에서 상속을 통해 Super Class로부터 멤버를 상속하는 방법에 대해 공부합니다.

 클래스 계층
 Base Class, Super Class, Subclass
 클래스 상속 문법
 Final Class
 
 * 다중상속이 지원되지 않으므로 프로토콜을 이용해야한다.
 
*/

class Figure {
    var name = "Unknown"
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Circle: Figure {
    var radius  = 0.0
}

let c = Circle(name: "Circle")
c.radius
c.name
c.draw()


/*:
 
 ### final Class
 
 * 상속을 하고 싶지 않을 때 final 키워드
 ```
 final class ClassName: SuperClassName {
 
 }
 ```
 
 */

final class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
}

//class Square: Rectangle {
//
//}


/*:
 
 ## Overriding
 Super Class로부터 상속한 멤버를 재정의하는 방법에 대해 공부합니다.

 오버라이딩 구현 패턴
 메소드 오버라이딩
 속성 오버라이딩
 멤버 오버라이딩 금지 문법
 
 * overriding할 때는 super의 속성을 self로 접근하면 안된다. 재귀호출 에러.

 
 */

class Circle2: Figure {
    var radius  = 0.0
    
    // 읽기전용 속성
    var diameter: Double {
        return radius * 2
    }
    
    override func draw() {
        super.draw()
        print("bb")
    }
}

let d = Circle2(name: "Circle")
d.draw()

class Oval: Circle2 {
//    override var radius: Double = 12.34
    
    // 상위 클래스의 mutable stored property를 재정의할 때는 get, set을 모두 구현해야한다.
    override var radius: Double {
        get {
            return super.radius
        }
        
        set {
            super.radius = newValue
        }
//
//        willSet {
//            print(newValue)
//        }
//
//        didSet {
//            print(oldValue)
//        }
        
    }
    
    // 상위 클래스의 읽기전용 속성을 재정의할 때는 읽어올 순 있지만 그 속성을 변경할 수는 없다.
    override var diameter: Double {
        get {
            return super.diameter
        }
        set {
            super.radius * 2
        }
        
    }
    
}



/*:
 
 ## Upcasting and Downcasting
 인스턴스를 동일한 클래스 계층에 존재하는 다른 클래스 형식으로 처리하는 방법을 공부합니다.

 업캐스팅
 다운캐스팅
 
 */

class Figure2 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
}

class Rectangle2: Figure2 {
    var width = 0.0
    var height = 0.0
    
    override func draw() {
        super.draw()
        print("\(width) * \(height)")
    }
    
}

class Square: Rectangle2 {
    
}


let f = Figure(name: "Unknown")
f.name

let r = Rectangle2(name: "Rect")
r.width
r.name


// upcasting
let s: Figure2 = Square(name: "Square")
s.name
//s.width

// downcasting
let downcastedS = s as! Square
downcastedS.name


/*:
 
 ## Type Casting
 Type Casting을 통해 인스턴스의 형식을 확인하고 다른 형식으로 캐스팅하는 방법을 공부합니다.

 Type Check Operator
 Type Casting Operator
 다형성

 ```
 expression is Type
 ```
 
 */

let num = 123
num is Int
num is Double

//let t = Triangle(name: "Triangle")
//let r = Rectangle2(name: "Rect")


// compiletime cast
let nsstr = "str" as NSString

// runtime cast => cast에 옵셔널 개념이 포함됨
//t as? Triangle

/*:
 
## Any and AnyObject
 Swift가 제공하는 범용 자료형에 대해 공부합니다.

 Any와 AnyObject : 사용하지 않는 편 권장
 Type-Erasing Wrapper
 타입 캐스팅 패턴 활용
 
 */

// 모든 데이터를 저장할 수 있다.
var data:Any = 1
data = 2.3
data = NSString()

var obj: AnyObject = NSString()


if let str = data as? String {
    print(str.count)
} else if let list = data as? [Int] {
    
}

/*:
 
 ## Type casting Pettern
 
 */

switch data {
    case let str as String:
        print(str.count)
    case is Double:
        print("Double Value")
    default:
        break
}

/*:
 
 ## Overloading
 오버로딩을 통해 동일한 이름을 가진 멤버를 구현하는 방법에 대해 공부합니다.

 함수 오버로딩
 메소드 오버로딩
 네 가지 오버로딩 규칙

 
 */

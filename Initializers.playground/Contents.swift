import UIKit

/*:
 
 # Initializers
 생성자와 인스턴스 초기화에 대해 공부합니다.

 * 인스턴스 초기화
 * Default Initializer
 * Memberwise Initializer

 
 */

//class Position {
//    var x = 0.0
//    // 초기값을 가져야한다.
//    var y: Double
//
//    // optional은 초기값을 설정하지 않아도 되고, nil로 자동 초기화된다.
//    var z: Double?
//
//    init(){
//        y = 0.0
//    }
//}

class Position {
    var x = 0.0
    // 초기값을 가져야한다.
    var y: Double = 0
    
    // optional은 초기값을 설정하지 않아도 되고, nil로 자동 초기화된다.
    var z: Double?
    
    // default initializer를 자동으로 컴파일러가 생성해준다. 생략가능
//    init() {
//
//    }
    
    
    
}

let p = Position()

/*:
 
 ## Initializer Syntax

```
    init(parameters){
            initialization
    }
 
    TypeName(parameters)
```

 */


class SizeObj {
    var width = 0.0
    var height = 0.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    // Initializer Delegation
    convenience init(value: Double) {
//        width = value
//        height = value
        // convenience Initializer
        self.init(width: value, height: value)
    }
}

/*:
 
 ## Memberwise Initializer
 
 */

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

let s = SizeValue()
// 구조체에서 init()을 생략한 경우 멤버변수를 바탕으로 자동으로 제공됨
SizeValue(width: 1.2, height: 2.3)


/*:

## Class Initializers
 
 클래스에서 구현하는 특별한 생성자에 대해 공부합니다.

 * Designated Initializer // 지정생성자
 * Convenience Initializer // 간편생성자
 * Automatic Initializer Inheritance
 
 ```
 // Designated Initializer
 init(parameters){
    initialization
 }
 
 // Convenience Initializer
 convenience init(parameters){
     initialization
  }
 
 ```
 
*/


class Postion1 {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // 다양한 초기화를 구현하기 위한 유틸리티성 기능
    // 슈퍼클래스의 init()을 호출할 수 없다.
    convenience init(x: Double){
        // Designated Initializer를 호출하여 y 값만 다른 값으로 초기화함
        self.init(x: x, y: 0.0)
    }
}


/*:
 
 ## Initializer Inheritance
 
 */

class Figure {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
    
    convenience init() {
        self.init(name: "unknown")
    }
}

class Rectangle: Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    // sub class의 init()메서드를 구현하거나 초기값을 지정해야한다.
    
    // 슈퍼클래스의 속성은 초기화하지 않는다.
    init(name: String, width: Double, height: Double) {
//        self.name = name
        self.width = width
        self.height = height
        super.init(name: name)
    }
    
    // 슈퍼 클래스의 init() 메서드 상속 구현
    override init(name: String) {
        width = 0
        height = 0
        super.init(name: name)
    }
    
    //슈퍼클래스가 아닌, 동일한 클래스의 다른 init() 메서드를 구현가능하다. override가 적용되지 않는다.
    convenience init() {
        self.init(name: "unknown")
    }
    
}

/*:
 
 ## Required Initializer
 모든 서브클래스에서 구현해야 하는 필수 생성자에 대해 공부합니다.
 
 */

class Figure6 {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
    
    func draw() {
        print("draw \(name)")
    }
    
}

class Retangle6 : Figure {
    var width: Double = 0.0
    var height: Double = 0.0
    
    init() {
        width = 0.0
        height = 0.0
        super.init(name: "unknown")
    }
    
    // required 키워드를 다시 붙여서 Retangle6 를 상속받는 클래스가 init() 메서드를 구현하게끔 한다.
    required override init(name: String){
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
}




/*:
 
 ## Initializer Delegation
 생성자 델리게이션을 통해 인스턴스가 초기화 되는 과정을 공부합니다.
 

 value type 값 형식의 생성자 델리게이션
 참조 형식의 생성자 델리게이션
 생성자 델리게이션 규칙
 클래스 초기화 방식
 
 */

struct Size {
    var width: Double
    var height: Double
    
    init(w: Double, h: Double) {
        width = w
        height = h
    }
    
    // 다른 Initializer가 Initializer를 호출하는 것을 Initializer Delegation라고 함
    // 초기화 규칙이 변경되었을 경우 첫번째 Initializer 만 고치면 된다. 모든 property가 다 초기화되어야함
    init(value: Double) {
        self.init(w: value, h: value)
    }
    
}


class Figure5 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init(){
        self.init(name: "unknown")
    }
}

class Rectangle5: Figure {
    var width = 0.0
    var height = 0.0
    
    // Delegate Up 모든 속성을 초기화하고 슈퍼클래스 구현을 호출하고 있다.
    init(n: String, w: Double, h: Double) {
        width = w
        height = h
        super.init(name: n)
    }
    
    convenience init(value: Double) {
        self.init(n: "rect", w: value, h: value)
    }
}

class Square: Rectangle5 {
    // delegate up이 불가능하고 super.init() 호출이 불가하다.
    convenience init(value: Double) {
        self.init(n: "square", w: value, h: value)
    }
    
    convenience init() {
        self.init(value: 0.0)
    }
}

/*:
 
 ## 클래스 초기화 방식
 
 * 최하위 클래스의 마지막에 구현된 Convenience init() 이 있다면 이것부터 먼저 실행되면서 이전에 구현된 Designated init()이 실행되며 상위 클래스의 Designated init()을 호출하고 최상위 클래스의 Designated init()을 실행한다.
 * 최상위 클래스에 Convenience init()이 있다면 이를 실행하고 하위 클래스의 Convenience init() 들을 부가적으로 실행한다.
 * delegation code는 self. super.init() 등의 코드를 의미한다.
 
 */

class Figure11 {
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

class Rectangle11: Figure11 {
   var isSquare: Bool {
      return width == height
   }
}

class Circle11: Figure11 {
   var radius: Double = 0.0
   
   override func area() -> Double {
      return Double.pi * radius * radius
   }
    
    init(_ r: Double) {
       self.radius = r
       super.init(width: 0, height: 0)
    }
   
    // 여기에서 새로운 생성자를 구현해 주세요.
    convenience init?(radius r: Double){
        self.init(r)
        
     }
   
}

class Triangle11: Figure11 {
   override func area() -> Double {
      return super.area() / 2
   }
}

// 여기에서 Square 클래스를 선언해 주세요.
class Square11: Rectangle11  {
    
    init(side s: Int){
        super.init(width: Double(s), height: Double(s))
    }
    
    convenience init(from s: Int) {
        let v = Double(s).squareRoot()
        self.init(side: Int(v))
    }

}

// 아래에 있는 코드는 수정하지 마세요.
var validCount = 0

if let _ = Circle11(radius: 30) {
   validCount += 1
}

var s1 = Square11(from: 100)
if s1.width == 10 && s1.height == 10 {
   validCount += 1
}

s1 = Square11(side: 7)
if s1.area() == 49 {
   validCount += 1
}

if s1.isSquare {
   validCount += 1
}

print(validCount == 4)



/*:
 
 ## Failable initializer
 
 초기화 실패를 옵셔널로 처리하는 방법을 공부합니다.

 초기화 성공과 실패
 오버로딩 규칙
 생성자 델리게이션 규칙
 재정의 규칙
 
 
 ```
 
 init?(parameters){
    initialization
 }
 
 init!(parameters){
    initialization
 }
 
 ```
 
 */


struct Position5 {
    let x: Double
    let y: Double
    
    init?(x: Double, y: Double) {
        guard x >= 0.0, y >= 0.0 else { return nil }
        self.x = x
        self.y = y
    }
    
    init!(value: Double) {
        guard value >= 0.0 else {return nil}
//        self.x = value
//        self.y = value
        
        self.init(x: value, y: value)
    }
    
    // overloding 가능
//    init(value: Int) {
////        self.x = value
////        self.y = value
//    }
}

var a = Position5(x: 12, y: 2)

// 초기화 중단 후 nil return
a = Position5(x: -5, y: 0)

var b: Position5 = Position5(value: 12)

// nil
// 변수의 형식을 Position5 로 지정하면 에러가 남. (형식을 지정하지 않으면 에러가 나지 않고 nil이 리턴됨)  error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.
//b = Position5(value: -4)



/*:
 
 ## Deinitializer
 인스턴스가 해제되기 전에 호출되는 소멸자에 대해 공부합니다.

 메모리 정리 방식
 일반적인 구현 패턴
 
 ```
    deinit {
        Deinitialization
    }
 
 ```
 
  * 하나만 구현 가능하고 class만 사용가능하다. 직접 구현하는게 아니라 자동으로 제공됨.
  * swift 언어는 ARC라는 메모리 관리를 사용한다.
*/


class Size20 {
    var width = 0.0
    var height = 0.0
}

class Position20 {
    var x = 0.0
    var y = 0.0
    
}

class Rect {
    var origin = Position20()
    var size = Size20()
    
    // debug 용도로 사용.
    deinit {
        print("deinit \(self)")
    }

}

var rrr: Rect? = Rect()
rrr = nil // nil을 저장해서 Rect 인스턴스를 삭제하면 deinit()이 실행됨 =>  deinit __lldb_expr_186.Rect



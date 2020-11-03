import UIKit

/*:
 
 # Initializers
 생성자와 인스턴스 초기화에 대해 공부합니다.

 인스턴스 초기화
 Default Initializer
 Memberwise Initializer
 
 
 */

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

let s = SizeValue()

// init()메서드를 구현하지 않으면 생성되는 Memberwise Initializer
SizeValue(width: 1.2, height: 1.2)

/*:
 
 ## Class Initializers
 클래스에서 구현하는 특별한 생성자에 대해 공부합니다.

 Designated Initializer
 Convenience Initializer
 Automatic Initializer Inheritance
 
 
 * Designated Initializer : 수퍼클래스의 init()를 호출해야한다.
 * Convenience Initializer : 같은 클래스의 Designated Initializer만 호출할 수 있다.
 
 */

class Position {
    var x: Double
    var y: Double
    
    // Designated Initializer. 모든 속성을 초기화해야한다. 속성에 기본값을 저장하지 않으면 init()을 구현해야한다.
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Convenience Initializer
    convenience init(x: Double) {
        self.init(x: x, y: 0.0)
    }
}

/*:
 
 ## Required Initializer
 모든 서브클래스에서 구현해야 하는 필수 생성자에 대해 공부합니다.
 

 */

class Figure {
    var name: String
    
  required  init(name: String) {
        self.name = name
    }
}

class Rectangle: Figure {
    var width = 0.0
    var height = 0.0
    
    init() {
        width = 0.0
        height = 0.0
        super.init(name: "Unknown")
    }
    
    required init(name: String) {
        width = 0.0
        height = 0.0
        super.init(name: name)
    }
    
}

/*:
 
 ## Initializer Delegation
 생성자 델리게이션을 통해 인스턴스가 초기화 되는 과정을 공부합니다.

 * 초기화를 위임(=델리게이션).
 * 모든 Initializer를 수정할 필요가 없고 유지보수가 쉬워진다.
 
 값 형식의 생성자 델리게이션
 참조 형식의 생성자 델리게이션
 생성자 델리게이션 규칙
 클래스 초기화 방식

 */


/*:
 
## Failable initializer
 초기화 실패를 옵셔널로 처리하는 방법을 공부합니다.

 초기화 성공과 실패
 오버로딩 규칙
 생성자 델리게이션 규칙
 재정의 규칙
 
 * 초기화에 실패하면 nil을 리턴한다.
 
 
 */

struct Position3 {
    let x: Double
    let y: Double
    
    init?(x: Double, y: Double){
        guard x >= 0.0, y >= 0.0 else {
            return nil
        }
        
        self.x = x
        self.y = y
        
    }
    
    init!(value: Double) {
        guard value >= 0.0 else { return nil }
        self.x = value
        self.y = value
    }
}



var a = Position3(x: 12, y: 34)
a = Position3(x: -12, y: 0)

//var b = Position3(value: 12)
//b
//
//// iuo 가 변경됨. nil 리턴
//b = Position3(value: -1)

var b: Position3 = Position3(value: 12)
b

// b를 Position3으로 선언하면, iuo가 생성된 인스턴스를 강제로 추출하기 때문에 error 발생함
//b = Position3(value: -1)

/*:
 
 ## Deinitializer
 인스턴스가 해제되기 전에 호출되는 소멸자에 대해 공부합니다.

 메모리 정리 방식
 일반적인 구현 패턴

 * 클래스에서만 사용하며, 1개만 구현할 수 있다.
 * 인스턴스가 메모리에서 제거되기 직전에 자동으로 호출된다.
 
 */

class Size {
    var width = 0.0
    var height = 0.0
}

class Position4 {
    var x = 0.0
    var y = 0.0
}

class Rect {
    var origin = Position4()
    var size = Size()
    
    deinit {
        print("deinit \(self)")
    }
}

var r: Rect? = Rect()
r = nil  // r변수가 nil을 저장하면 메모리에서 제거된다.


import UIKit

/*:
 
 ## Protocol Syntax
 프로토콜 선언 문법과 프로토콜 채용 문법에 대해 공부합니다.

 프로토콜 선언 문법
 프로토콜 채용 문법
 요구사항 구현
 AnyObject 프로토콜
 클래스 프로토콜

* 프로토콜은 다중상속이 가능하다.
 
 */

// 프로토콜 선언
protocol Something {
    func doSomething()
}


// Adopting protocol
struct Size: Something {
    func doSomething() {
        print("a")
    }
}

// AnyObject를 채용하면 class전용 프로토콜이 된다.
protocol SomethingObject: AnyObject, Something {
    
}

/*:
 
 ## Property Requirements
 프로토콜에서 속성을 선언하고 형식에서 요구사항을 구현합니다.

 var 키워드 용법
 가변성 선언
 static 키워드와 class 키워드
 
 ```
 protocol ProtocolName {
    var name: Type { get set }
    static var name: Type { get set }
 }
 
 ```

 */

protocol Figure {
    var name: String { get }
}

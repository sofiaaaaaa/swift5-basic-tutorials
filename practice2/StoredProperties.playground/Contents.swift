import UIKit

/*:
 
 # Properties
 
 ## Stored Property
 저장 속성과 지연 저장 속성에 대해 공부합니다.

 변수 저장 속성
 상수 저장 속성
 지연 저장 속성
 구조체의 가변성과 속성의 관계
 지연 저장 속성
 속성 초기화 패턴
 
 * 속성에 저장되는 값은 인스턴스 마다 달라진다.
 
 ```
var name: Type = DefaultValue
 
let name: Type = DefaultValue
 ```
 
 * Explicit Member Expression - 명시적 표현법. 점찍어 구분해서 접근.
 */


class Person {
    let name: String = "Jone Re"
    var age: Int = 33
}

let p = Person()
p.name
p.age  = 40 // 인스턴스가 상수여도 변경 가능하다




struct Person1 {
    let name: String = "Jone Re"
    var age: Int = 33
}

// 구조체는 var로 인스턴스를 생성해야 속성을 수정할 수 있다.
let p1 = Person1()
p1.name
//p1.age  = 40 // error


/*:
 
 ## Lazy Stored Properties
 
```
 lazy var name: Type = DefaultValue
 ```
 * 선언시점에 값을 저장해야한다.
 * lazy로 선언된 프로퍼티는 프로퍼티에 직접 접근할 때 메모리가 생성된다.
 */

struct Image {
    init() {
        print("new Image")
    }
}

struct BlogPost {
    let title: String = "Title"
    let content: String = "Content"
    let attachment: Image = Image()
}

let post = BlogPost() //Image의 init()이 실행됨


struct BlogPost1 {
    let title: String = "Title"
    let content: String = "Content"
    lazy var attachment: Image = Image()
    
    let date: Date = Date()
    // 속성에 처음 접근하는 시점에 클로저가 실행된다. 저장속성을 클로저로 실행할 때 다른 속성에 접근해야한다면 lazy keyword를 붙여야한다.
    lazy var formattedDate: String = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date)
    }()
}

let post1 = BlogPost1()
//post1.attachment // 인스턴스가 let으로 선언된 상수라서 값을 바꿀 수 없으므로 init()실행시 에러가 발생함.

var post2 = BlogPost1()
post2.attachment


/*:
 
 ## Computed Property
 다른 속성을 기반으로 동작하는 계산 속성에 대해 공부합니다.

 get 블록과 set 블록
 읽기 전용 계산 속성
 
 * 메모리 값이 없다.
 * 형식추론을 사용할 수 없다. 클로저 구조체 클래스에 모두 멤버속성으로 사용가능하다.

 ```
 var name: Type {
    get {
        statements
        return expr
    }
    set(name) {
        statements
    }
 }
 
 ```
 
 */

class Person3 {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    var age: Int {
        get {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            return year - yearOfBirth
        }
        set {
            let calendar = Calendar.current
            let now = Date()
            let year = calendar.component(.year, from: now)
            yearOfBirth = year - newValue
        }
    }
    
    // 클로저가 아니라 Read-only Computed Property
    var age2: Int {
        let calendar = Calendar.current
        let now = Date()
        let year = calendar.component(.year, from: now)
        return year - yearOfBirth
    }
}

let p3 = Person3(name: "Peter Re", year: 2020)
p3.age

p3.age = 50
p3.yearOfBirth

/*:
 
 ### Read-only Computed Properties
 
 ```
 // case 1
 var name: Type {
    get {
        statements
        return expr
    }
 }
 
 // case 2. 생략
 var name: Type {
     statements
     return expr
 }
 
 ```
 
 */

/*:
 
 ## Property Observer
 속성 감시자를 통해 속성 값이 변경될 때 실행할 코드를 구현하는 방법에 대해 공부합니다.

 willSet 블록과 didSet 블록
 문법적 제약
 
 ```
 var name: Type = DefaultValue {
    willSet(name) {
        statements
    }
    didSet(name) {
        statements
    }
 }
 ```
 */

class Size {
    var width = 0.0 {
        willSet {
            print(width, "=>", newValue)
        }
        
        didSet {
            print(oldValue, "=>", width)
        }
    }
}

let s = Size()
s.width = 123


/*:
 
 ## Type Property
 형식과 연관된 메소드를 선언하고 접근하는 방법에 대해 공부합니다.

 저장 형식 속성
 계산 형식 속성
 속성 초기화 시점
 
 * 저장속성은 인스턴스마다 다른 값이 저장된다.
 * 형식속성은 형식자체에 속한 프로퍼티다. 모든 인스턴스가 하나의 공간을 공유한다.

 
 ### Stored Type Properties
 
 ```
 static var name: Type = DefaultValue
 static let name: Type = DefaultValue
 
 TypeName.propertyName
 ```
 
 */


class Math {
    static let pi = 3.14
}

let m = Math()
// m.pi //error

Math.pi


/*
### Computed Type Properties

```
static var name: Type {
    get {
        statements
        return expr
    }
    set(name) {
        statements
    }
 }
 
 class var name: Type {
     get {
         statements
         return expr
     }
     set(name) {
         statements
     }
  }
 
```

*/

enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    static var today: Weekday {
        let cal = Calendar.current
        let today = Date()
        let weekday = cal.component(.weekday, from: today)
        return Weekday(rawValue: weekday)!
    }
}

Weekday.today

/*:
 
 ## self & super
 자동으로 제공되는 특별한 속성인 self와 super에 대해 공부합니다.

 self expression
 super expression

 self (인스턴스 자체)
 self.propertyName
 self.method()
 self[index]
 self.init(parameters)
 
 super.propertyName
 super.method()
 super[index]
 super.init(parameters)
 
 */


class Size2 {
    var width = 0.0
    var height = 0.0
    
    func calcArea() -> Double {
        return self.width * self.height
    }
    
    var area: Double {
        return self.calcArea()
    }
    
    func update(width: Double, height: Double) {
        // 속성과 파라미터명이 같으면 self키워드를 붙여줘야함
        self.width = width
        self.height = height
    }
    
    func doSomething() {
        // 클로저에서는 self를 명시적으로 붙여줘야한다. 캡쳐 필요
        let c = { self.width * self.height }
    }
    
    static let unit = ""
    static func doSomething() {
        // type method. 형식 메서드
//        self.width // 속성에 접근할 수 없다.
        self.unit // 같은 type property에만 접근 가능하다.
    }
    
}


struct Size3 {
    var width = 0.0
    var height = 0.0
    
    mutating func reset(value: Double) {
//        width = value
//        height = value
        // 클래스에선 사용 불가.
        self = Size3(width: value, height: value)
    }
    
    
}


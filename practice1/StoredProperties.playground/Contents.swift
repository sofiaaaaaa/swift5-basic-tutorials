import UIKit

/*:
 
 # Stored Properties
 
 * 저장 속성은 클래스와 구조체에서 선언할 수 있다.
 
 ```
 // Variable Stored Property
 var name: Type = DefaultValue
 
 // Constant Stored Property
 let name: Type = DefaultValue
 
 ```
 
 */

class Person {
    let name: String = "Jone Re"
    var age: Int = 33
}

/*:
 
 ## Explicit Member Expression
 
 ```
    instanceName.perpertyName
    instanceName.perpertyName = NewValue
 
 ```
 
 */

let p = Person()
p.name
p.age

p.age = 30

// 클래스 속성이 mutable이여야 인스턴스의 속성값을 변경할 수 있다.  인스턴스가 let으로 선언되어도 상관없음
//p.name = "New Name"

struct Person2 {
    let name: String = "Jone Re"
    var age: Int = 33
}

//구조체의 속성이 var로 되어있어도 인스턴스가  mutable이 아니면 속성값을 바꿀 수 없다.
var p3 = Person2()
p3.name
p3.age

p3.age = 30

/*
 
 ## Lazy Stored Properties

 * 지연 저장속성 : 인스턴스가 초기화 되는 시점이 아니라 속성에 접근하는 시점에 속성들이 초기화된다. lazy var로만 선언해야한다. 선언시점에 기본값을 저장해야한다.
 
 ```
    lazy var name: Type = DefaultValue
 
 ```
 
 */


struct Image {
    init() {
        print("new Image")
    }
}

struct BlogPost {
    let title : String = "Title"
    let content: String = "Content"
    lazy var attachment: Image =  Image()
    
    let date: Date = Date()
    
    // closure
    lazy var formattedDate: String = {
        // 속성이 초기화할 때 다른 클래스에 접근해야한다면 lazy를 사용해야한다. 안그럼 에러남
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .medium
        return f.string(from: date)
    }()
}

// BlogPost은 다른 속성은 초기화되지만 attachmentdms
let post = BlogPost()

// error : Cannot use mutating getter on immutable value: 'post' is a 'let' constant
//post.attachment

// 인스턴트 변수도 var로 선언해야함
var post2 = BlogPost()
post2.attachment


class Color {
   let red: Int
   let green: Int
   let blue: Int
   
var alpha: Double = 1.0


   init(red: Int, green: Int, blue: Int) {
      self.red = red
      self.green = green
      self.blue = blue
   }
}

let c = Color(red: 255, green: 0, blue: 0)
if c.alpha == 1.0 {
   c.alpha = 0.5
}

print("OK")

/*:
 
 ## Computed Properties
 
 * 계산 속성은 메모리 공간을 가지지 않는다. 속성에 접근할 때마다 다른 값이 출력되므로 var로 선언해야한다. enum, class 등에 사용 가능함. 형식추론이 안되서 자료형을 반드시 선언해야한다.
 
```
 var name: Type {
 // get block or getter라고 부름
    get {
        statements
        return expr
    }
 // 파라미터를 생략하게 되면 블록에서 newValue라는 키워드로 값을 사용할 수 있다.
    set(name) {
        statements
    }
 
 ```
 
 */

class Person4 {
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
}

let p5 = Person4(name: "John Doe", year: 2002)
p5.age

p5.age = 50
p5.yearOfBirth


/*:
 
 ## Read-only Computed Properties
 
 ```
 var name: Type {
    get {
        statements
        return expr
    }
 }
 
 // get 키워드를 생략 가능함.
 var name: Type {
    statements
    return expr
 }
 ```
 
 */


class Person5 {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    // get 메서드만 있는 경우 생략함. 읽기 전용 계산속성. 쓰기 전용 속성은 없음.
    var age: Int {
        let calendar = Calendar.current
        let now = Date()
        let year = calendar.component(.year, from: now)
        return year - yearOfBirth
    }
}


class Color3 {
   let red: Int
   let green: Int
   let blue: Int
   
   init(red: Int, green: Int, blue: Int) {
      self.red = red
      self.green = green
      self.blue = blue
   }
    
   
   // 여기에 계산 속성을 추가해 주세요.
    var complementary: Color3 {
        return Color3(red: 255 - self.red, green: 255 - self.green, blue: 255 - self.blue)
        
    }
}

let color = Color3(red: 95, green: 199, blue: 205)
let complementaryColor = color.complementary

print(complementaryColor.red, complementaryColor.green, complementaryColor.blue)



/*:
 
 * Property Observer
 
```
 var name: Type = DefaultValue {
    willSet(name) {
        // 파라미터 생략시 newValue 키워드 사용가능
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
            print(width, "= ", newValue)
        }
        didSet {
            print(oldValue, "=", width)
        }
    }
}

let s = Size()
s.width = 123

/*:
 
 ## Type Property
 
 * Instance property
 * class, structure, enumeration모두에 추가할 수 있다.
 
 ```
 
 static var name : Type = DefaultValue
 static let name: Type = DefaultValue
 
 TypeName.propertyName
 
 ```
 
 */


class Math {
    
    static let pi = 3.14
    
}

let m = Math()
//Type property 형식속성은 형식을 통해 접근해야한다.
//m.pi

// pi 속성에 접근하는 시점에 Type property가 초기화 된다.
Math.pi


/*:
 
 ## Computed Type Properties
    
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


enum Weekday : Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, firday, saturday
    
    static var today: Weekday {
        let cal = Calendar.current
        let today = Date()
        let weekday = cal.component(.weekday, from: today)
        return Weekday(rawValue: weekday)!
    }
}

Weekday.today


class Color5 {
   let red: Int
   let green: Int
   let blue: Int
   
   init(red: Int, green: Int, blue: Int) {
      self.red = red
      self.green = green
      self.blue = blue
   }
   
   // 여기에서 형식 속성을 추가해 주세요.
    static var white: Color5 {
        return Color5(red: 255, green: 255, blue: 255)
    }
    
    static var black: Color5 {
        return Color5(red: 0, green: 0, blue: 0)
    }
    
}


let white = Color5.white
let black = Color5.black

print(white.red == 255 && white.green == 255 && white.blue == 255 && black.red == 0 && black.green == 0 && black.blue == 0)


/*:
 
 ## self
 
 ```
 self // 인스턴스 자체
 self.propertyName
 self.method()
 self[index] // subscript 호출
 self.init(parameters) // 다른 생성자 생성시
 ```
 * 형식에 기본적으로 추가되는 속성. 인스턴스에 자동으로 추가된다.
 
 */
//
//class Size3 {
//    var width = 0.0
//    var height = 0.0
//
//    func calcArea() -> Double {
////        return self.width * self.height
//        return width * height
//    }
//
//    var area: Double {
//      //  return self.calcArea()
//        return calcArea()
//    }
//
//    func update(width: Double, height: Double) {
//        // 속성과 파라미터를 구분하기 위해 self키워드를 사용한다.
//        self.width = width
//        self.height = height
//    }
//
//    func doSomething(){
//        // 클로저에서 속성에 접근하려면, self를 캡처해야한다.
//        let c = { self.width * self.height }
//    }
//
//    static let unit = ""
//
//    static func doSomthing() {
//        // static으로 선언한 type 속성만 참조 가능
//        self.unit
//    }
//}



struct Size3 {
    var width = 0.0
    var height = 0.0
    
    // class에서는 사용할 수 없다.
    mutating func reset(value: Double) {
        self = Size3(width: value, height: value)
    }
}


/*:
 
 ## super
 
 ```
 super.propertyName
 super.method()
 super[index] // subscript 호출
 super.init(parameters)
 ```
 
 */

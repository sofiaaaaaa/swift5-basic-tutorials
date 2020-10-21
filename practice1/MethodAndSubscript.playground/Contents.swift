import UIKit

/*:
 
 # Instance Method
 
 ```
 func name(parameters) -> ReturnType {
    code
 }
 
 // 실행시
 instance.method(parameters)
 
 ```
 * class, structure, enum에서 구현 가능하다.
 
 */

//class Sample {
//    var data = 0
//    static var sharedData = 123
//
//    func doSomething(){
//        print(data)
//        // type memeber에 접근하기
//        Sample.sharedData
//    }
//
//    func call() {
//        doSomething()
//    }
//}
//
//let a = Sample()
//a.data
//a.doSomething()
//a.call()


struct Size {
    var width = 0.0
    var height = 0.0
    
    mutating func enlarge() {
        width += 1.0
        height += 1.0
    }
}

////  상수에 저장하면 enlarge를 실행할 수 없다.
//let s = Size()
//s.enlarge()

var s = Size()
s.enlarge()


struct Area {
   let x: Int
   let y: Int
   var width: Int
   var height: Int
   
   // 여기에서 인스턴스 메소드를 추가해 주세요.
    mutating func extend(by num :Int ) -> Area{
        return Area(x: self.x , y: self.y, width: self.width * num, height: self.height * num)
    }
    
    mutating func reset() {
       self.width = 0
       self.height = 0
    }
}

// 아래 코드는 let 또는 var 키워드만 수정할 수 있습니다.
var a = Area(x: 0, y: 0, width: 100, height: 100)
let b = a.extend(by: 3)
a.reset()

// 아래 코드는 수정하지 마세요.
let isExtended = b.width == 300 && b.height == 300
let isZeroArea = a.x == 0 && a.y == 0 && a.width == 0 && a.height == 0

print(isExtended && isZeroArea)


/*:
 
 ## Type Methods
 
 * 메서드도 Type과 Instance로 나뉜다.
 * static 키워드를 붙여 사용하며, class, enum, structure에서 사용한다.
 
 ```
 
 static func name(parameters) -> ReturnType {
    statements
 }
 
 // sub class에서 overriding을 허용할 때 사용됨
 class func name(parameters) -> ReturnType {
    statements
 }
 
 Type.method(parameters)
 
 ```
 
 */

 
class Circle {
    static let pi = 3.14
    var radius = 0.0
    
    func getArea() -> Double {
        return radius * radius * Circle.pi
    }
    
    // type method는 type member에 바로 접근 가능함.
//    static func printPi() {
//        print(pi)
//    }
    
    // sub class에서 overriding할 때 class 키워드를 사용해야한다.
    class func printPi() {
        print(pi)
    }
    
    
}

Circle.printPi()

class StrokeCircle: Circle {
    // error : Cannot override static method
    override static func printPi() {
        print(pi)
    }
    
}

let i = "0"

Int(i)


struct StringConverter {
    static func string(from num: Int) -> String {
        return String(num)
    }
    
    static func integer(from str: String) -> Int? {
        
        return Int(str)
    }
}

// 아래에 있는 코드는 수정하지 마세요.
let aa = 123
let ba = "456"

let str = StringConverter.string(from: aa)
if let num = StringConverter.integer(from: ba) {
   print(str == "123" && num == 456)
} else {
   print(false)
}


/*:
 
 ## Subscript
 
 ```
    instance[index]
    instance[key]
    instance[range]
 
    // 파라미터와 리턴타입을 생략할 수 없다.
    subscirpt(parameters) -> ReturnType {
        get {
            return expression
        }
        set(name) {
            // newValue로 파라미터 대신 사용 가능
            statements
        }
    }
 ```
 
 
 
 
 */


let list = ["A", "B", "C"]

list[0]

class List {
    
    var data = [1, 2, 3]
    
    subscript(i index: Int) -> Int {
        get {
            return data[index]
        }
        
        set {
            data[index] = newValue
        }
    }
}

var l = List()
l[i: 0]
l[i: 1] = 123
l

//l[0, 1]

//l["A"]

struct Matrix {
    var data = [[1,2,3],
                [4,5,6],
                [7,8,9]]

    // read-only
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    }
}

let m = Matrix()

// index 범위를 확인해야함.
m[0, 0]

let aaa = [1,2,3]

print(aaa.filter { (num) -> Bool in
    return num == 1
}
)


struct Player {
   let number: Int
   let name: String
}

struct Team {
   let name: String
   let squad: [Player]
   
   // 여기에서 서브스크립트를 구현해 주세요.
    subscript(name: String) -> Player? {
        
        for player in squad {
            if player.name == name {
                return player
            }
        }
        
        return nil
    }
    
    subscript(number: Int) -> Player? {
        
        for player in squad {
            if player.number == number {
                return player
            }
        }
        
        return nil
    }
}

let firstTeam = [
   Player(number: 1, name: "Hugo Lloris"),
   Player(number: 3, name: "Danny Rose"),
   Player(number: 4, name: "Toby Alderweireld"),
   Player(number: 5, name: "Jan Vertonghen"),
   Player(number: 7, name: "Heung-Min Son"),
   Player(number: 10, name: "Harry Kane"),
   Player(number: 12, name: "Victor Wanyama"),
   Player(number: 20, name: "Dele Alli"),
   Player(number: 23, name: "Christian Eriksen"),
   Player(number: 33, name: "Ben Davies")
]
let tot = Team(name: "Tottenham Hotspur", squad: firstTeam)

var name: String?
var number: Int?

if let player = tot[7] {
   name = player.name
}

if let player = tot["David de Gea"] {
   number = player.number
}

print(name == .some("Heung-Min Son") && number == nil)

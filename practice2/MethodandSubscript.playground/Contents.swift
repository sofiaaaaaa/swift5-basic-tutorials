import UIKit

/*:
 
 # Method and Subscript
 
 ## Instance Method
 인스턴스와 연관된 메소드를 구현하고 호출하는 방법에 대해 공부합니다.

 인스턴스 메소드 선언 문법
 인스턴스 메소드 호출 문법
 값 형식의 인스턴스 메소드 구현 방식
 
 * 메소드는 클래스, 구조체, enumuration 형에서 사용한다.
 
 ### Syntax
```
 func name(parameters) -> ReturnType {
    Type
 }
    
 instance.method(parameters)
```
 
 */

class Sample {
    var data = 0
    static var sharedData = 123
    
    // 인스턴스에서 타입멤버에 접근시에는 형식이름.타입멤버 로 접근해야한다.
    func doSomthing() {
        print(data)
        Sample.sharedData
    }
    
    func call() {
        doSomthing()
    }
}


let a = Sample()
a.data
a.doSomthing()
a.call()

class Size {
    var width = 0.0
    var height = 0.0
    
    func enlarge() {
        width += 1.0
        height += 1.0
    }
}

let s = Size()
s.enlarge()
s.width


struct Size2 {
    var width = 0.0
    var height = 0.0
    
    // structure에서는 메서드를 선언할 때는 mutating을 사용해야한다.
    mutating func enlarge() {
        width += 1.0
        height += 1.0
    }
}

/*:
 
 ## Type Method
 형식과 연관된 메소드를 구현하고 호출하는 방법에 대해 공부합니다.

 타입 메소드 선언 문법
 타입 메소드 호출 문법
 메소드 오버라이딩
 
 ### Syntax
 
 ```
 static func name(parameters) -> ReturnType {
    statements
 }
 
 // subclass에서 overriding을 허용할 때 사용한다. 상속과 관련이 있고, 클래스에서만 사용한다.
 class func name(parameters) -> ReturnType {
    statements
 }
 
 // Type메서드 호출 방법
 Type.method(parameters)
 
 ```
 
 */

class Circle {
    static let pi = 3.14
    var radius = 0.0
    
    func getArea() -> Double {
        return radius * radius * Circle.pi
    }
    
    // subclass에서 사용할 때는 static 대신 class 키워드를 사용해야한다.
    class func printPi() {
        print(pi)
        
    }
}


Circle.printPi()

class StrokeCircle: Circle {
    override static func printPi() {
        print(pi)
    }
}


/*:
 
 ## Subscript
 서브크스립트를 직접 구현하는 방법에 대해 공부합니다.

 서브스크립트 호출 문법
 서브스크립트 선언 문법
 
 ```
 subscript(parameters) -> Returntype {
    get {
        return expression
    }
 
    set(name) {
        statements
    }
 
 }
 ```
 
 */

let list = ["A", "B", "C"]
list[0]

class List {
    var data = [1, 2, 3]
     
    subscript(index: Int) -> Int {
        get {
            return data[index]
        }
        set {
            data[index] = newValue
        }
    }
}

var l = List()
l[0]
l[1]
//l["A"]

struct Matrix {
    var data = [[1,2,3],
                        [4,5,6],
                        [7,8,9]
                      ]
    
    subscript(row: Int, col: Int) -> Int {
        return data[row][col]
    }
}

let m = Matrix()
m[0,0]

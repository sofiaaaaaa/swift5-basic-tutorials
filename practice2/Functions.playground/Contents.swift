import UIKit

/*:
 
 # Function Advanced
 
 ## Variadic Parameters
 
 * 가변 파라미터는 콤마로 파라미터를 여러개 입력해서, 함수에 배열형태로 전달되고, 개별함수마다 하나씩만 허용한다.
 
 하나의 파라미터를 통해 두 개 이상의 값을 전달하는 가변 파라미터에 대해 공부합니다.
 
 ```
    (name: Type...)
 ```
 
 */

print("Hellllo")

print("Hello", "swift")

func printSum(of nums: Int...) {
    var sum = 0
    for num in nums {
        sum += num
    }
    print(sum)
}

printSum(of: 1,2,3)

/*:
 
 ## In-Out Parameters
 파라미터로 전달된 변수의 값을 함수 내부에서 직접 변경하는 방법에 대해 공부합니다.
 
 *  함수 호출시 파라미터에 동일한 변수는 반복해서 전달할 수 없다. 상수(immutable)는 전달 할 수 없다.
 
 ### Syntax
 // 함수 정의시 inout
 func functionName (name: inout Type)
 
 
 // 함수 호출시 &
 functionName(argLabel: &expr)
 
 */

var num1 = 12
var num2 = 34


//func swapNumber(_ a: Int, with b: Int) {
//    var tmp = a
//    a = b
//    b = tmp
//}


func swapNumber(_ a: inout Int, with b: inout Int) {
    var tmp = a
    a = b
    b = tmp
}

swapNumber(&num1, with: &num2)



/*:
 
 ## Function Notation
 함수를 읽는 법과 코드에서 표기하는 방법을 공부합니다.

 functionName(label:)
 functionName(label:label:)
 functionName => 파라미터가 없는 경우

 ## Function Types ***
 함수의 형식을 표현하는 방법과 First-class citizen으로 활용하는 방법에 대해 공부합니다.

 함수 형식
 () 와 Void

 * First-class citizen: 변수나 상수에 저장할 수 있고, 파라미터로 저장할 수 있으며 함수에서 리턴할 수 있다.

 ```
 (ParameterTypes) -> ReturnType
 
 ```
 
 */

func sayHello() {
    print("Hello Swift")
}

// 함수 자체가 상수에 저장된다.
let f1 = sayHello

f1()

func printHello(with name: String) {
    print("hello, \(name)")
}

let f2: (String) -> () = printHello(with:)
let f3 = printHello(with: )

// 상수에 저장된 함수를 호출할 때는 label을 쓰지 않는다.
f2("bbb")

func add(a: Int, b: Int) -> Int {
    return a + b
}

var f4: (Int, Int) -> Int  = add(a:b:)

f4(1, 2)

//func add(_ a: Int, with b: Int) -> Int {
//    return a + b
//}
//
//f4 = add(_:with:)

func swapNumbers(_ a: inout Int, _ b: inout Int) {
    
}

let f5 = swapNumbers(_: _:)

func sum(of numbers: Int...) {
    
}


let f6 = sum(of:)

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func substract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func divide(_ a: Int, _ b: Int) -> Int {
    return a / b
}

// 첫번째가 리턴 화살표, 나머지는 형식에 선언된 리턴 화살표.
//func selectFunction(from op: String) -> (Int, Int) -> Int {
//
//}

typealias ArithmeticFunction = (Int, Int) -> Int

func selectFunction(from op: String) -> ArithmeticFunction? {
    switch op {
    case "+":
        return add(_:_:)
    case "-":
        return substract(_:_:)
    case "*":
        return multiply(_:_:)
    case "/":
        return divide(_:_:)
    default:
        return nil
    }
}

let af = selectFunction(from: "+")
af?(1, 2)

selectFunction(from: "*" )?(12, 34)

/*:
 
 ## Nested Functions
 함수 내부에 새로운 함수를 구현하는 방법에 대해 공부합니다.
 
 */


//func outer() {
//    print("outer")
//}
//
//func inner() {
//    print("inner")
//}
//
//outer()
//inner()


// 함수를 리턴하는 함수..
func outer() -> () -> () {
    print("outer")
    
    func inner() {
        print("inner")
    }
    
    return inner
}


let f = outer()
f()

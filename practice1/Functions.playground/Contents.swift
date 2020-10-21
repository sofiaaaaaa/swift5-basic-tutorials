import UIKit

/*:
 # Functions
 
 func name(parameters) -> ReturnType {
    statements
 }
 
 * function head
 * function body
 * return arrow
 */

func add() -> Int {
    return 1+2
}

if add() == 3 {
    print("three")
}

func doSomthing(){
    let rnd = Int.random(in: 1...10)
    
    if rnd % 2 == 1 {
        return
    }
    
    print(rnd)
}

if add() == 3 {
    print("three")
}

/*:

 ```
    functionName(paramName: expr)
 ```
 
 */

func add(a: Int, b: Int) -> Int {
    return a+b
}

// formal parameter , actual parameter (argument)
add(a: 3, b: 3)

/*:

 ## Default Value
 
 ```
    (name: Type = Value)
 ```
 
 */

func sayHello(name: String = "Stranger") {
    print("Hello, \(name)")
}

sayHello(name: "Swift")

sayHello()


/*:

 ## Function parameter syntax
 
 ```
   // case 1. argument label + parameter name
    (name: Type )
 
   // case 2. argument label , parameter name
     (label name: Type)
 
    // case 3. wildcard pattern
    (_ name: Type)
 ```
 */


func sayHello(to name: String) {
    print("Hello, \(name)")
}

/*:
 
 ## Variadic Parameters
 
 ```
 (name: Type...)
 ```
 * 하나씩만 선언가능함
 */


func printSum(of nums: Int...){
    var sum = 0
    for num in nums {
        sum += num
    }
    
    print(sum)
}

// augument를 배열형태로 전달
printSum(of: 1,2,3,4)

/*:
    ## In-Out Parameters
 
 
```
(name: inout Type)
 
 functionName(argLabel: &expr)
 
 ```
 * inout keyword
 * & character
 * inout 키워드를 사용할 때 함수선언시 기본값을 선언할 수 없음
 
 * Immutable : 값을 바꿀 수 없음
 * mutable : 값을 바꿀 수 있음
 
 */

var num1 = 12
var num2 = 34

func swapNumber(_ a: inout Int, with b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

num1
num2

// Copy-In Copy-Out Memory Model
swapNumber(&num1, with: &num2)

num1
num2

let a = 12
let b = 34


var count = 0

func sum(with c: inout Int, _ nums: Int...) -> Int {
    
    var sum = 0
    for num in nums {
        sum += num
        c += 1
    }
    return sum
}

let result = sum(with: &count, 1,2,3,4,5)

print(count, result)

/*:
    ## Function Notation
 ```
 functionName(label:)
 functionName(label: label:)
 functionName
 functionName(_:)
 ```

 */

/*:
    ## Function Types
 
```
    (ParameterTypes) -> ReturnType
 ```
 
 *  () : Empty Tuple
 *  () : Void
  
 
## First-class Citizen
    
    * 변수나 상수에 저장할 수 있다.
    * 파라미터로 전달할 수 있다.
    * 함수에서 리턴할 수 있다.

 */

func sayHello2(){
    print("Hello, Swift")
}


let f1 = sayHello2
f1()

// argument label : with
func printHello(with name: String) {
    print("Hello \(name)")
}

// void : ()
let f2: (String) -> () = printHello(with:)

let f3 = printHello(with: )

// f3에 argument label 정보는 저장되지 않는다.
f3("World")

func add2(a: Int, b: Int) -> Int {
    return a+b
}

var f4: (Int, Int) -> Int = add(a:b: )

f4(1,2)

func add(_ a: Int, with b: Int) -> Int {
    return a+b
}

f4 = add(_:with:)

func swapNumbers(_ a: inout Int, _ b: inout Int){
    
}

let f5 = swapNumbers(_:_:)

f5

func sum(of numbers: Int...){
    
}

let f6 = sum(of:)
f6

func add(_ a: Int, _ b: Int ) -> Int {
    return a+b
}

func subtract(_ a: Int, _ b: Int ) -> Int {
    return a-b
}

func multiply(_ a: Int, _ b: Int ) -> Int {
    return a*b
}

func divide(_ a: Int, _ b: Int ) -> Int {
    return a/b
}

typealias ArithmeticFunction = (Int, Int) -> Int

func selectFunction(from op :String) -> ArithmeticFunction? {
    switch op {
    case "+":
        return add(_:_:)
    case "-":
        return subtract(_:_:)
    case "*":
        return multiply(_:_:)
    case "/":
        return divide(_:_:)
    default:
        return nil
    }
}

let af = selectFunction(from: "+")
af?(1,2)

selectFunction(from: "*")?(12,34)


func add3(_ a: Int, _ b: Int) -> Int {
    return a+b
}

let f: (Int, Int) -> Int = add3
let result2 = f(1, 2)

print(result2)

/*:
  ##  Nested Functions
    * 함수 내부에 구현된 함수
 */

func outer() {
    print("outer")
}

func inner(){
    print("inner")
}

outer()
inner()


func outer2() {
    // scope가 선언된 함수로 축소됨
    func inner(){
        print("inner")
    }
    
    inner()
    print("outer")
}


func outer3() -> () -> () {
    func inner(){
        print("inner2")
    }
    
    print("outer2")
    return inner
}

let aa = outer3()
aa()

import UIKit

/*:
    # Closure
 
 * Closure의 종류: Named Closure와 Unnamed Cloasure
 
 * 함수는 first class citizen
 
 
 ```
 { (parameters) -> ReturnType in
    statements
 }
 
 { statements }
 
 ```
 
 * closure 사용시 augument label 사용하지 않는다.
 
 */

// closure는 global scope에 단독으로 사용 불가함
//{
//    print("Hello, Swift")
//}

// () -> ()
let c = { print("Hello, Swift") }

c

let c2 = { (str: String) -> String in
    return "Hello, \(str)"
}


let result = c2("Closure")
print(result)


typealias SimpleStringClosure = (String) -> String

func perform(closure: SimpleStringClosure) {
    print(closure("iOS"))
}

perform(closure: c2)

perform(closure: { (str: String) -> String in
    return "Hi, \(str)"
} )

let products = [
"a", "b", "c", "ad", "aAe"
]

// inline closure 구현
var proModels = products.filter { (name: String) -> Bool in
    return name.contains("a")
}

print(proModels)

print(proModels.sorted())

proModels.sort { (lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
}

print(proModels)

print("Start")
print("End")

// 5초 뒤 실행
//DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {print("ppp")})


// 문법 최적화
DispatchQueue.main.asyncAfter(deadline: .now()+5) {
    print("End")
}


/*:
 
 ##  Syntax Optimization
    
 */

/*:
 
 ### Shothand Argument Name
 
 * $0, $1, $n
    
 */


let products2 = [
"apple", "bapple", "capple", "dapple", "eapple", "Aapple", "Bapple"
]

var proModels2 = products2.filter { (name: String) -> Bool in
    return name.contains("a")
}

// 파라미터와 리턴형식을 생략한다.
products2.filter({
    return $0.contains("a")
})

print(proModels2)


/*:
 
 ### Implicit Returns
 
 * 코드가 단일 return문이면  return 키워드를 생략한다.
 */

products2.filter({
    $0.contains("aa")
})

print(proModels2)

/*:
 
 ### Trailing Closure
 * 괄호안의 {} 코드 구현체를 ()옆에 떼서 붙인다.
 */

products2.filter() {
    $0.contains("aa")
}

products2.filter {
    $0.contains("aa")
}


proModels2.sort() {
    $0.caseInsensitiveCompare($1) == .orderedAscending
}

// () 생략
proModels2.sort {
    $0.caseInsensitiveCompare($1) == .orderedAscending
}

proModels2.contains { (str: String) -> Bool in
    return str == "b"
}

let list = ["Apple", "Google", "Samsung", "Microsoft"]

let a = list.contains(where:  { (name: String) -> Bool in
  return name.hasPrefix("A")
                      
}) // (1)

let b =  list.contains {$0.hasPrefix("A")}
 // (2)

print(a && b)


/*:
 
  ## Capturing Values
 * 클로저는 값을 캡처한다. ( = 값을 가져와서 사용한다.)
 * 값에 대한 참조를 획득한다.
  * 순환 오류 발생 가능
*/

var num = 0
print("Check point #1 \(num) ")
let c9 = {
    num += 1
    print("Check point #1 \(num) ")
}


c9()

//num += 1
print("Check point #2 \(num) ")

/*:
 
 ## Escaping Closure
 * 함수의 실행 종료에도 실행되는 클로저
 * Non-Escaping Closure : 함수 실행되는 동안에만 클로저가 실행된다.
 */

// Non-Escaping Closure
// * 입력 파라미터를 클로저로 받고 있음
func performNonEscaping(closure: () -> ()) {
    print("start")
    closure()
    print("end")
}

// Escaping Closure
performNonEscaping {
    print("closure")
}


func performEscaping(closure: @escaping () -> () ) {
    print("start")
    var a = 12
    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
        closure()
        print(a)
    }
    
    print("end")
}


// 3초후 closure print됨.
performEscaping {
    print("closure")
}

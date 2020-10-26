import UIKit

/*:
 
 # Closures
 
 클로저 표현식으로 클로저를 구현하는 방법에 대해 공부합니다.
 
 Swift가 제공하는 세 가지 클로저
 클로저 표현식
 클로저 호출
 클로저를 사용하는 API 예제
 
 * Named Closures : Function, Nested Function
 * Unamed Closures: Anonymous Function
 * 클로저도 first-class citizen이다..
 
 
 ## Syntax
 
 ```
 { (parameters) -> ReturnType in
    statements
 
 }
 
 {  statements }
 ```
* 클로저는 global scope에서 단독으로 사용할 수 없다.
* argument label을 사용하지 않는다.
 
 */


let c = { print("hellllo~~") }

c()

let c2 = { (str: String) -> String  in
    return "Hello, \(str)"
}


typealias SimpleStringClosure = (String) -> String

func perform(closure: SimpleStringClosure) {
    print(closure("iOS"))
}

perform(closure: c2)

perform(closure: { (str: String) -> String in
    return "Hi, \(str)"
})

let products = [
    "MacBook Air", "MacBook Bir", "MacBook Cir",
    "MacBook Dir", "MacBook Fir", "iPad", "iPad mini",
    "iPad Huge", "iPad Pro", "iMac Pro", "Mac Pro"
]

var proModels = products.filter({ (name: String) -> Bool in
    return name.contains("Pro")
})

print(proModels)

print(proModels.sorted())

proModels.sort { (lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
}

print(proModels)

print("Start")
//print("End")


DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    print("End")
}

/*:
 
 ## Syntax Optimization
 문법 최적화를 통해서 클로저 코드를 단축시키는 방법에 대해 공부합니다.

 Implicit Returns
 Trailing Closures
 Shorthand Argument Names
 
 */

proModels = products.filter({
   $0.contains("Pro")
})

// Trailing Closure
 proModels = products.filter(){
    $0.contains("Pro")
}

proModels = products.filter {
   $0.contains("Pro")
}

proModels.sort { (lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
}

// 1. 파라미터 형식과 리턴형을 지운다.
proModels.sort { (lhs, rhs) in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
}


proModels.sort {
    return $0.caseInsensitiveCompare($1) == .orderedAscending
}


// 단일 리턴문이면 리턴 키워드 삭제
proModels.sort (by: {
     $0.caseInsensitiveCompare($1) == .orderedAscending
})

proModels.sort {
     $0.caseInsensitiveCompare($1) == .orderedAscending
}

/*:
 
 ## Capturing Values
 클로저 내부에서 클로저 외부에 있는 값에 접근할 때 값이 어떻게 처리되는지 공부합니다.
 
 */

var num = 0
// 값을 가져와서 쓴다. 값을 캡쳐한다. 참조를 캡쳐한다. 원본을 가져온다. 클로저에서 변수의 값을 바꾸면 원래값도 바뀐다.
let e = {
    num += 1
    print("check Point #1 \(num)") }
e()

print("check Point #2 \(num)")

/*:
 
 ## Escaping Closure ***
 Escaping과 Non escaping 방식으로 클로저를 실행했는데 어떤 차이가 있는지 비교합니다.


 */

func performNonEscaping(closure: () -> ()) {
    print("start")
    closure()
    print("End")
}

performNonEscaping {
    print("closure")
}

func performEscaping(closure : @escaping () -> ()) {
    print("start")
    
    var a = 12
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        closure()
        print(a)
    }
    
    print("End")
}

performEscaping {
    print("cllllosure")
}


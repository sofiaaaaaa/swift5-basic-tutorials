import UIKit

/*:
 
 # Operator Methods
 기존 연산자가 새로운 형식을 지원하도록 확장 하는 방법에 대해 공부합니다.

 연산자 메소드 문법
 구현시 주의사항
 == 연산자 구현
 - 연산자 구현
 ++ 연산자 구현
 
 ## Syntax
 
 ```
 static func operator(parameters) -> ReturnType {
    statements
 }
 ```
 
 */

struct Point: Equatable {
    var x = 0.0
    var y = 0.0

}

//
//extension Point: Equatable {
//    static func ==(lhs: Point, rhs: Point) -> Bool {
//        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
//    }
//}

// 인스턴스를 비교할 때는 연산자 메소드를 통해 확장구현해야한다.
let p1 = Point(x: 12, y: 34)
let p2 = Point(x: 67, y: 89)

p1 == p2

 
//extension Point {
//    static prefix func -(pt: Point) -> Point {
//        return Point(x: -pt.x, y: -pt.y)
//    }
//}
//
//let p3 = -p1

extension Point {
    static postfix func ++(pt: inout Point) -> Point {
        let ret = pt
        pt.x += 1
        pt.y += 1
        return ret
    }
}

var p4 = Point(x: 1.0, y: 2.0)
let p5 = p4++
p5.x
p5.y


p4.x
p4.y

/*:
 
 ## Custom Operators
 Swift가 제공하지 않는 새로운 연산자를 직접 구현하는 방법에 대해 공부합니다.

 연산자 선언 문법
 우선순위 그룹
 
 ```
 prefix operator operator
 postfix operator operator
 infix operator operator
 
 ```
 
 ### Reserved Tokens : 단독으로 사용 불가.
 
 ```
 (, ), {, }, [, ], ., ,, :, ;, =, @, #, &(prefix operator), ->, `, ?, !(postfix operator), \/*, *\/
 ```
 
 ### First Character : 첫번째 문자로 사용해야함
 
 ```
 /, =, -, +, !, *, %, <, >, &, |, ^, ?, ~
```

 ### Syntax
 ```
 static prefix func operator(parameters) -> ReturnType {
    statements
 }
 
 static postfix func operator(parameters) -> ReturnType {
    statements
 }
 
 static func operator(parameters) -> ReturnType {
    statements
 }
 
 ```
 
 */
 */

prefix operator +++

extension Int {
    static prefix func +++(num: inout Int) {
        num += 2
    }
}

var a = 1
+++a
a

//infix operator *+*
//
//extension Int {
//    static func *+*(left: Int, right: Int) -> Int {
//        return (left * right) + (left * right)
//    }
//}


// 우선선위 그룹을 지정하지 않아서 생기는 문제 error:  Adjacent operators are in unordered precedence groups 'DefaultPrecedence' and 'AdditionPrecedence'
//1 *+* 2 + 3

/*:
 
 ## Precedence Groups
 
 Operators | Precedence Groups
 ---
 + - | AdditionPrecedence
 * / | MultiplicationPrecedence
 < <= > >= == != | ComparisonPrecedence
= += -= *= /= | AssignmentPrecedence
 
 ### Operator Declarations
 
 infix operator operator: PrecedenceGroup
 
 precedenceGroup Name {
    higherThan: LowerGroupName
    lowerThan: HigherGroupName
    associativity: associativity
 }
    
 
 */


//
//// MultiplicationPrecedence 우선순위 그룹 지정 : 복합 연산시 우선순위가 필요함.
//infix operator *+*: MultiplicationPrecedence
//
//extension Int {
//    static func *+*(left: Int, right: Int) -> Int {
//        return (left * right) + (left * right)
//    }
//}
//
//1 *+* 2 + 3


precedencegroup Myprecedence {
    higherThan: AdditionPrecedence
}

//  우선순위 그룹 지정 : 복합 연산시 우선순위가 필요함.
infix operator *+*: Myprecedence

extension Int {
    static func *+*(left: Int, right: Int) -> Int {
        return (left * right) + (left * right)
    }
}

1 *+* 2 + 3


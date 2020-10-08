import UIKit

/*:

 # Optional
 
 
 ```
 if let name: Type = OptionalExpression {
    statements
 }
 
 while let name: Type = OptionalExpression {
    statements
 }
 
 guard let name: Type = OptionalExpression else {
    statements
 }
 
 ```
 
 */
//var str: String? = "str"
//
//guard let str = str else {
////    str
//    fatalError()
//}
//
//str
//
//var num: Int? = nil
//
//if var num = num {
//    num = 456
//    print(num)
//}
//
//let a: Int? = 12
//let b: String? = "str"
//
//if let num = a, let str = b, str.count > 5 {
//
//}



//let str: String? = "Hello"
//
//if str != nil {
//    print(str!)
//} else {
//    print("empty string")
//}


//let str: String? = "Hello"
//
//if let str = str {
//    print(str)
//} else {
//    print("empty string")
//}



/*:

 # Implicitly Unwrapped Optionals
 
 1. outlet 연결
 2. api에서 iuo를 리턴하는 경우
 
 optional binding이나 optional chaining으로 .
 
 
 */
let num: Int!  = 12

let a =  num

let b: Int = num


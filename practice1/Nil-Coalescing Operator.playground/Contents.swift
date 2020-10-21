import UIKit


/*:

 # Nil-Coalescing Operator
 
 */

var msg = ""
var input: String? = "Swift"

if let inputName = input {
    msg = "Hello, "
    msg +=  inputName
} else {
    msg = "Hello, fool"
}

print(msg)

var str = "Hello, " + (input  != nil ? input! : "fool")
print(str)



/*:
 ## Syntax
 
 a ?? b
 OptionalExpression ?? Expression
 
 */

input = nil

str = "Hello, " + (input ?? "Stranger" )
print(str)

let a: Int? = nil
let b: Double? = 12.3
let c: String? = "Hello"

let ra: Int = a ?? 0
let rb: Double = b ?? 0.0
let rc: String = c ?? "no value"

print(ra, rb, rc)

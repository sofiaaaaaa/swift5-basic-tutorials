import UIKit

/*:
 
 # Strings and Characters
  문자열과 문자에 대한 기본적인 내용을 공부합니다.

 문자열 리터럴
 문자열 자료형과 문자 자료형
 문자열의 가변성
 유니코드
 
 */

let s = "String"

let c: Character = "C"

let emptyChar: Character = " "

let emptyString = " "


let emptyString3 = String(" ")

emptyString.count


/*:
 
 ## String Types
 
 * Value Type: String,  Swift String
 * Reference Type : NSString, Foundation String
 * Toll-free bridging
 */

var nsstr: NSString = "str"

// error: 'NSString' is not implicitly convertible to 'String'; did you mean to use 'as' to explicitly convert?
//let swiftstr: String = nsstr
let swiftstr: String = nsstr as String

nsstr = swiftstr as NSString

var mutableStr = "str"
mutableStr = "new str"

/*:
 
 ## Unicode
 
 */

let str = "Swift String"

str.utf8
str.utf16

var thumbUp = "🥒"
//🥒
//cucumber
//Unicode: U+1F952, UTF-8: F0 9F A5 92

thumbUp = "\u{1F952}"

thumbUp = """
    multiline
    2multiline
    3multiline
"""

/*:
 
 ## String Interpolation
 문자열을 동적으로 구성하는 두 가지 방법을 공부합니다.

 String Interpolation
 문자열 포맷 생성자
 포맷 지정자
 다국어 포맷 문자열
 Escape Sequence
 
 */

let size  = 12.34
var str4 = "\(size)KB"

/*:
 ## Format Specifier

 ```
 %char
 ```

 */

str4 = String(format: "%.1fKB", size)

String(format: "Hellooooo %@", str4)

String(format: "Hellooooo %d", 12)
String(format: "[%10.3f]", 12.33)
String(format: "[%010.3f]", 12.33)

String(format: "[%-10d]", 12)

let firstName = "Jone"
let lastName = "Re"

let korFormat = "그의 이름은 %2$@ %1$@ 입니다."
let engFormat = "His name is %@ %@."

String(format: korFormat, firstName, lastName)

String(format: engFormat, firstName, lastName)


/*:
 ## Escape Sequence

 */

var escapeStr = "\\"

// tab
print("A\tB")

 /*:
 
 ## String Indices
 문자열 인덱스로 특정 문자의 위치를 표현하는 방법을 공부합니다.

 String.Index 형식
 서브스크립트 문법
 인덱스 구성 메소드

 
 */

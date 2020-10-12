import UIKit

/*:
 
 # String and Character
 
 
 */

let s = "String"
let c = "C"

c // String


let c2: Character = "C"
c2


// Error Cannot convert value of type 'String' to specified type 'Character'
//let emptyChar: Character = ""
let emptyChar: Character = " "

let emptyString = " "

emptyString.count

let emptyString2 = String()


/*:

 ##  String Types

 * Swift 문자열, Foundation 문자열
 * Toll-free Bridged
 * 서로 호환이 가능하지만 unicode 처리방식이 다르다.
 */


var nsstr: NSString = "str"

//'NSString' is not implicitly convertible to 'String'; did you mean to use 'as' to explicitly convert?
//let swiftStr: String = nsstr

// Type casting
let swiftStr: String = nsstr as String

nsstr = swiftStr as NSString

/*:
 ## Mutability
 가변성
 
 * let, var 키워드
 
 */

let immutableStr = "str"
//immutableStr = "new str"

var mutableStr = "str"
mutableStr = "new Str"

/*:
 ## Unicode
 
 * swift는 문자열을 저장할 때 unicode에 독립적으로 저장한다.
 */

let str = "Swift String"

str.utf8

str.utf16

// ctrl + cmd + space
var thumbUp = "🙏"

thumbUp = "\u{1F64F}"

// 이모티콘 팝업 > 선택 오른쪽 메뉴 >  "문자 정보 복사"
//🙏
//동시에 누르는 손
//유니코드: U+1F64F, UTF-8: F0 9F 99 8F


/*:

 ## Multiline String Literal
 
 */

let loremIpsum = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus eaque voluptas quaerat architecto reprehenderit suscipit repudiandae earum \n perferendis consequatur maxime dicta illo consequuntur officia nam aperiam aliquam, reiciendis iusto magnam."

let loremIpsum2 =
"""
    Lorem \n ipsum dolor sit amet consectetur adipisicing elit. Accusamus eaque voluptas quaerat
  architecto reprehenderit suscipit repudiandae earum \n perferendis consequatur maxime dicta illo consequuntur officia nam aperiam aliquam, reiciendis iusto magnam.
"""


/*:
 
 ## String Interpolation
 
*  문자열 삽입
* place holder
 
```
 \(expr)
 ```
 */

var str2 = "12.11KB"

let size = 12.34

// Error: Cannot convert value of type 'Double' to expected argument type 'String'
//str2  = size + "KB"

str2 = String(size) + "KB"

str2 = "\(size)KBb"





/*:
 
 ## Format Specifier
 
 ```
 %char
 ```
 */

// %.1f    소숫점 1자리 실수
str2 = String(format: "%.1fKB", size)

// %@ 문자열
String(format: "Hello, %@", "Swift")

// %d 정수
String(format: "%d", 12)

// %f 실수
String(format: "%f", 12.222)

// %3f 소숫점 3자리 실수
String(format: "%.3f", 12.222)


// %10.3f 소숫점 3자리 실수, 총 10자리 문자열
String(format: "%10.3f", 12.33)


// %010.3f 소숫점 3자리 실수,  총 10자리 문자열, 0이상 숫자에서 빈문자열은 0으로 채우기
String(format: "%010.3f", 12.33)

"[123]"
String(format: "[%d]", 123)

//"[       123]"
String(format: "[%10d]", 123)

//"[123       ]]"
String(format: "[%-10d]]", 123)

let firstName = "first"
let lastName = "last"

let korFormat = "이름은 %@ %@ 이다."
let engFormat = "name is %@ %@."

String(format: korFormat, firstName, lastName)
String(format: engFormat, firstName, lastName)


let korFormat2 = "이름은 %2$@ %1$@ 이다."
let engFormat2 = "name is %@ %@."

String(format: korFormat2, firstName, lastName)
String(format: engFormat2, firstName, lastName)



/*:
 
 ## Escape Sequence
 
 */

// Error : Unterminated string literal
//str = "\"

let str4 = "\\"

str4

// \t : tab
print("A\tB")

// \n 줄바꿈
print("C\nD")

// \"
print("Hello \"b\" ")



let year = 2019
let month = 10
let day = 14

// 오늘은 2019년 10월 14일 입니다.
let dateStr = String(format: "오늘은 %d년 %d월 %d일 입니다.", year,  month, day)

let weather = "맑음"
let temperature = 10.23456

// 날씨는 '맑음', 온도는 10.2도 입니다.
// /Solution.swift:14:82: error: argument type 'String' does not conform to expected type 'CVarArg'

let weatherStr = String(format: "날씨는 '%@', 온도는 %.1f도 입니다." , weather , temperature )

// String Interpolation 문법으로 dateStr, weatherStr을 공백 하나로 연결해 주세요.
let finalStr = "\(dateStr) \(weatherStr)"
print(finalStr)

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


/*:
 
 # String Indices
 
 */

let str3 = "Swift"

let firstCh = str3[str3.startIndex]

print(firstCh)

let lastCharIndex = str3.index(before: str3.endIndex)
let lastCh = str3[lastCharIndex]
//let endCh = str3[str3.endIndex]

print(lastCh)

let secondCharIndex = str3.index(after: str3.startIndex)
let secondCh = str3[secondCharIndex]
print(secondCh)

var thirdChIndex = str3.index(str3.startIndex, offsetBy: 2)
var thirdCh = str3[thirdChIndex]
print(thirdCh)

// index의 유효범위가 벗어나는 경우 앱에 crash가 발생할 수 있다.
thirdChIndex = str3.index(str3.endIndex, offsetBy: -3)
thirdCh = str3[thirdChIndex]
print(thirdCh)

// if문으로 유효성 검증 후 사용하기
if thirdChIndex < str3.endIndex && thirdChIndex >= str3.startIndex {
    print("aa")
}



let str5 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

// apple developer string range https://developer.apple.com/documentation/foundation/nsstring/1410144-range

let startIndexRange = str5.range(of: "nisi ut aliquip")
let startIndex = startIndexRange!.lowerBound

let endIndex = str5.index(startIndex, offsetBy: 14)

let result = str5[startIndex...endIndex]
print(result == "nisi ut aliquip")


/*:
 
 ## String Basic
 
 */

var btr = "Hello, Swift String"

var bmptyStr = ""
bmptyStr = String()

let a = String(true)

let b = String(12)

let cd = String(12.34)

let d = String(btr)

// 16진수
let hex = String(123, radix: 16)

// 8진수
let octal = String(123, radix: 8)

// 2진수
let binary = String(123, radix: 2)

let repeatStr = "🦷🦷🦷🦷🦷🦷🦷🦷"

let repeatStr2 = String(repeating:  "🦷", count: 7)

let unicode = "\u{1f44f}"

let e = "\(a) \(b)"
let f = a+b

btr += "!!"

str.count

str.count == 0

str.isEmpty

/*:
 ### Removing Substrings
 
 */

var wtr = "Hello, Awesome Swift!!!"

let lastCharIndex2 = wtr.index(before: wtr.endIndex)
var removed = wtr.remove(at: lastCharIndex2)

wtr

removed = wtr.removeFirst()
wtr

wtr.removeFirst(2)
wtr

wtr.removeLast()

wtr

wtr.removeLast(2)
wtr


if let range = wtr.range(of: "Awesome") {
    wtr.removeSubrange(range)
    wtr
}

wtr

wtr.removeAll()
wtr

wtr.removeAll(keepingCapacity: true)

wtr = "Hello, Awesome Swift!!!"

var subStr = wtr.dropLast()

subStr = wtr.dropLast(3)

// 클로저를 파라미터로 받아서 문자열을 삭제하는 함수
subStr = wtr.drop { (ch) -> Bool in
    return ch != ","
}

subStr


let str34 = "Lorem ipsum dolor sit amet"


var result3 = str34.replacingOccurrences(of: "i", with: "",
options: NSString.CompareOptions.literal, range:nil)


result3 = result3.replacingOccurrences(of: "o", with: "O",
options: NSString.CompareOptions.literal, range:nil)


result3
print(result3 == "LOrem psum dOlOr st amet")

/*:
 
 ### Comparing Strings
 
*/

let largeA = "Apple"
let smallA = "apple"
let bb = "Banananaaa"

// ascii 값 순서로 비교
largeA == smallA

largeA != smallA

largeA < smallA
largeA < bb

smallA < bb

// 대소문자 구분O
largeA.compare(smallA) == .orderedSame

// 대소문자 구분x
largeA.caseInsensitiveCompare(smallA) == .orderedSame

largeA.compare(smallA, options: [.caseInsensitive]) == .orderedSame

let ttr = "Hello, Swift Programming"

let prefix = "hello"
let suffix = "Programming"

// 대소문자 구분함
ttr.hasPrefix(prefix)
ttr.hasSuffix(suffix)


ttr.lowercased().hasPrefix(prefix.lowercased())
 
/*:
 
 ### Finding Substrings
 
 */

var qtr = "Hello, Swift"

qtr.contains("Swift")
qtr.contains("swift") // false

qtr.lowercased().contains("swift") // true

qtr.range(of: "Swift")

qtr.range(of: "swift", options: [.caseInsensitive])

let str22 = "Hello, Programming"
let str33 = str22.lowercased()

var common = qtr.commonPrefix(with: str22)

common = qtr.commonPrefix(with: str33)
qtr.commonPrefix(with: str33, options: [.caseInsensitive])

str33.commonPrefix(with: qtr, options: [.caseInsensitive])


var count = 0
for i in qtr {
    if i.lowercased() == "i" {
        count += 1
    }
}

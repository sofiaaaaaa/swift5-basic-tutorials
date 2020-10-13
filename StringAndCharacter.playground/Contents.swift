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
 
 ## String Basics
 
 
 */


str.count

str.count == 0

str.isEmpty

str == "Apple"

"apple" != "Apple"

"apple" < "Apple"

// xxxed로 끝나면 원본을 바꾸지 않고 원본을 바꾼 새로운 값을 리턴한다.
str.lowercased()

str.uppercased()
str


str.capitalized

"apple gapple".capitalized
 
// Character Sequence
for char in "Hello" {
    print(char)
}

let num = "1234567890"


num.randomElement()

num.shuffled()


/*:
 ## Substring

    * 원본메모리를 공유한다.
    * 변수에 값을 저장할 때는 원본의 메모리 공간을 공유하지만, 변수의 값을 변경하는 시점에는 새로운 메모리를 생성한다.
    * 변수에 값을 저장할 때 String 생성자를 사용할 경우에는 새로운 메모리를 생성한다.
    * Copy-on-Write optimization
            
 */

let dtr  = "Hello, Swift"

let l = dtr.lowercased()

// 변수를 선언할 때는 원본의 메모리 공간을 사용한다
var first = dtr.prefix(1)

// 변수의 값을 변경하는 시점에 새로운 메모리를 생성한다.
first.insert("!", at: first.endIndex)

dtr
first


// 새로운 메모리가 바로 생성된다.
let newStr = String(str.prefix(1))


// 사용하지 않는 메서드 Warning : 'substring(to:)' is deprecated: Please use String slicing subscript with a 'partial range upto' operator. (deprecated는 현재는 사용가능하나 버전업되면 삭제될 예정이다. subScript 문법과 범위 연산자를 사용해야한다.)
dtr.substring(to: dtr.index(dtr.startIndex, offsetBy: 2))


// 범위 연산자 사용시 string index를 사용해야 한다.
let spp = dtr[dtr.startIndex..<dtr.index(dtr.startIndex, offsetBy: 2)]
let spp2 = dtr[..<dtr.index(dtr.startIndex, offsetBy: 2)]

dtr[dtr.index(dtr.startIndex, offsetBy: 2)...]

let lower = str.index(str.startIndex, offsetBy: 2)
let upper = str.index(str.startIndex, offsetBy: 5)

str[lower...upper]


/*:
 
 ## String Editing
 
 
 ### Appending Strings and Characters
 
 */


var etr = "Hello"

// 기존 변수를 변경한다.
etr.append(", ")

// 대상 문자열을 변경하지 않고 새로운 문자열을 리턴한다.
let t = etr.appending("Swift")

etr
t

//t.append(<#T##c: Character##Character#>)

s.appending("!!")

"File size is ".appendingFormat("%.1f", 12.3456)

var atr = "Hello Swift"

atr.insert(",", at: atr.index(atr.startIndex, offsetBy: 5))


if let sIndex = atr.firstIndex(of: "S") {
    atr.insert(contentsOf: "Awesome", at: sIndex)
}

/*:
 
 ### Replacing Substrings
 
 */

var vtr = "Hello, Objective-C"


// 문자열의 범위를 검색한다.
if let range = vtr.range(of: "Objective-C") {
    vtr.replaceSubrange(range, with: "Swift")
}

vtr

if let range = vtr.range(of: "Hello") {
    let s = vtr.replacingCharacters(in: range, with: "Hi")
    vtr
}


var ps = vtr.replacingOccurrences(of: "Swift", with: "AwesomeSwift")

ps = vtr.replacingOccurrences(of: "swift", with: "AwesomeSwift")
ps = vtr.replacingOccurrences(of: "swift", with: "AwesomeSwift", options: [.caseInsensitive])


/*:
 
 ### Removing Substrings
 
 */

var wtr = "Hello, Awesome Swift!!!"

let lastCharIndex = wtr.index(before: wtr.endIndex)
var removed = wtr.remove(at: lastCharIndex)

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


let str3 = "Lorem ipsum dolor sit amet"


var result = str3.replacingOccurrences(of: "i", with: "",
options: NSString.CompareOptions.literal, range:nil)


result = result.replacingOccurrences(of: "o", with: "O",
options: NSString.CompareOptions.literal, range:nil)


result
print(result == "LOrem psum dOlOr st amet")

/*:
 
 ### Comparing Strings
 
*/

let largeA = "Apple"
let smallA = "apple"
let b = "Banananaaa"

// ascii 값 순서로 비교
largeA == smallA

largeA != smallA

largeA < smallA
largeA < b

smallA < b

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

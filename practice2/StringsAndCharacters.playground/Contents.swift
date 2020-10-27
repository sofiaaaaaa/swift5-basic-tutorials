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

let str8 = "Swift"


// startIndex : nested type
let firstCh = str8[str8.startIndex]
print(firstCh)

// let lastCharIndex: String.Index
let lastCharIndex = str8.index(before: str8.endIndex)
let lastCh = str8[lastCharIndex]

let secondCharIndex = str8.index(after: str8.startIndex)
let secondCh = str8[secondCharIndex]

print(secondCh)
//var thirdCharIndex = str8.index(after: secondCharIndex)


var thirdCharIndex = str8.index(str8.startIndex, offsetBy: 2)
var thirdCh = str8[thirdCharIndex]

print(thirdCh)

// if문으로 유효성을 확인해야함
thirdCharIndex = str8.index(str8.endIndex, offsetBy: -3)
thirdCh  = str8[thirdCharIndex]
print(thirdCh)

if thirdCharIndex < str.endIndex && thirdCharIndex >= str8.startIndex {
    
}

/*:
 
 ## String Basics
 문자열을 조작에 필요한 기초 테그닉을 공부합니다.

 문자열 생성
 문자열 연결
 문자열 길이 확인
 문자열 비교
 대소문자 변환

 
 */

var str10 = "Hello, Swift String"
var emptyStr = ""

emptyStr = String()

let a = String(true)

let b = String(12)
let cc = String(12.34)

let dd = String(str)

let hex = String(123, radix: 16)

let octal = String(123, radix: 8)

let binary = String(123, radix: 2)

// swift는 유니코드입력을 지원한다.
let repeatStr = String(repeating: "🥞", count: 10)

let repeatStr2 = String(repeating: "/u{1F95E}", count: 10)

let e = "\(a) \(b)"

let f = a + b

str10 += "!!"

str.count

str.isEmpty

str == "Apple"
str != "Apple"

str < "Apple"

"Apple".lowercased() == "apple"

"Apple".uppercased() == "APPLE"

str.capitalized

"apple ipad".capitalized

// Character Sequence

for char in "Hello" {
    print(char)
}

let num = "1234567890"

num.randomElement()

/*:
 
 ## Substring
 Substring 형식과 문자열 일부분을 추출하는 방법을 공부합니다.

 Substring 형식의 메모리 관리 방식
 Copy-on-Write 최적화
 문자열 범위 추출
 
 */


let str20 = "Hello, Swift"
let l  = str20.lowercased()

// str20의 첫번째 글자를 가리키기만 한다. 메모리가 생성되지 않는다.
var first = str20.prefix(1)

//String.SubSequence

// 변수의 값을 변경하면 새로운 메모리가 생성된다.
first.insert("!", at: first.endIndex)

let newStr = String(str.prefix(1))

//let s = str20[0..<2]

//let s2 = str20[str20.startIndex..<str20.index(str20.startIndex, offsetBy: 2)]


let s2 = str20[..<str20.index(str20.startIndex, offsetBy: 2)]
str20[str20.index(str20.startIndex, offsetBy: 2)...]

let lower = str20.index(str20.startIndex, offsetBy: 2)
let upper = str20.index(str20.startIndex, offsetBy: 2)

/*:
 
 ## String Editing #1
 메소드를 활용해서 문자열을 편집하는 방법에 대해 공부합니다.

 문자열 뒤에 새로운 문자열 연결
 특정 위치에 새로운 문자열 추가
 
 */

var strstr = "Hello"
strstr.append(", ")
strstr

// appending메서드는 원본의 값을 변경하지 않는다.
let zzz = strstr.appending("bb")


// 변수 값을 직접 변경하는 append 메서드
strstr.append("D")


"File size is ".appendingFormat("%.1f", 12.3456)

strstr.insert(",", at: strstr.index(strstr.startIndex, offsetBy: 5))

if let sIndex = strstr.firstIndex(of: "S") {
    strstr.insert(contentsOf: "A", at: sIndex)
}

//strstr.insert(contentsOf: <#T##Collection#>, at: <#T##String.Index#>)

strstr = "Hello, Objective-C"

if let range = strstr.range(of: "Objective-C") {
    strstr.replaceSubrange(range, with: "Swift")

}

if let range = strstr.range(of: "Hello") {
    strstr.replacingCharacters(in: range, with: "Bbye")
}

var str3 = strstr.replacingOccurrences(of: "Swift", with: "aaaa")

str3 = strstr.replacingOccurrences(of: "swift", with: "bbb", options: [.caseInsensitive])

var str5 = "Hello, Awesome Swift!!!"

let lastCharIndex5 = str5.index(before: str5.endIndex)

var removed = str5.remove(at: lastCharIndex5)
str5

removed = str5.removeFirst()
str5

str5.removeFirst(2)
str5

str5.removeLast()
str5.removeLast(2)

if let range = str5.range(of: "Awesome") {
    str5.removeSubrange(range)
    str5
}

// 파라미터 없이 호출하면, 메모리공간도 삭제됨.
//str5.removeAll()

// 메모리공간을 지우지 않도록 파라미터값 설정
str5.removeAll(keepingCapacity: true)

str5 = "Hello, Awesome Swift!!!"

// return type이 substring인 경우 메모리를 새로 생성해서 값을 복사하는게 아니라 원본값의 메서드 결과를 공유함.
var subStr5 = str5.dropLast()

subStr5 = str5.dropLast(3)

/*:
 
 ## String Comparison
 문자열을 비교하는 방법에 대해 공부합니다.

 비교 연산자 활용
 compare(_:) 메소드 활용
 ComparisonResult 열거형
 대소문자를 무시하고 비교
 접두어, 접미어 비교
 
 */

let largeA = "Apple"
let smallA = "apple"
let smalB = "Banana"

largeA == smallA
largeA < smallA


largeA.compare(smallA) == .orderedSame
largeA.caseInsensitiveCompare(smallA) == .orderedSame
largeA.compare(smallA, options: [.caseInsensitive])

let str30  = "Hello, Swift Programming!"
let prefix = "Hello"
let suffix = "Programming"

str30.lowercased().hasPrefix(prefix.lowercased())
str30.hasSuffix(suffix)

/*:
 
 ## String Searching
 문자열에서 원하는 부분만 검색하는 방법을 공부합니다.

 단어 검색
 범위 검색
 공통 접두어 검색
 
 */

let str50 = "Hello, Swift"
str50.contains("Swift")

str50.lowercased().contains("Swift")

str50.range(of: "Swift")

str50.range(of: "swift", options: [.caseInsensitive])

let str2 = "Hello, Programming"
let str31 = str2.lowercased()

var common = str50.commonPrefix(with: str2)

common = str50.commonPrefix(with: str3)
common = str50.commonPrefix(with: str3, options: [.caseInsensitive])


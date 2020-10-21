import UIKit

/*:
 
 # String Options
 
 ## Case Insensitive Option
 
 */

"A" == "a"
"A".caseInsensitiveCompare("a") == .orderedSame

"A".compare("a", options: [.caseInsensitive]) == .orderedSame

//  public struct CompareOptions : OptionSet
// NSString.CompareOptions.caseInsensitive
// Swift는 형식추론이 가능하여 생략가능하다.   .caseInsensitive 만 사용해도 됨


/*:
 
 # Literal Option
 
 */

let a = "\u{D55C}"
let b = "\u{1112}\u{1161}\u{11AB}"

a == b
a.compare(b) == .orderedSame

// literal 옵션을 추가하는게 더 빠르지만 cpu 성능이 좋으니 상관없다.
a.compare(b, options: [.literal]) == .orderedSame

/*:

 # Backwards Option

 */


 // 아랍어는 오른쪽에서 왼쪽으로 검색하게 된다.
let korean =  "행복하세요"
let english = "Be happy"

if let range = english.range(of: "p") {
    english.distance(from: english.startIndex, to: range.lowerBound)
}

// backwards 옵션은 검색방향을 반대로 바꾼다.
if let range = english.range(of: "p", options: [.backwards]) {
    english.distance(from: english.startIndex, to: range.lowerBound)
}


/*:

 # Anchored Option
 * 검색 부분을 문자열 시작부분이나 마지막 부분으로 제한한다.
 */


let str = "Swift Programming"

// leading -> trailling 방향
if let result55 = str.range(of: "Swift") {
    print(str.distance(from: str.startIndex, to: result55.lowerBound))
} else {
    print("not found")
}


// trailling -> leading  방향
if let result55 = str.range(of: "Swift", options: [.backwards]) {
    print(str.distance(from: str.startIndex, to: result55.lowerBound))
} else {
    print("not found")
}

if let result55 = str.range(of: "Swift", options: [.anchored]) {
    print(str.distance(from: str.startIndex, to: result55.lowerBound))
} else {
    print("not found")
}

// .anchored 문자열 전체를 검색하지 않는다. .backwards는 마지막 부분만 검색한다.
if let result55 = str.range(of: "Swift", options: [.anchored, .backwards]) {
    print(str.distance(from: str.startIndex, to: result55.lowerBound))
} else {
    print("not found")
}


str.lowercased().hasPrefix("swift")
str.hasSuffix("swift")

if let _ = str.range(of: "swift", options: [.anchored, .caseInsensitive]) {
    print("same prefix")
}

/*:
 
 # Numeric Option
 
 */

"A" < "B"

"a" < "B"


let file9 = "file9.txt"
let file10 = "file10.txt"

// 각 문자별로 비교를 하기 때문에 9와 1부분에서 9가 더 크다고 판단되어 file9 값이 더 큰 값으로 인식된다.
file9 < file10

file9.compare(file10) == .orderedAscending

// numeric은 숫자로 비교하도록 한다. 9 < 10 비교 가능해짐
file9.compare(file10, options: [.numeric]) == .orderedAscending


/*:
 
 # Diacritic Insensitive
 
 */

let aa = "Cafe"

// * 꿀팁 : 알파벳 키를 길게 누르면 악센트를 선택할 수 있다.
let bb = "Cafè"

aa == bb
aa.compare(bb) == .orderedSame

// 발음기호를 무시하고 비교하는 옵션 diacriticInsensitive
aa.compare(bb, options: [.diacriticInsensitive]) == .orderedSame


/*
 
 # Width Insensitive Option
 
 * 전각문자, 반각문자.
 
 */

let aaaa = "\u{30A1}"
let bbbb = "\u{ff67}"

aaaa == bbbb
aaaa.compare(bbbb) ==  .orderedSame

aaaa.compare(bbbb, options:  [.widthInsensitive]) ==  .orderedSame


/*
 
 # Forced Ordering Option
 
 * 어떤 경우에도 강제로 정렬하기
 
 */

let upper = "STRING".lowercased()
let lower = "string"

upper == lower
upper.compare(lower, options: [.caseInsensitive]) == .orderedSame

// 설정한 caseInsensitive 옵션을 무시하고 비교함
upper.compare(lower, options: [.caseInsensitive, .forcedOrdering]) == .orderedSame

/*:
 
 # Regular Expression
 * 정규표현식
 */

// 이메일 패턴 검사
let emailPattern = "([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}"
let emailAddress = "user@example.com👈🏻"

if let _ = emailAddress.range(of: emailPattern) {
    print("found")
} else {
    print("not found")
}


if let range = emailAddress.range(of: emailPattern, options: [.regularExpression]) , (range.lowerBound, range.upperBound) == (emailAddress.startIndex, emailAddress.endIndex){
    print("found")
} else {
    print("not found")
}


if let range = emailAddress.range(of: emailPattern, options: [.regularExpression]){
    print("found")
} else {
    print("not found")
}


/*:

 # Character Set

 */


let aaa = CharacterSet.uppercaseLetters

let bbb = aaa.inverted

var str8 = "loRem Ipsum"

var charSet = CharacterSet.uppercaseLetters

// 대문자의 위치 찾기. 첫번째 Index 출력
if let range = str8.rangeOfCharacter(from: charSet, options: [.backwards]) {
    print(str8.distance(from: str8.startIndex, to: range.lowerBound))
}

str8 = " A p p l e"
charSet = .whitespaces

// 파라미터로 전달된 문자를 삭제한다. (문자열 중간의 문자는 제거하지 않는다. 처음과 마지막만 제거함)
let trimmed = str8.trimmingCharacters(in: charSet)

var editTarget = CharacterSet.uppercaseLetters

editTarget.insert("#")
editTarget.insert(charactersIn: "~!@")
editTarget.remove("A")
editTarget.remove(charactersIn: "BCD")


// CharacterSet Customize
var customCharSet = CharacterSet(charactersIn: "@.")
let email = "userId@example.com"
let components = email.components(separatedBy: customCharSet)



let str6 = "[  http://www.programmers.co.kr  ]"

// 여기에서 CharacterSet을 생성해 주세요.
customCharSet = CharacterSet(charactersIn: "[] ")

// 여기에 결과를 저장해 주세요.
str6.trimmingCharacters(in: customCharSet)

import UIKit

/*:
 
 # String Options #1
 문자열 옵션을 통해 다양한 비교/검색 조건을 지정하는 방법에 대해 공부합니다.

 Case Insensitive Option
 Literal Option
 Backwards Option
 Anchored Option

 
 */

"a".caseInsensitiveCompare("A") == .orderedSame

"A".compare("a", options: [.caseInsensitive]) == .orderedSame

//NSString.CompareOptions 생략.

/*:
 
 ## Literal Option
 
 */

let a = "\u{D55C}"
let b = "\u{1112}\u{1161}\u{11AB}"

a == b
a.compare(b) == .orderedSame


a.compare(b, options: [.literal]) // false

/*:
 
 ## Backwards Option
문자열을 반대로 읽는 옵션 (아랍어는 오른쪽에서 왼쪽으로 읽는다.)
 
 왼쪽: Leading
 오른쪽: Trailing
 
 */

let english = "abcdefg"

if let range = english.range(of: "d") {
    english.distance(from: english.startIndex, to: range.lowerBound)
}

if let range = english.range(of: "d", options: [.backwards]) {
    english.distance(from: english.startIndex, to: range.lowerBound)
}

/*:
 
 ## Anchored Option
 
 */

let str = "Swift Programming"


if let result = str.range(of: "Swift") {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

if let result = str.range(of: "Swift", options: [.anchored, .backwards]) {
    print(str.distance(from: str.startIndex, to: result.lowerBound))
} else {
    print("not found")
}

/*:
 
 ## String Options #2
 문자열 옵션을 통해 다양한 비교/검색 조건을 지정하는 방법에 대해 공부합니다.

 Numeric Option
 Diacritic Insensitive Option
 Width insensitive Option
 Forced Ordering Option
 Regular Expression Option
 
 
 ###  Numeric Option

 
 */


let file9 = "file9.txt"
let file10 = "file10.txt"

// 9와 1을 비교하기 때문에 file9가 큼
file9 < file10

file9.compare(file10) == .orderedAscending

file9.compare(file10, options: [.numeric]) == .orderedAscending


/*:
###   Diacritic Insensitive Option
 
 발음기호

*/

let ab = "Cafe"
let ba = "Cafè"

ab == ba


ab.compare(ba, options: [.diacriticInsensitive]) == .orderedAscending


/*:
 
###    Width insensitive Option
 
 전각문자, 반각문자

*/

let aaa = "\u{30A1}"
let vvv = "\u{ff67}"

aaa == vvv
aaa.compare(vvv) == .orderedSame

a.compare(b, options: [.widthInsensitive]) == .orderedSame



/*:
 
###     Forced Ordering Option
 

*/

let upper = "STRING"
let lower = "string"

upper == lower

upper.compare(lower, options: [.caseInsensitive]) == .orderedSame

upper.compare(lower, options: [.caseInsensitive, .forcedOrdering]) == .orderedSame


/*:
 
 ## Regular Expression Option
 
 */

let emailPattern = "([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}"
let emailAddress = "user@example.com" //👈🏻

if let _ = emailAddress.range(of: emailPattern) {
    print("found")
} else {
    print("not found")
}

if let _ = emailAddress.range(of: emailPattern, options: [.regularExpression]) {
    print("found")
} else {
    print("not found")
}


if let range = emailAddress.range(of: emailPattern, options: [.regularExpression]) , (range.lowerBound, range.upperBound) == (emailAddress.startIndex, emailAddress.endIndex){
    print("found")
} else {
    print("not found")
}

/*:
 
 ## Character Set
 문자 집합을 만들고 활용하는 방법에 대해 공부합니다.

 기본 문자 집합 활용
 문자 집합 편집
 커스텀 문자 집합 생성
 문자 집합을 활용한 검색 및 편집
 
 */

let aaaa = CharacterSet.uppercaseLetters
let bbbb = aaaa.inverted

var str30 = "loRem Ipsum"
var charSet = CharacterSet.uppercaseLetters

if let range = str30.rangeOfCharacter(from: charSet) {
    print(str30.distance(from: str30.startIndex, to: range.lowerBound))
}

if let range = str30.rangeOfCharacter(from: charSet, options: [.backwards]) {
    print(str30.distance(from: str30.startIndex, to: range.lowerBound))
}

str30 = " A p p l e "
charSet = .whitespaces

let trimmed = str30.trimmingCharacters(in: charSet)

var editTarget = CharacterSet.uppercaseLetters

editTarget.insert("#")

editTarget.insert(charactersIn: "~!@")

editTarget.remove("A")

editTarget.remove(charactersIn: "BCD")

// 커스텀 캐릭터셋 만들기
let customCharSet = CharacterSet(charactersIn: "@.")

let email = "userId@example.com"

// components 메서드는 문자열을 캐릭터셋 기준으로 분리해서 배열로 반환한다.
let component = email.components(separatedBy: customCharSet)



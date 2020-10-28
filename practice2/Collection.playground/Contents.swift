import UIKit

/*:
 
 # Collection Overview
 컬렉션의 기초적인 내용에 대해 공부합니다.

 Foundation Collection (- class) 과 Swift Collection (- struct) 구조
 일반적인 특징
 컬렉션의 가변성
 Copy-on-Write 최적화
 
 
 * Foundation Collection는 객체형식만 저장가능
 * Swift Collection은 객체와 값형식 다 저장가능하지만 동일한 자료형만 저장해야함. 선언시점에 저장할 자료형을 미리 정의해야함
 * Foundation Collection은 값을 변경할 수 있는 클래스가 mutable이란 키워드가 붙어서 정의되어있고 swift Collection은 var로 선언하면 된다.
 
 ## Array #1
 배열의 특징을 공부하고 기초적인 조작 방법에 대해 공부합니다.

 배열의 일반적인 특징
 배열 리터럴과 배열 자료형
 요소의 수 확인
 서브스크립트 문법

 */

// 배열 리터럴을 이용한 선언
let num = [1, 2, 3]
//let emptyArray = []

let emptyArray: [Int] = []

let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()

let zeroArray = [Int](repeating: 0, count: 10)

/*:
 
## Inspecting an Array
 
 */

num.count == 0
num.isEmpty


/*:
 
 ## Accessing Elements
 
 */

let fruits = ["Apple", "Banana", "Melon"]
fruits[0]

fruits[0...2]

fruits[fruits.startIndex]

//fruits[fruits.endIndex]

fruits[fruits.index(before: fruits.endIndex)]

// 없으면 nil 리턴
fruits.first

emptyArray.first

/*:
 
 ## Array #2
 배열에 새로운 요소를 추가하고 삭제하는 방법을 공부합니다.

 배열 마지막에 새로운 요소 추가
 특정 위치에 새로운 요소 추가
 특정 범위 교체
 요소 삭제
 범위 삭제
 
 */

var alphabet = ["A", "B", "C"]
alphabet.append("E")
//alphabet.append(1)

alphabet.append(contentsOf: ["F","G"])

alphabet.insert("D", at: 3)
alphabet.insert(contentsOf: ["a","b","c"], at: 0)

alphabet[0...2] = ["x", "y", "z"]

alphabet.replaceSubrange(0...2, with: ["a","b","c"])
alphabet

// 앞의 세개를 삭제하고 하나의 요소 추가
alphabet[0...2] = ["z"]
alphabet

/*:
 
 ## Removing Elements
 
 */

alphabet = ["A", "B", "C", "D", "E", "F", "G"]

alphabet.remove(at: 2)


alphabet.removeFirst()

// 앞에 두개의 요소를 삭제함
alphabet.removeFirst(2)
alphabet.removeAll()

// error 배열이 비어있는지 확인
//alphabet.removeFirst()

// 리턴형이 옵셔널이기에 빈배열인 경우 nil 리턴함
alphabet.popLast()

alphabet = ["A", "B", "C"]
alphabet.popLast()

alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet.removeSubrange(0...2)

/*:
 
 ## Array #3
 배열을 비교하고, 원하는 요소를 검색하고, 요소를 원하는 순서로 정렬하는 방법에 대해 공부합니다.

 배열 비교
 요소 검색
 첫 번째 인덱스 검색
 첫 번째 요소 검색
 배열 정렬과 역순 정렬
 특정 위치의 요소 교체
 랜덤 섞기
 
 
 
 */

/*:
 
 ## Comparing Arrays
 
 */

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

// equal to method, not equal to method
a == b
a != b

a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame
}

/*:
 
 ## Finding Elements
 
 */

let nums = [1,2,3,1,4,5,2,6,7,5,0]
nums.contains(1)
nums.contains(8)

nums.contains { (n) -> Bool in
    return n % 2 == 0
}

nums.first { (n) -> Bool in
    return n % 2 == 0
}

nums.firstIndex { (n) -> Bool in
    return n % 2 == 0
}

nums.firstIndex(of: 1)

nums.lastIndex(of: 1)


/*:
 
 ## Sorting on Array
 
 */

//  원본은 냅두고 정렬된 결과를 리턴함
nums.sorted()
nums

nums.sorted { (a, b) -> Bool in
    return a > b
}

nums.sorted().reversed()
[Int](nums.sorted().reversed())

var mutableNums = nums

mutableNums.sort()

mutableNums.reverse()

// 요소의 순서  교체
mutableNums.swapAt(0, 1)


// shuffle
mutableNums.shuffle()


/*:
 
 Dictionary #1
 딕셔너리의 특징을 공부하고 기초적인 사용법에 대해 공부합니다.

 딕셔너리의 특징
 딕셔너리 리터럴
 딕셔너리 자료형
 딕셔너리 생성
 요소의 수 확인
 서브스크립트 문법

 
 ## Dictionary Literal
 
```
 [key: value, key: value, ...]
 ```
 
 ## Dictionary Type
 
```
 Dictionary<K,V>
 [K:V]
 ```
 
 
 */

var dict = ["A": "Apple", "B": "Banana"]

// : 이 포함되어있어야 dictionary 를 생성할 수 있다.
dict = [:]

let dict1: Dictionary<String, Int>
let dict2: [String : Int]

let words = ["A" : "Apple", "B" : "Banana", "C" : "City"]
let emptyDict : [String: String] = [:]
let emptyDict1 = [String: String]()
let emptyDict2 = Dictionary<String, Int>()


/*:
 
 ## Inspecting a Dictionary
 
 */

words.count
words.isEmpty


/*:
 
 ## Accessing Keys and Values

 */

words["A"]
words["Apple"]

let ca = words["E"]
let cb = words["E", default: "Empty"]

for k in words.keys.sorted() {
    print(k)
}

for v in words.values {
    print(v)
}

let keys = Array(words.keys)

/*:
 
 ## Dictionary #2
 새로운 요소를 추가하고 삭제하는 방법을 공부합니다.

 새로운 요소 추가
 개별 요소 삭제
 전체 요소 삭제
 
 */

var words2 = [String : String]()

words2["A"] = "Appllle"
words2["B"] = "Appllle"
words2.count
words2["B"] = "Ball"

// Upsert  = update + insert
words2.updateValue("City", forKey: "C")

words2


/*:
 
 ## Removing Keys and Values
 
 */

words2["B"] = nil
words2.removeValue(forKey: "B")

words2
words2.removeAll()


/*:
 
 ## Dictionary #3

 
 딕셔너리를 비교하고 검색하는 방법을 공부합니다.
 
 딕셔너리 비교
 요소 검색

 
 */


let words3 = ["A" : "Apple", "B" : "Banana", "C" : "City"]
let words4 = ["A" : "Apple", "c" : "City", "B" : "Banana"]

words3 == words4
words3 != words4

// dictionary는 정렬후 비교해야한다.
words3.elementsEqual(words4) { (lhs, rhs) -> Bool in
    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame &&
        lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
}

let aKeys = words3.keys.sorted()
let bKeys = words4.keys.sorted()

aKeys.elementsEqual(bKeys) { (lrs, rhs) -> Bool in
    guard lrs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    
    guard let lv = words3[lrs], let rv = words4[rhs], lv.caseInsensitiveCompare(rv) == .orderedSame else {
        return false
    }
    
    return true
}


/*:
 
 ## Finding Elements
 
 */

words2 = ["A" : "Apple", "B" : "Banana", "C" : "City"]

// 검색할 땐 클로저가 필요함
let cc: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("i")
}

words.contains(where: cc)

// return type : (key: String, value: String)? 옵셔널 튜플
let r = words.first(where: cc)
r?.key
r?.value


/*:
 
 ## Set #1
 집합 연산을 구현한 셋에 대해 공부합니다.
 
 * 검색속도가 중요한 경우 사용. 중복되지 않고, 정렬되지 않고 인덱스도 없다. 동일한 형식만 저장한다.

 셋의 특징
 셋 자료형
 요소의 수 확인
 요소 검색
 요소 추가
 요소 삭제
 해싱
 
 ```
 Set<T>
 ```
 
 */

let set: Set<Int> = [1,2,3,4,5,3,3]
let set2: Set = [1,2,3,4,5,3,3]

set.count
set.isEmpty

// 해싱알고리즘으로 배열보다는 빨리 찾아준다.
set.contains(1)

var words10 = Set<String>()
var insertResult = words10.insert("swift")

insertResult.inserted
insertResult.memberAfterInsert

// 중복으로 입력할 수 없다.
insertResult = words10.insert("swift")
insertResult.inserted // false
insertResult.memberAfterInsert

// 문자열이 리턴되면 update
var updateResult = words10.update(with: "swift")
updateResult

// nil이 리턴되면 insert
updateResult = words10.update(with: "orange")
updateResult

var value = "Swift"
value.hashValue

updateResult = words10.update(with: value)
updateResult

value = "Hello"
value.hashValue

updateResult = words10.update(with: value)
updateResult


struct SampleData: Hashable {
    var hashValue: Int = 123
    var data: String
    
    init(_ data: String) {
        self.data = data
    }
    
    static func ==(lhs: SampleData, rhs: SampleData) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

var sampleSet = Set<SampleData>()

var data = SampleData("Swift")
data.hashValue

var rr = sampleSet.insert(data)
rr.inserted
rr.memberAfterInsert
sampleSet

data.data = "Hello"
data.hashValue


rr = sampleSet.insert(data)
rr.inserted
rr.memberAfterInsert
sampleSet

sampleSet.update(with: data)

/*:
 
 ## Set #2
 셋에서 집합 비교와 집합 연산을 구현합니다.

 셋 비교
 합집합
 교집합
 여집합
 차집합
 
 */

var ae: Set = [1,2,3,4,5,6,7,8,9]
var be: Set = [1,3,5,7,9]
var ce: Set = [2,4,6,8,10]
var de: Set = [1,7, 5, 9, 3]

ae == be
ae != be

be == de

// 순서대로 비교하기 때문에 리턴결과는 실행할 때마다 달라진다.
be.elementsEqual(de)

// 부분집합, 진부분집합
ae.isSubset(of: ae) // true
ae.isStrictSubset(of: ae) // false

/*:

## Iterating Collections
 컬렉션에 포함된 모든 요소를 대상으로 원하는 작업을 실행하는 방법에 대해 공부합니다.

 */


let arr = [1,2,3]
for num in arr {
    print(num)
}

let set111: Set = [1,2,3]
// 정렬되지 않은 컬렉션
for num in set111 {
    print(num)
}

let dict111 = ["A": "Apple", "B": "Banananana", "C": "C#"]
for (key, value) in dict {
    print(key, value)
}

/*:
 
 ## forEach
 * 클로저를 파라미터를 받는다.
 */

arr.forEach { (num) in
    print(num)
}

set111.forEach { (num) in
    print(num)
}

dict111.forEach { (elem) in
    print(elem.key, elem.value)
}

func withForIn() {
    print(#function)
    let arr  = [1,2,3]
    for num in arr {
        print(num)
        return
    }
}

func withForeach() {
    print(#function)
    let arr  = [1,2,3]
    arr.forEach { (num) in
        // break continue를 사용할 수 없다
        print(num)
        return
    }
}

withForIn()
withForeach()

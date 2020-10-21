import UIKit

/*:
 
 # Collection Types

 * Swift Collection과 Foundation Collection 두종류이다.
 
 * Foundation Collection은 Value Type이 아니고 Reference Type으로 Collection을 정의해야하는 경우 사용함. 다른 자료형도 같이 저장가능하다.
 
 * Foundation Collection : NSArray, NSDictionary, NSSet
 
 * Swift Collection : Array, Dictionary, Set
 
 * Swift Collection는  가변 Collection을 var로 선언하면 된다. 변수 선언과 같은 방식 Foundation Collection은 NSMutableArray, NSMutableDictionary, NSMutableSet 으로 사용해야한다.
 
 * Copy-on-write : Swift Collection은 구조체로 선언된 Value Type이다. collection이 변경되지 않으면 동일한 데이터를 사용한다. 최적화는 컴파일러가 알아서 처리한다.
 
 
 ##  Array
 
 * Single type. 동일한 자료만 저장해야한다.
 * 0-based Index. 0부터 시작.
 * 배열의 중간 요소를 변경하면 성능상의 overhead가 발생한다.
 
```
 // Array Type
 Array[T]
 
 [T]
 
 ```
 
 */

let nums = [1,2,3]
nums

// 배열 형식 선언하기
let strArray: Array<String>
let strArray2: [String]

/*:
 
 ## Array Basics
 
 */

let nums2 = [1,2,3]
//let nums3 = [] // error: 타입을 추론할 요소가 없음


let nums4: [Int] = []

let nums5  = Array<Int>()
let nums6 = [Int]()

let zeroArray = [Int](repeating: 0, count: 8)

/*:
 
 ## Inspecting an Array
 
 */

nums.count
nums.count == 0

nums.isEmpty

nums4.isEmpty



/*:
 
 ## Accessing an Array
 
 */

let fruits = ["Apple", "Banana", "Melon"]

// subscript로 배열의 요소에 접근
fruits[0]


// subscript로 범위 전달. 속성으로 전달되는 인덱스를 사용하기
fruits[0...1]


// fruits.endIndex 사용할 수 없음. error  :error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.
//fruits[fruits.startIndex...fruits.endIndex]

fruits[fruits.index(before: fruits.endIndex)]


// 배열의 속성으로 요소에 접근
fruits.first
fruits.last

nums4.first // nil

//nums4[0] // error


var alphabet = ["A", "B", "C"]
alphabet.append("D") // 동일한 자료형만 입력해야함

alphabet.append(contentsOf: ["F","G"])
alphabet.insert("E", at: 4)

alphabet.insert(contentsOf: ["b","bb"], at: 0)


// 배열의 여러 요소의 값을 대체하는 방법 1: subscript를 사용하여 변경
alphabet[0...2] = ["x","u","z"]
alphabet

// 배열의 여러 요소의 값을 대체하는 방법 2 : 배열의 replaceSubrange 메서드 사용
alphabet.replaceSubrange(0...2, with: ["a,","b","c"])


alphabet[0...2] = ["z"]
alphabet

alphabet[0..<1] = []
alphabet

/*:
 
 ## Removing Elements
 
 */

alphabet =  ["A", "B", "C", "D", "E", "F", "G"]

alphabet.remove(at: 2)

// return : "A"
alphabet.removeFirst()

// return : void  처음 배열의 두 요소 지움
alphabet.removeFirst(2)
alphabet

alphabet.removeAll()
alphabet.popLast() // 값이 없음 nil

alphabet =  ["A", "B", "C", "D", "E", "F", "G"]

// 마지막 요소 삭제후 삭제된 요소 반환
alphabet.popLast()

// 메서드를 이용하여 삭제 : 세개 요소 삭제
alphabet.removeSubrange(0...2)

// subscript로 삭제
alphabet[0...2] = []



/*:
 
 ## Comparing Arrays

 
 */

let a = ["A", "B", "C"]
let b = ["a", "b", "c"]

// 저장순서와 값, 대소문자 비교.
a == b
a != b

a.elementsEqual(b)

a.elementsEqual(b) { (lhs, rhs) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedSame
}

/*:
 
 ## Finding Elements
 
 */

let numss = [1,2,3,4,5,6,7,1, 0]

numss.contains(1)
numss.contains(8)

numss.contains { (n) -> Bool in
    return n % 2 == 0
}

numss.first { (n) -> Bool in
    return n % 2 == 0
}

numss.firstIndex { (n) -> Bool in
    return n % 2 == 0
}

nums.firstIndex(of: 1)

nums.lastIndex(of: 1)

/*:

 ## Sorting on Array

 */

// 원본배열의 순서는 안바꾸고 리턴되는 배열의 값만 정렬해줌
numss.sorted()

numss

numss.sorted { (a, b) -> Bool in
    return a > b
}

// ReversedCollection<Array<Int>>
nums.sorted().reversed()

// [7, 6, 5, 4, 3, 2, 1, 1, 0] 배열로 리턴해줌
[Int](numss.sorted().reversed())


// 가변배열
var mutableNumss = numss
mutableNumss.sort()
mutableNumss.reverse()

mutableNumss

// 요소의 순서를 바꿔준다.
mutableNumss.swapAt(0, 1)

//배열을 직접 변경
mutableNumss.shuffle()

// _ed 가 포함된 메서드는 새로운 배열을 반환함
mutableNumss.shuffled()


var list = [9, 5, 4, 2, 7, 1, 0, 3, 6, 8]

list.sort()
list.reverse()
list
let ba = list.sorted()

print(list == [9, 8, 7, 6, 5, 4, 3, 2, 1, 0] && list.reversed() == ba)


let list2 = ["iPad Pro", "iPhone Xs", "MacBook", "iPhone Xs MAX", "iPad", "MacBook Air", "iPhone Xr", "iPad Mini", "iPhone 8", "MacBook Pro", "iPhone 8 Plus", "iMac", "AirPods", "iMac Pro", "Magic Mouse 2", "Mac Pro", "Magic Keyboard", "Mac mini"]

var filtered = list2.filter { $0.contains("iPhone") }

filtered.sort()
print(filtered == ["iPhone 8", "iPhone 8 Plus", "iPhone Xr", "iPhone Xs", "iPhone Xs MAX"])

/*:
 
 ## Dictionary
 
```
 [key: value, key: value, ...]
 ```
 
 * Dictionary Type

 ```
 Dictionary<K,V>
 [K:V]
 ```
 */

var dict = ["A": "Apple", "B": "Banana"]

// [:]
//dict = [:]

let dict1: Dictionary<String, Int>
let dict2: [String: Int]

// 최초 선언시 type을 명시적으로 선언해야함
let emptyDict: [String : String] = [:]
let emptyDict2 = [String : String]()

/*:
 
 ## Inspecting a Dictionary
 
 */

dict.count
dict.isEmpty


/*:
 
 ## Accessing Keys and Values
 
 */

dict["A"] // nil

let aaa = dict["E"]  //
let bbb = dict["E", default: "Empty"] // 키에 매핑된 값이 없으면 디폴트값으로 저장

for k in dict.keys.sorted() {
    print(k)
}

for v in dict.values {
    print(v)
}

let keys = Array(dict.keys)
let values = Array(dict.values)

/*:
 
 ## Adding Keys and Values

 */

var words = [String: String]()

words["A"] = "Apple"
words["B"] = "Bananananana"
words.count
words

words["B"] = "Ball"
words.count
words

// 기존 값이 없으면 insert함. Insert + Update = Upsert
words.updateValue("City", forKey: "C")

words.updateValue("Circle", forKey: "C")

words

/*:
 
 ## Removing Keys and Values
 
 */

//B 자체가 사라짐. 존재하지 않는 키를 삭제하는 경우에는 에러를 발생하지 않음
words["B"] = nil

words

// 삭제된 값을 리턴한다.
words.removeValue(forKey: "A")
// 에러 발생하지 않음. nil 리턴
words.removeValue(forKey: "A")

words.removeAll()

/*:
 
 ## Comparing Dictionaries
 
 */

dict = ["A": "Apple", "B": "Banana", "C": "City"]
let dict23 = ["A": "Apple", "C": "City", "B": "Banana"]

dict == dict23
dict != dict23

dict.elementsEqual(dict23) { (lhs, rhs) -> Bool in
    print(lhs.key, rhs.key)
    return lhs.key.caseInsensitiveCompare(rhs.key) == .orderedSame &&
        lhs.value.caseInsensitiveCompare(rhs.value) == .orderedSame
}

let aKeys = dict.keys.sorted()
let bKeys = dict23.keys.sorted()

aKeys.elementsEqual(bKeys) { (lhs, rhs) -> Bool in
    guard lhs.caseInsensitiveCompare(rhs) == .orderedSame else {
        return false
    }
    
    guard let lv = dict[lhs], let rv = dict23[rhs], lv.caseInsensitiveCompare(rv) == .orderedSame else {
        return false
    }
    
    return true

}

/*:
 
 ## Finding Elements
 
 */

dict = ["A": "Apple", "B": "Banana", "C": "City"]

let c: ((String, String)) -> Bool = {
    $0.0 == "B" || $0.1.contains("i")
}

//  클로저를 파라미터로 받는다.
dict.contains(where: c)

// 검색된 첫번째값. dictionary의 정렬순서가 없어서 검색될때마다 새로운 값이 반환될 수 있다. tuple optional로 결과값 반환
let r = dict.first(where: c)
r?.key
r?.value

dict.filter(c)


/*:
 
 ## Set
 * hashing으로 검색속도가 빠르다.
 * 중복된 값을 저장하지 않는다.
 
```
    // Set type
    Set<T>
 ```
 
 */

// 자료형 생략가능
let set: Set<Int> = [1,2,3,4,5, 5]
set.count

/*:
 
 ### Inspecting a Set
 
 
 */

set.count
set.isEmpty

/*:
 
 ### Testing for Membership
 
 */

set.contains(1)

/*:
 
 ### Adding and Removing Elements
 
 */

var words3 = Set<String>()

var insertResult = words3.insert("Swift")
insertResult.inserted
insertResult.memberAfterInsert

// Upsert 형식으로 저장
var updateResult = words3.update(with: "Apple")
updateResult

var value = "Swift"
value.hashValue


updateResult = words3.update(with: value)
updateResult

value = "Hello"
value.hashValue


updateResult = words3.update(with: value)
updateResult

struct SampleData: Hashable {
    var hashValue: Int = 123
    var data: String
    
    init(_ data: String) {
        self.data = data
    }
    
    static func == (lhs: SampleData, rhs: SampleData) -> Bool {
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


sampleSet.update(with: data)
sampleSet


// 없는 값을 삭제하면 nil을 리턴.
words3.remove("Swift")

/*:
 
 ### Comparing Sets
 
 */

var aa: Set = [1,2,3,4,5,6,7,8,9]
var bb: Set = [1,3,5,7,9]
var cc: Set = [2,4,6,8,10]
var dd: Set = [1,7,5,9, 3]

aa == bb
aa != bb
bb == dd

// 정렬되지 않은 컬렉션 타입은 실행할 때마다 다른 결과를 나타낸다.
// set을 배열로 변환해서 정렬후 비교해야한다.
bb.elementsEqual(dd)

// set은 집합에 특화되어 있다.

// 부분집합. Combining Sets
aa.isSuperset(of: aa)
aa.isStrictSubset(of: aa)

// 교집합
aa.isDisjoint(with: bb) // false
bb.isDisjoint(with: cc) // true

/*:
 
 ## Combining Sets
 
 */



 aa = [1,2,3,4,5,6,7,8,9]
 bb = [1,3,5,7,9]
 cc = [2,4,6,8,10]
 dd = [1,7,5,9, 3]

// 합집합
var result = bb.union(cc)
result = bb.union(aa)

// form으로 시작하는 메서드는 원본의 값을 변경함
//bb.formUnion(c)

// 교집합
result = aa.intersection(bb)

// aa 의 값을 변경함
aa.formIntersection(bb)

// 여집합
result = aa.symmetricDifference(bb)
aa.formSymmetricDifference(bb)



aa = [1,2,3,4,5,6,7,8,9]
bb = [1,3,5,7,9]
cc = [2,4,6,8,10]
dd = [1,7,5,9, 3]

// 차집합
result = aa.subtracting(bb)

// aa의 값을 직접 바꿈
aa.subtract(bb)



var aaaa: Set = [16, 8, 3, 13, 4, 2, 7, 14, 4, 17, 6, 7, 4, 26, 3, 19, 2, 15, 19, 25]
var bbbb: Set = [11, 9, 20, 22, 30, 6, 14, 20, 20, 19, 7, 12, 2, 12, 19, 4, 13, 11, 24, 20]

// 여기에 합집합을 저장해 주세요.
let unionSet = aaaa.union(bbbb)

// 여기에 교집합을 저장해 주세요.
let intersectionSet = aaaa.intersection(bbbb)

// 여기에 차집합을 저장해 주세요.
let subtractingSet = aaaa.subtracting(bbbb)

print(unionSet.count, intersectionSet.count, subtractingSet.count)


/*:
 
 ## Iterating Collections
 
 ### for-in
 
```
    for element in collection {
        statements
    }
 ```
 
 */

let aarr = [1,2,3]

for num in aarr {
    print(num)
}

let aaset: Set = [1,2,3]
// 출력결과가 실행때마다 달라진다. (정렬순서가 없음)
for num in aaset {
    print(num)
}

let dddict = ["A": "Apple", "B" : "Bpple"]
// 출력결과가 실행때마다 달라진다. (정렬순서가 없음)
for (key, value) in dddict {
    print(key, value)
}


/*:
 
 ### forEach
 
 * 함수형 패러다임
 * 파라미터를 클로져 타입으로 받는다.
 
 */

let arrr = [1,2,3]
arrr.forEach { (num) in
    print(num)
}


let sett: Set = [1, 2, 3]
sett.forEach { (num) in
    print(num)
}

// dictionary형은 클로저내에서 tuple로 파라미터가 전달됨.
let dicctt = ["A": "Apple", "B" : "Bpple"]
dicctt.forEach { (elem) in
    print(elem.key, elem.value)
}


func withForIn() {
    print(#function)
    let arr = [1,2,3]
    for num in arr {
        print(num)
        return
    }
}


func withForeach() {
    print(#function)
    let arr = [1,2,3]
    arr.forEach { (num) in
        print(num)
        // for문과 같이 한번만 출력하고 종료하는게 아님. 
        return
    }
}

withForIn()

withForeach()

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

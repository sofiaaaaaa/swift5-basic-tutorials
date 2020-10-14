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

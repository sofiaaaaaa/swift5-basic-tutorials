import UIKit

/*:
 
 # Array
 
 ## Adding Elements
 
 */

var alphabet = ["A", "B", "C"]
alphabet.append("E")
alphabet.append(contentsOf: ["F","G"])
alphabet.insert("D", at: 3)
alphabet.insert(contentsOf: ["a","b","c"], at: 0)

// subscript 문법
alphabet[0...2] = ["x", "y", "z"]
// ["x", "y", "z", "A", "B", "C", "D", "E", "F", "G"]
alphabet

// ["a", "b", "c", "A", "B", "C", "D", "E", "F", "G"]
alphabet.replaceSubrange(0...2, with: ["a","b","c"])

// 처음 세개의 요소를 하나의 요소로 바꿀 때
alphabet[0...2] = ["z"]
// ["z", "A", "B", "C", "D", "E", "F", "G"]
alphabet

// 빈배열로 slice
alphabet[0..<1] = []
alphabet

/*:
    ## Removing Elements
 */

alphabet = ["A", "B", "C", "D", "E", "F", "G"]

alphabet.remove(at: 2)

//error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
//alphabet.remove(at: 222)

alphabet.removeFirst()
//["B", "D", "E", "F", "G"]
alphabet

//["E", "F", "G"] 파라미터로 전달된 인덱스까지 삭제.
alphabet.removeFirst(2)
alphabet

//alphabet.removeAll()

//alphabet.removeFirst()

alphabet.popLast()

alphabet = ["A", "B", "C", "D", "E", "F", "G"]
alphabet

alphabet.removeSubrange(0...2)
alphabet[0...2] = []



let weather = "맑음"
let temperature = 10.23456

// 날씨는 '맑음', 온도는 10.2도 입니다.
let weatherStr = String(format: "날씨는 '%@', 온도는 %.1f도 입니다." , weather , temperature )

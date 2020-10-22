import UIKit

/*:
 
 # Literal, Data Types

 * Int는 900경의 숫자를 +-로 저장할 수 있다.
 * Built-in Data Type과 Custom Data Type이 있다.

 ## Memory
 1Byte = 8bit
 MSB -> 8bit의 1번째 첫번째 bit
 LSB -> 8bit의 8번째 마지막 bit
 
 * 첫번째 bit에는 자료형에 따라 +/- 여부를 저장한다. sign bit
 
 
 *  2's Complement   2의 보수.
  (10진수) 22 ==>(2진수변환)==> 00010110 ==>(Bitwise Not)==> 11101001 ==>(+1)==> 11101010 ==>(10진수)==> -22

  * CPU 주소레지스터의 크기가 32bit.  42억개의 메모리 주소를 저장. 4GB 메모리
  * CPU 64bit 주소레지스터가 접근할 수 있는 메모리주소의 개수는 1800경개.  16EB 메모리 저장
 
 */



/*:
 
 ## String
 문자열. Literal 이라고 표현한다.
 
 ## Character
 문자

 */

let str = "1"
type(of: str) // String.Type


let ch: Character = "1"
type(of: ch) // Character.Type

let empthCh: Character = " "


/*:
 
 ## Type Inference
 
 * 형식 추론
 
 */

// 형식을 선언하지 않으면 값을 토대로 추론한다.
let num = 123
// Int.Type
type(of: num)


let temp = 11.2
// Double.Type
type(of: temp)

let a = true
// Bool.Type
type(of:a)


/*:
 
 ## Type Annotation

 ### Syntax
 
```
let name: Type = value
var name: Type = value
 ```
 
 * 자료형을 직접 선언하지 않으면 내가 원하는 타입으로 저장되지 않을 수 있다. 형식추론은 초기값을 기반으로 추론하기 때문에 컴파일 시간이 길어질 수 있다.
 
 */

let num4: Int = 123

// 선언만 따로 할 수 있음
let value5: Double

/*:
 
 ## Type Safety
 * 계산이나 다른 변수의 값 복사시에 자료형이 다르면 에러가 발생한다.
 * 컴파일 타임에 타입 에러체크가 가능하여 안전성 보장.
 */

let a9 = 7
// error:  Cannot convert value of type 'Bool' to specified type 'Int8'
//let b9: Int8 = a
//let b9: Int64 = a

// Int.Type
let rate = 3.147592
let amt = 1_000_000
type(of: amt)

let result = rate * Double(amt)

Int(rate * Double(amt))
Int(rate) * amt


/*:
 
 ## Type Conversion
 * Type Conversion은 메모리에 저장된 값을 다른 형식으로 바꿔서 새로운 값으로 생성한다.
 
 ### Syntax
 
 ```
    Type(value)
 ```
 
 * 큰 자료형에서 작은자료형으로 컨버전할 때는 에러 발생하며, string형을 int형으로 바꿀 경우 숫자가 아니면  nil이 리턴될 수 있다.
 
 */

let number = 123
let double = 4.56

Double(number) + double
number + Int(double)

// type conversion중..
let c = Int8(number)

let d = Int.max
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
//let e = Int8(d)

let strrr = "0"
Int(strrr)

/*:
 
 ## Type Alias
 
 ### Syntax
 
 ```
 typealias NewName = TypeName
 
 ```
 
 */

typealias Coordinate = Double


let lat: Coordinate = 12.34
let lon: Coordinate = 56.78



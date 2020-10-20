import UIKit

/*:
 
 # Memory Basics
 
 메모리에 대한 기초적인 내용을 공부합니다.

 비트와 바이트
 데이터 저장 방식
 메모리 주소
 메모리 공간 분류(스택과 힙)

 * heap에는 동적으로 데이터가 생성된다. 더이상 사용하지 않는 데이터가 제거되지 않으면 memory leak 누수현상이 발생한다.
 
 * value type은 actual data가 stack에 저장되고 reference type은 heap에 저장되며, stack에는 heap address가 저장된다.
 
 * 운영체제는 프로그램이 실행될 때마다 메모리공간을 4종류로 구분하여 할당한다.
    
 1. code: 기계어로 번역된 프로그램코드
 2. Data: 정적변수, 전역변수 (프로그램생성때 생기고, 종료때 제거됨)
 3. Heap: 지역변수, 파라미터, return값. 동적으로 할당된 데이터가 저장된다. 생성시점과 제거시점이 정해지지 않아서 코드를 통해서 제거해야한다.
 4. Stack: 함수호출과 밀접한 연관이 있다. 함수호출할 때마다 Stack Frame이라고 함수에서 사용하는 모든 메모리공간이 생긴다. 함수 종료시 제거된다. LIFO
 
 */

/*:
 
 ## Value Type vs Reference Type
 값 형식과 참조 형식이 메모리에 저장되는 방식에 대해 공부합니다.

* Value Type: Structure, Enumeration, Tuple
* Reference Type: Class, Closure
 
 */

struct SizeValue {
    var width = 0.0
    var height = 0.0
}

var value = SizeValue()

//새로운 복사본이 생성된다. copy-on-write 최적화 실제로는 값을 변경해야 생성된다.
var value2 = value
value2.width = 1.0
value2.height = 1.0

value
value2

class SizeObject {
    var width = 0.0
    var height = 0.0
}

var object = SizeObject()
// stack의 heap 참조 주소만 복사된다.
var object2 = object

object2.width = 1.0

// let키워드는 상수가 가르키는 stack을 값을 바꿀 수 없게 한다.
let v = SizeValue()

// heap에 있는 값, 인스턴스의 속성을 바꿀 수 있다.
let o = SizeObject()
o.width = 1.2
o.height = 2.0

/*:
 
 ## ARC(Automatic Reference Counting)
 Swift의 메모리 관리 모델인 ARC에 대해 공부합니다.

 메모리 관리 모델
 소유 정책
 참조 카운트
 강한 참조

 * 클래스 인스턴스
 * Apple이 제공하는 개발환경이 cocoa이고 여기서 제공하는 관리 모델이다.
 
 * Object-C : MRC, ARC
 * Swift : ARC만 제공함
 
 * Ownership Policy : 인스턴스는 하나이상의 소유자가 있어야 메모리에 유지된다.
 * Reference Count : 인스턴스 소유자의 총 갯수를 의미하며 0이 되면 메모리에서 제거된다.  인스턴스 제거 시점을 관리하기 위해 사용함

 * Reference Count  retain (+1) <-> release (-1)
 
 ### ARC 세가지 참조
 * Strong Reference
 * Weak Reference
 * Unowned Reference
 
 */

// Strong Reference
class Person {
    var name = "John Re"
    
    deinit {
//        print("person deinit3")
    }
    
}

var person1: Person?
var person2: Person?
var person3: Person?

// 참조 count = 3
person1 = Person()
person2 = person1
person3 = person1

// 소유권 포기. 강한 참조가 제거된다, 참조count가 감소함. 참조 count = 1
person1 = nil
person2 = nil

// 참조count  = 0  person deinit 출력됨
person3 = nil

/*:
 
 ## Strong Reference Cycle
 강한 참조 사이클이 발생하는 원인과 해결 방법에 대해 공부합니다.

 강한 참조 사이클
 약한(weak) 참조
 비소유(unowned) 참조
 
 */

/*
class Person2 {
    var name = "John Doe"
    var car: Car?
    
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    var lessee: Person2?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinit")
    }
}

var person: Person2? = Person2() // person reference count 1
var rentedCar: Car? = Car(model: "piat") // car reference count 1

person?.car = rentedCar // car reference count 2
rentedCar?.lessee = person // person reference count 2

person = nil // person reference count 1 ==> 0으로 처리할 수가 없다.
rentedCar = nil // car reference count 1

*/
/*:
 
 ## Weak Reference
 // instance가 먼저 사라지는 경우를 고려해야함..
 // 소유주기가 짧은 주기를 가진 인스턴스를 참조할 때 사용
 // 참조하고 있는 인스턴스가 해제되면 자동으로 nil로 초기화된다.
 
 ```
 weak var name: Type?
 ```
 
 */

/*
class Person2 {
    var name = "John Doe"
    var car: Car?
    
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    weak var lessee: Person2?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinitttt")
    }
}

var person: Person2? = Person2() // person reference count 1
var rentedCar: Car? = Car(model: "piat")

person?.car = rentedCar // car reference count 2
rentedCar?.lessee = person

person = nil
rentedCar = nil
*/

/*:
 
 ## Unowned Reference
// 약한 참조와 비슷한 방식으로 강한참조를 해결. 속성을 non-option 형으로 선언
 // 인스턴스의 생명주기가 같거나 더 긴 경우 사용
 //  참조하고 있는 인스턴스가 해제되어도 nil로 초기화되지 않는다. 해제된 인스턴스에 접근할 경우 런타임에러 발생
 
 ```
 unowned var name: Type
 ```
 
 */


class Person2 {
    var name = "John Doe"
    var car: Car?
    
    deinit {
        print("person deinit")
    }
}

class Car {
    var model: String
    unowned var lessee: Person2?
    
    init(model: String, lessee: Person2) {
        self.model = model
        self.lessee = lessee
    }
    
    deinit {
        print("car deinitttt")
    }
}

// 두 인스턴스가 서로 참조하게 됨
var person: Person2? = Person2()
var rentedCar: Car? = Car(model:"piat", lessee: person!)

person?.car = rentedCar

// unowned 키워드를 붙이면 deinit() 메모리해제시 호출되는 메서드가 실행된다. 
person = nil
rentedCar = nil


/*:
 #  Closure Capture List
 Closure Capture List를 통해 클로저에서 발생하는 강한 참조 사이클을 해결하는 방법에 대해 공부합니다.
 
    * 클로저가 인스턴스를 캡처하고, 인스턴스가 클로저를 강한 참조로 저장하고 있다면 인스턴스가 정상적으로 해지되지 않는다.
 
*/

// 강한 참조 Strong Reference 예시 코드

class Car30 {
    var totalDrivingDistance = 0.0
    var totalUsedGas = 0.0
    
    lazy var gasMileage: () -> Double = {
        return self.totalDrivingDistance / self.totalUsedGas
    }
    
    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }
    
    deinit {
        print("car30 deinit")
    }
}

var myCar: Car30? = Car30()
myCar?.drive()

// Strong Reference  발생
myCar?.gasMileage()

// car deinit => gasMileage에서 myCar의 속성을 참조하고 있기 때문에 메모리 해제 deinit이 실행되지 않는다.
myCar = nil


/*:
 ##  Closure Capture List

```
 { [list] (parameters) -> ReturnType in
    Code
 }
 
 {
    [list] in
    code
 }
 
 // Value Type 캡쳐시
 
 { [valueName] in
    code
 }
 
 ```
*/

// Value Type 캡처
var a = 0
var b = 0
// a의 복사본 캡처.
let c = { [a] in print(a, b) }

a = 1
b = 2
c()


 

/*:
 
```
 // Reference Type 캡쳐시
 { [weak instanceName, unowned instanceName] in
    code
 }
 
 ```
*/


class Car50 {
    var totalDrivingDistance = 0.0
    var totalUsedGas = 0.0
    
    // unowned 참조 캡처 - 클로저 대상이 실행되기 전에 해제될 수 있고, 해제된 인스턴스 접근시 Runtime 에러가 날 수 있다. 캡처대상의 생명주기가 클로저와 같거나 길어야 한다. 
    lazy var gasMileage: () -> Double = { [unowned self] in
        return self.totalDrivingDistance / self.totalUsedGas
    }
    
    //  weak 참조 캡처
//    lazy var gasMileage: () -> Double = { [weak self] in
//        // upwrapping해서 참조해야함.
//        guard let strongSelf = self else { return 0.0 }
//        return strongSelf.totalDrivingDistance / strongSelf.totalUsedGas
//    }
    
    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }
    
    deinit {
        print("car50 deinit")
    }
}

var myCar50: Car50? = Car50()
myCar50?.drive()

myCar50?.gasMileage()

myCar50 = nil

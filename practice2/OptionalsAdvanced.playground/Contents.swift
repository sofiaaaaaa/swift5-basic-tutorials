import UIKit

/*:
 
 # Optionals Advanced
 
 ## Nil-Coalescing Operator
 Nil-coalescing 연산자를 활용해서 옵셔널에 값이 저장되어 있지 않을 때 사용할 값을 지정하는 방법에 대해 공부합니다.
 
 ### Syntax
 
 ```
 a ?? b
 OptionalExpression ?? Expression
 ```
 
 * 단락평가 short-circuit Evaluation과 같다. 오른쪽 표현식에는 side effect가 발생하지 않아야한다.
 */

var msg = ""
var input: String? = "Swift"

if let inputName = input {
    msg = "Hello, " + inputName
} else {
    msg = "aaa"
}

print(msg)

var str = "Hello, " + (input != nil ? input! : "Stranger")
print(str)

input = nil
str = "Hello, " + (input ?? "Stranger")
print(str)


/*:
 
 ## Optional Chaining
 하나의 표현식 내에서 다수의 옵셔널 형식 멤버에 접근하는 방법에 대해 공부합니다.
 
 * 옵셔널을 연달아서 호출하기
 * 옵셔널체이닝의 결과는 옵셔널이다. 결과중에 nil이 있으면 다음의 값을 호출하지 않고 nil을 반환한다.
 
 */

struct Contacts {
    var email: [String: String]
    var address: String
    
    func printAddress() {
        print(address ?? "no address")
    }
}

struct Person {
    var name: String
    var contacts: Contacts?
    
    init(name: String, email: String) {
        self.name = name
        contacts = Contacts(email: ["home" : email], address: "Seoul")
    }
    
    func getContacts() -> Contacts? {
        return contacts
    }
    
    
}


var p = Person(name: "James", email: "swift@sw.sw")
let a = p.contacts.address

var optionalP: Person? = Person(name: "James", email: "swift@sw.sw")

// error: Value of optional type 'Person?' must be unwrapped to refer to member 'contacts' of wrapped base type 'Person'
//let b = optionalP.contacts.address
let b = optionalP?.contacts.address


p.getContacts()?.address

let f : (() -> Contacts?)? = p.getContacts

f?()?.address

// ()? void return . void는 nil이 아니다.
let d = p.getContacts()?.printAddress()

if p.getContacts()?.printAddress() != nil {
    print("aaa")
}

// wild card pattern
if let  _ = p.getContacts()?.printAddress()  {
    print("bbb")
}

let e = p.contacts?.email["home"]

p.contacts?.email?["home"]?.count
p.contacts?.address = "Daegu"

/*:
 
 ## Optional Pattern ***
 옵셔널 패턴을 활용해서 옵셔널 매칭 코드를 더욱 효율적으로 작성하는 방법에 대해 공부합니다.

  * Optional은 enum유형이다.
 
   * 코드가 좀더 단순해진다. 
 
 */

let a: Int? = 0

let b: Optional<Int> = 0

if a == nil {
    
}

if a == .none {
    
}

if a == 0 {
    
}

if a == .some(0) {
    
}

if let x = a {
    print(x)
}

if case .some(let x) = a {
    print(x)
}

// a가 nil이면 if블럭이 실행되지 않는다.
if case let x? = a {
    print(x)
}

let list: [Int?] = [0, nil, nil, 3, nil, 5]

for item in list {
    guard let x = item else { continue }
    print(x)
}

// nil 인 경우는 반복 코드를 실행하지 않는다.
for case let x? in list {
    print(x)
}

import UIKit

/*:
 # Optional Chaining
    
    * 옵셔널 체이닝의 결과는 옵셔널이다.
    * 전체 옵셔널 체이닝 중 옵셔널 값이 있으면 옵셔널 값이 된다.
 
    * 옵셔널변수에 ?,! 표시하지 않을 경우 에러 메세지

 Chain the optional using '?' to access member 'contacts' only for non-'nil' base values, Force-unwrap using '!' to abort execution if the optional value contains 'nil'
 
 Value of optional type 'String?' must be unwrapped to refer to member 'count' of wrapped base type 'String'
 
 */

struct Contacts {
    var email: [String: String]?// Dictionary type
    var address: String?
    
    func printAddress() {
        print(address ?? "no address")
    }
}

struct Person {
    var name: String
    var contacts: Contacts?
    
    init(name: String, email: String){
        self.name = name
        contacts = Contacts(email: ["home": email], address: "Seoul")
    }
    
    func getContacts() -> Contacts? {
        return contacts
    }
}


var p = Person(name: "James", email: "swift@example.com")

// Non optional chaining (  p 변수의 contacts 변수의 address 변수)
let a = p.contacts?.address


var optionalP: Person? = Person(name: "James", email: "swift@example.com")


//let b = optionalP.contacts.address
let b = optionalP?.contacts?.address

b



// !보다 ?를 사용해야함
optionalP = nil
let c = optionalP?.contacts?.address


p.contacts?.address?.count

p.getContacts()?.address


// function type
let f: (() -> Contacts?)? = p.getContacts

// Compile error.
// Value of optional type '(() -> Contacts?)?' must be unwrapped to a value of type '() -> Contacts?'
//f()?.address

f?()?.address


let d = p.getContacts()?.printAddress()

// ()?    Optional Void     값을 리턴하지 않은 형식

if d  != nil {
    print("ooo")
}

// binding 성공여부만 체크
if let _ = p.getContacts()?.printAddress() {
    
}

// email과 [사이에 ? 추가
let e = p.contacts?.email?["home"]

// dictionary type의 속성값 리턴시 optional값으로 리턴
p.contacts?.email?["home"]?.count

// 최종속성까지 접근되지 않으면 값을 저장하지 않는다.
optionalP?.contacts?.address = "Daegu"
optionalP?.contacts?.address

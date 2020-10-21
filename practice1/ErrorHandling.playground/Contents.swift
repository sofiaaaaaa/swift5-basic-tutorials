import UIKit

/*:
 
 # Error Handling
 
 Swift의 에러 처리 패턴에 대해 공부합니다.

 Error 프로토콜
 컴파일 타임 에러와 런타임 에러
 throw와 throws
 Throwing function 구현
 오류 처리 패턴
 try 표현식
 
 * 컴파일 타임 에러 : 문법 오류
 * 런타임 에러 : 프로그램이 실행되는 동안 발생함.
 

 ```
 func name(paremeters) throws -> ReturnType {
    statements
 }
 
 init(parameters) throws {
    statements
 }
 
 { (parameters) throws -> ReturnType in
    statements
 }
 
 ```

 */

//enum DataParsingError: Error {
//    case invalidType
//    case invalidField
//    case missingRequiredField(String)
//}
//
//// throwing function
//func parsing(data: [String: Any]) throws {
//    guard let _ = data["name"] else {
//        throw DataParsingError.missingRequiredField("name")
//    }
//
//    guard let _ = data["age"] as? Int else {
//        throw DataParsingError.invalidType
//    }
//}

/*:
 
 ## try Statements
 
 ```
 try expression
 try? expression
 try! expression
 
 ```
 1. do-catch Statements
 2. try Expression + Optional Bining
 3. hand over
 
 */

// nil
//try? parsing(data: [:])



/*:

 ## do-catch Statements

 ```
 
 do {
    try expression
 } catch pattern {
    statements
 } catch pattern where condition {
    statements
 }
 
 ```
 
 * 패턴이 생략된 catch문은 마지막에 위치함.
 
 */



enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

// throwing function
func parsing(data: [String: Any]) throws {
    guard let _ = data["name"] else {
        throw DataParsingError.missingRequiredField("name")
    }
    
    guard let _ = data["age"] as? Int else {
        throw DataParsingError.invalidType
    }
}

do {
    try parsing(data: [:])
} catch DataParsingError.invalidType {
    print("invalid type error")
} catch {
    print("handle error")
}

//func handError() throws {
//
//    // throws가 없거나 모든 에러예외처리를 하지 않으면 error: Errors thrown from here are not handled because the enclosing catch is not exhaustive
//    do {
//        try parsing(data: [:])
//    } catch DataParsingError.invalidType {
//        print("invalid type error")
//    }
//}


func handError() throws {
    do {
        try parsing(data: [:])
    } catch {
        // 패턴이 없는 catch문은 error 라는 키워드 파라미터가 제공된다.
        if let error = error as? DataParsingError {
            switch error {
            case .invalidType:
                print("invalid Type")
            default:
                print("handle error")
            }
        }
    }
}

/*:
 
 ## Optional Try
 전달된 오류를 옵셔널 값으로 처리하는 방법에 대해 공부합니다.

 * optional try
 try? expression : nil 리턴

 * forced try
 try! expression : 실행중지
 
 */

if let _ = try? parsing(data: [:]) {
    print("success")
} else {
    print("fail")
}

do {
    try parsing(data:[:])
    print("success")
} catch {
    print("fail")
}

try? parsing(data: [:])

try! parsing(data: ["name": "eve", "age": 33 ])

// 디바이스에서 에러가 발생시 crash가 발생하며 앱이 종료된다.
//try! parsing(data: [:])

/*:
 
 ## defer Statements
 Scope 종료 시점으로 코드의 실행을 연기하는 방법에 대해 공부합니다.

 defer 문법
 코드 예약 및 실행 순서

 ```
    defer {
        statements
    }
 ```
 
 */

/*
func processFile(path: String) {
    print("1")
    let file = FileHandle(forReadingAtPath:  path)
    
    // Process
    
    // 함수가 종료되는 시점에 실행됨
    defer {
        print("2")
        file?.closeFile()
    }

    if path.hasSuffix(".jpg") {
        print("3")
        return
    }
    
    print("4")
}


// 1 4 2순서로 실행
processFile(path: "file.swift")

// 1 3 2
processFile(path: "file.jpg")

 */

func processFile(path: String) {
    print("1")
    let file = FileHandle(forReadingAtPath:  path)
    
    // Process
    
    // 함수가 종료되는 시점에 실행됨
    defer {
        print("2")
        file?.closeFile()
    }

    if path.hasSuffix(".jpg") {
        print("3")
        return
    }
    
    defer {
        print("5")
    }

    
    print("4")
}


// 1 4 5 2순서로 실행
//processFile(path: "file.swift")

// 1 3 2
//processFile(path: "file.jpg")


func testDefer() {
    defer {
        print("1")
    }
    
    defer {
        print("2")
    }
    
    defer {
        print("3")
    }
}


// 3 2 1
//testDefer()



// 오류 처리에 사용할 수 있도록 형식을 구현해 주세요.
enum LoginError: Error {
   case invalidId
   case invalidPassword
}

// 오류를 던지는 함수로 수정해 주세요.
func login(id: String, password: String) throws {
   guard id == "admin" else {
    throw LoginError.invalidId
   }
   
   guard password == "1234" else {
    throw LoginError.invalidPassword
   }
    
}

// 여기에서 login(id:password:)를 호출하고 오류를 처리해 주세요.
func run()  {
    
    do {
            try login(id: "hacker", password: "1234")
    } catch {
        if let error = error as? LoginError {
            switch error {
            case .invalidId:
                print("Invalid Id")
            case .invalidPassword:
                print("Invalid Password")
            default:
                print("Error")
            }
        }
    }
}

run()

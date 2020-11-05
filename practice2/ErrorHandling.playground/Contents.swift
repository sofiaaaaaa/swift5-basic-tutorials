import UIKit

/*:
 
 # Error Handling
 
 ## Error Handling
 Swift의 에러 처리 패턴에 대해 공부합니다.

 Error 프로토콜
 컴파일 타임 에러와 런타임 에러
 throw와 throws
 Throwing function 구현
 오류 처리 패턴
 try 표현식
 
 ```
 func name(parameters) throws -> ReturnType {
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
//func parsing(data: [String: Any]) throws {
//    guard let _ = data["name"] else {
//        throw DataParsingError.missingRequiredField("name")
//    }
//
//    guard let _ = data["age"] as? Int else {
//        throw DataParsingError.invalidType
//    }
//
//
//}

/*:
 
 ## try statements
 
```
try expression
 try? expression
 try! expression
 
```
 
 1. do-catch statement
 2. try Expression + Opional Bining
 3. hand over
 
 */


// nil
//try? parsing(data: [:])


/*:
 
 ## do-catch Statements
 do-catch 문을 통해 오류를 처리하는 방법에 대해 공부합니다.

 do-catch 문법
 catch 블록 구현 방식
 
 ```
 do {
    try expression
 } catch pattern {
    statements
} catch pattern where condition {
    statements
 }
 ```
 
 */

enum DataParsingError: Error {
    case invalidType
    case invalidField
    case missingRequiredField(String)
}

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
    print("invalid type")
} catch {
    if let error = error as? DataParsingError {
        switch error {
        case .invalidField:
            print("invalid Field")
        default:
            break
        }
    }
    print("handle error")
}

/*:
 
 ## Optional Try
 전달된 오류를 옵셔널 값으로 처리하는 방법에 대해 공부합니다.

 optional try: try? => nil을 리턴한다.
 forced try : try! => runtime error를 발생시킨다.

 */



if let _  = try? parsing(data: [:]) {
    print("success")
} else {
    print("fail")
}

do {
    try parsing(data: [:])
    print("success")
} catch {
    print("fail")
}

try? parsing(data: [:])

// Fatal error: 'try!' expression unexpectedly raised an error: __lldb_expr_25.DataParsingError.missingRequiredField("name"): file __lldb_expr_31/ErrorHandling.playground, line 153
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

func processFile(path: String) {
    print("1")

    let file = FileHandle(forReadingAtPath: path)
        
    // 함수가 종료되는 시점에 실행된다.
    defer {
        file?.closeFile()
        print("2")
    }
    
    if path.hasSuffix(".jpg") {
        print("3")
        return
    }
    
    print("4")
    
}

processFile(path: "file.swift")



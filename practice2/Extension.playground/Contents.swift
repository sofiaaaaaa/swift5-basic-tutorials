import UIKit

/*:
 
 # Extension - Syntax
 익스텐션으로 형식을 확장하는 방법을 공부합니다.

 익스텐션 문법
 확장 가능한 멤버 종류 : class, enum, protocol, structure 그외 기본자료형도 structure라서 가능함
 구조체 확장
 프로토콜 구현
 
 ```
 extension Type {
    computedProperty
    computedTypeProperty
    instanceMethod
    typeMethod
    initializer (convenience 간편 생성자만 가능함)
    subscript
    NestedType
 }
 
 extension Type: Protocol, ... {
    requirements
 }
 
 ```
 
 */



struct Size {
    var width = 0.0
    var height = 0.0
}

// 원본형식을 수정할 수 없을 때 구현
extension Size: Equatable {
    var area: Double {
        return width * height
    }
    
    public static func ==(lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

let s = Size()
s.width
s.height
s.area


/*:
 
 ## Adding Properties
 익스텐션으로 계산 속성을 추가하는 코드를 작성합니다.

 Date 형식에 년도를 리턴하는 속성 추가
 Double 형식에 라디안/디그리 변환 속성 추가
 
 */

//extension Date {
//    var year: Int {
//        let cal = Calendar.current
//        return cal.component(.year, from: self)
//    }
//}
//
//let today = Date()
//today.year
////today.month
//
//extension Double {
//    var radianValue: Double {
//        return (Double.pi * self) / 180.0
//    }
//
//    var degreeValue: Double {
//        return self * 180.0 / Double.pi
//    }
//}
//
//let dv = 45.0
//dv.radianValue


/*:
 
 ## Adding Methods
 익스텐션으로 메소드를 추가하는 코드를 작성합니다.

 Double 형식에 화씨/섭씨 온도 변환 메소드 추가
 Date 형식에 문자열 포멧팅 메소드 추가
 String 형식에 랜덤 문자열 생성 메소드 추가

 
 */

extension Double {
    func toFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    static func convertToFahrenheit(from celsius: Double) -> Double {
        return celsius.toFahrenheit()
    }
}

let c = 30.0
c.toFahrenheit()
Double.convertToFahrenheit(from: 30.0)

extension Date {
    func toString(format: String = "yyyymmdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

let today2 = Date()
today2.toString()

today2.toString(format: "yyyymm")

extension String {
    static func random(length: Int, characterIn chars: String = "abcdefg") -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else {
                continue
            }
            
            randomString.append(char)
        }
        return randomString
    }
}

String.random(length: 4)

/*:
 
 ## Adding Initializers
 익스텐션으로 생성자를 추가하는 코드를 작성합니다.

 Date 형식에 년,월,일로 초기화 하는 생성자 추가
 UIColor 클래스에 RGB 파라미터를 받는 생성자 추가
 익스텐션으로 생성자를 구현할 때의 장점
 
 */

extension Date {
    init?(year: Int, month: Int, day: Int) {
        let cal = Calendar.current
        var comp = DateComponents()
        comp.year = year
        comp.month = month
        comp.day = day
        
        guard let date = cal.date(from: comp) else {
            return nil
        }
        
        self = date
    }
}

Date(year: 2014, month: 4, day: 16)


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}

UIColor(red: 10, green: 10, blue: 20)

struct Size2 {
    var width = 0.0
    var height = 0.0

}

extension Size2 {
    
    init(value: Double){
        width = value
        height = value
    }
    
}

// struct에 다른 파라미터 구성의 생성자를 추가하는 경우 extension에 추가하면 기본으로 제공되는 모든 속성의 값을 파라미터로 전달하는 생성자도 에러없이 사용가능하다.
Size2(width: 3, height: 4)

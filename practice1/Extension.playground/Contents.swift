import UIKit

/*:
 
 # Extension
 
 * 익스텐션으로 형식을 확장하는 방법을 공부합니다.

 익스텐션 문법
 확장 가능한 멤버 종류
 구조체 확장
 프로토콜 구현 추가

 * Class, Structure, Enumeration, Protocol 에 새로운 멤버를 추가할 수 있다. Overrding은 상속을 통해 진행해야한다.
 
```

 extension Type {
    computerProperty
    comptedTypeProperty
    instanceMethod
    typeMethod
    initializer
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

extension Size {
    var area: Double {
        return width * height
    }
}

let s = Size()
s.width
s.height
s.area


// Equatable 프로토콜 채용?
extension Size: Equatable {
    public static func == (lhs: Size, rhs: Size ) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

/*:
 
 ## Adding Properties
 
 */

//extension Date {
//    var year: Int {
//        let cal = Calendar.current
//        return cal.component(.year, from: self)
//    }
//
//    var month: Int {
//        let cal = Calendar.current
//        return cal.component(.month, from: self)
//    }
//}
//
//let today = Date()
//today.year
//today.month


extension Double {
    var radianValue: Double {
        return (Double.pi * self) / 180.0
    }
    
    var degreeValue: Double {
        return self * 180.0 / Double.pi
    }
}

let dv = 45.0
dv.radianValue
dv.radianValue.degreeValue



extension Date {
    var yesterday: Date {
        let cal = Calendar.current
        return cal.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
    
    var noon: Date {
       return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var day: Int {
        let cal = Calendar.current
        return cal.component(.day, from: self)
    }
}


func solution(_ year:Int, _ month:Int, _ day:Int) -> [Int] {
    let calendar = Calendar.current
    var comps = DateComponents()
    comps.year = year
    comps.month = month
    comps.day = day

    let date = calendar.date(from: comps)!
    
    let m = date.yesterday.month
    let d = date.yesterday.day
    
    return [m, d]
}



/*:
 
 ## Adding Methods
 
 */

extension Double {
    func toFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func toCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    
    // Type method
    static func converToFahrenheit(from celsius: Double ) -> Double {
        return celsius.toFahrenheit()
    }
}

let c = 30.0
c.toFahrenheit()

Double.converToFahrenheit(from: c)

extension Date {
    func toString(format: String = "yyyyMMdd") -> String {
        let privateFormatter = DateFormatter()
        privateFormatter.dateFormat = format
        return privateFormatter.string(from: self)
    }
}

let today = Date()
today.toString()

today.toString(format: "MM/dd/yyyy")

extension String {
    static func random(length: Int, charactersIn chars: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for _ in 0 ..< length {
            guard let char = chars.randomElement() else { continue }
            
            randomString.append(char)
         }
        
        return randomString
    }
}

String.random(length: 5)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespaces)
    }
}


func solution2(_ source:String) -> String {
    return source.trimmed()
}

solution2(" ab c")



/*:

 ## Adding Initializers
 익스텐션으로 생성자를 추가하는 코드를 작성합니다.

 Date 형식에 년,월,일로 초기화 하는 생성자 추가
 UIColor 클래스에 RGB 파라미터를 받는 생성자 추가
 익스텐션으로 생성자를 구현할 때의 장점

 
*/


//extension Date {
//    init?(year: Int, month: Int, day: Int) {
//        let cal = Calendar.current
//        var comp = DateComponents()
//        comp.year = year
//        comp.month = month
//        comp.day = day
//
//        guard let date = cal.date(from: comp) else { return nil}
//
//        // date 인스턴스의 값에 결과값을 저장함
//        self = date
//    }
//}


Date(year: 2014, month: 4, day: 5)


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1.0)
    }
}

UIColor(red: 0, green: 0, blue: 255)

struct Size5 {
    var width = 0.0
    var height = 0.0
    
    // 생성자가 자동으로 제공되지만, 따로 구현가능하다. extension에 init() 을 추가해서 기본으로 제공되는 initializer와 함께 사용할 수 있다.
//    init(value: Double) {
//        width = value
//        height = value
//    }
}

extension Size5 {
   init(value: Double) {
        width = value
        height = value
    }
}

Size5()
Size5(width: 2.0, height: 4.0)


// Extension으로 년, 월, 일로 날짜를 초기화 하는 생성자를 구현해 주세요.
// Failable Initializer로 구현해 주세요.

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


let date = Date(year: 2011, month: 10, day: 5)

func solution3(_ year:Int, _ month:Int, _ day:Int) -> String {
   let formatter = DateFormatter()
   formatter.dateFormat = "yyyyMMdd"
   
   guard let date = Date(year: year, month: month, day: day) else {
      return "error"
   }
   
   return formatter.string(from: date)
}

solution3(2020, 2, 3)



/*:
 
 ## Adding Subscripts

 익스텐션으로 서브스크립트를 추가하는 코드를 작성합니다.

 String 형식에 정수 인덱스를 처리하는 서브스크립트 추가
 Date 형식에 컴포넌트를 리턴하는 서브스트립트 추가

 
 */

//extension String {
//    subscript(idx: Int) -> String? {
//        guard (0..<count).contains(idx) else {
//            return nil
//        }
//
//        let target = index(startIndex, offsetBy: idx)
//        return String(self[target])
//    }
//}

let str = "Swift"
str[1]
str[100]

extension Date {
    subscript(component: Calendar.Component) -> Int? {
        let cal = Calendar.current
        return cal.component(component, from: self)
    }
}

let today3 = Date()
today3[.year]
today3[.month]
today3[.day]


// 문자열에서 특정 문자에 접근할 때 [ ] 사이에 String.Index 형식의 인덱스를 전달해야 합니다.
// Int 형식의 인덱스를 지원하는 Subscript를 문자열에 형식에 추가해 주세요.


func solution7(_ source:String, _ index:Int) -> String {
    return source[index]
}


//        guard (0..<count).contains(idx) else {
//            return nil
//        }
//
//        let target = index(startIndex, offsetBy: idx)
//        return String(self[target])

extension String {
    subscript(idx: Int) -> String {
        guard(0..<count).contains(idx) else { return "" }
        let target = index(startIndex, offsetBy: idx)
        
        
        return String(self[target]) ?? ""
    }
}

solution7("z2", 0)

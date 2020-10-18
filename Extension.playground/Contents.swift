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
 
 # Adding Properties
 
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

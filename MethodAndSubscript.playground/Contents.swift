import UIKit

/*:
 
 # Instance Method
 
 ```
 func name(parameters) -> ReturnType {
    code
 }
 
 // 실행시
 instance.method(parameters)
 
 ```
 * class, structure, enum에서 구현 가능하다.
 
 */

//class Sample {
//    var data = 0
//    static var sharedData = 123
//
//    func doSomething(){
//        print(data)
//        // type memeber에 접근하기
//        Sample.sharedData
//    }
//
//    func call() {
//        doSomething()
//    }
//}
//
//let a = Sample()
//a.data
//a.doSomething()
//a.call()


struct Size {
    var width = 0.0
    var height = 0.0
    
    mutating func enlarge() {
        width += 1.0
        height += 1.0
    }
}

////  상수에 저장하면 enlarge를 실행할 수 없다.
//let s = Size()
//s.enlarge()

var s = Size()
s.enlarge()


struct Area {
   let x: Int
   let y: Int
   var width: Int
   var height: Int
   
   // 여기에서 인스턴스 메소드를 추가해 주세요.
    mutating func extend(by num :Int ) -> Area{
        return Area(x: self.x , y: self.y, width: self.width * num, height: self.height * num)
    }
    
    mutating func reset() {
       self.width = 0
       self.height = 0
    }
}

// 아래 코드는 let 또는 var 키워드만 수정할 수 있습니다.
var a = Area(x: 0, y: 0, width: 100, height: 100)
let b = a.extend(by: 3)
a.reset()

// 아래 코드는 수정하지 마세요.
let isExtended = b.width == 300 && b.height == 300
let isZeroArea = a.x == 0 && a.y == 0 && a.width == 0 && a.height == 0

print(isExtended && isZeroArea)

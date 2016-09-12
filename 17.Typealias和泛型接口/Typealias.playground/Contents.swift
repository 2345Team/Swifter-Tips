//: Playground - noun: a place where people can play

import UIKit

//func distanceBetweenPoint(point: CGPoint, toPoint: CGPoint) -> Double {
//    let dx = Double(toPoint.x - point.x)
//    let dy = Double(toPoint.y - point.y)
//    return sqrt(dx * dx + dy * dy)
//}
//
//let origin: CGPoint = CGPoint(x: 0, y: 0)
//let point: CGPoint = CGPoint(x: 1, y: 1)
//
//let distance: Double = distanceBetweenPoint(origin, toPoint: point)

// 利用typealias转换，减轻阅读和维护的负担

// 利用typealias 我们将CGPoint 和 Double 转换成更贴合此函数作用的Location 和 Distance
typealias Location = CGPoint
typealias Distance = Double


func distanceBetweenPoint(point: Location, toPoint: Location) -> Distance {
    let dx = Distance(toPoint.x - point.x)
    let dy = Distance(toPoint.y - point.y)
    return sqrt(dx * dx + dy * dy)
}

let origin: Location = Location(x: 0, y: 0)
let point: Location = Location(x: 1, y: 1)

let distance: Distance = distanceBetweenPoint(origin, toPoint: point)


// typealias必须指定将某个特定的类型通过typealias赋值为新名字，而不能将整个泛型类型进行重命名

class Person<T> {
    
}

//typealias Worker = Person
//typealias Worker = Person<T>
//typealias Worker<T> = Person<T>

//这三种写法都不能编译通过

//一旦泛型类型的确定性得到保证之后，我们就可以重命名了

typealias WorkId = String
typealias Worker = Person<WorkId>


//Swift中是没有泛型接口的，我们可以利用Typealias来定义一个必须实现的别名

//protocol GeneratorType {
//    typealias Element
//    mutating func next() -> Self.Element?
//}
//
//protocol SequenceType {
//    typealias Generator: GeneratorType
//    func generate() -> Self.Generator
//}

/// 递减
class CountdownGenerator: GeneratorType {
    typealias Element = Int
    var element: Element
    
    init<T>(array: [T]) {
        self.element = array.count - 1
    }
    
    func next() -> Element? {
        return self.element < 0 ? nil : element--
   
    }
}

let xs = ["A", "B", "C"]
let generator = CountdownGenerator(array: xs)
while let i = generator.next() {
    print("Element \(i) of the array is \(xs[i])")
}




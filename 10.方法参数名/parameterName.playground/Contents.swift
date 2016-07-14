//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 对于何时强制需要名称标签，何时强制不要名称标签，也是有规则的
// 在类型的 init 方法中是需要加入标签的，比如下面例子的 color 和 weight 都不能省略：

class Car {
    init(color: UIColor, weight: Int) {
        //...
    }
}

let car = Car(color: UIColor.redColor(), weight: 10)

// 而对于实例方法来说，我们对其调用时 Swift 将忽略第一个参数的标签，而强制要求之后的参数名称：
extension Car {
    func moveToX(x: Int, y: Int) {
        //...
    }
}

car.moveToX(10, y: 20)

// 对于类方法，也是如此：
extension Car {
    class func findACar(name: String, color: UIColor) -> Car? {
        let result = car
        //...
        return result
    }
}

let myPorsche = Car.findACar("Porsche", color: UIColor.yellowColor())

// 但是有一个例外，那就是如果这个方法是一个全局方法的话，参数名称默认是省略掉的：

// 注意，现在不在 Car 中，而是在一个全局作用域
func findACar(name: String, color: UIColor) -> Car? {
    let car2 = car
    return car2
}

let myFerrari = findACar("Ferrari", color: UIColor.redColor())
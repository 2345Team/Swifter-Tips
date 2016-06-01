//: Playground - noun: a place where people can play

import UIKit


protocol Vehicle   //swift 协议不仅可以被class实现，也适用于 struct 和 enum 有别于oc
{
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    
    mutating func changeColor()   /*mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，所以如果你没在接口方法里写 mutating 的话，别人如果用 struct 或者 enum 来实现这个接口的话，就不能在方法里改变自己的变量了
     */
}

struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blueColor()
    
     mutating func changeColor() {
        color = UIColor.redColor()
    }
}

class TestCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.cyanColor()
    
    func changeColor() {
        color = UIColor.redColor()
    }
}
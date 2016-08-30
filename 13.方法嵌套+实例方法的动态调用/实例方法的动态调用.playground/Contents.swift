//: Playground - noun: a place where people can play

import UIKit

//实例方法的动态调用

class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
}
//想要调用 method 方法的话，最普通的使用方式是生成 MyClass 的实例，然后用 .method 来调用它：
let object = MyClass()
let result = object.method(1)
//等价于
let result2 = MyClass().method(1)

//限定了我们只能够在编译的时候就决定 object 实例和对应的方法调用
let f = MyClass.method
let objectClass = MyClass()
let result3 = f(objectClass)(1)
//等价于
let result4 = f(MyClass())(1)


//我们观察 f 的类型 (Alt + 单击)
//f: MyClass -> (Int) -> Int


//这种方法只适用于实例方法，对于属性的 getter 或者 setter 是不能用类似的写法的


//如果我们遇到有类型方法的名字冲突时：
class MyClass2 {
    func method(number: Int) -> Int {
        return number + 1
    }
    
    class func method(number: Int) -> Int {
        return number
    }
}

let f1 = MyClass2.method
// class func method 的版本

let f2: Int -> Int = MyClass2.method
// 和 f1 相同

let f3: MyClass2 -> Int -> Int = MyClass2.method
// func method 的柯里化版本


//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 一般声明一个方法 一个简单的 +1 器
func incrementor(variable: Int) -> Int {
    return variable + 1
}

//func incrementor1(variable: Int) -> Int {
//    return ++variable
//}
// 自增函数 ++ 在c语言中有使用 
//所有有可能的地方都默认是不可变的，也就是用let声明的。在方法的参数上也是如此，我们不写修饰符的话，默认情况下所有的参数都是 let 的。 既
//func incrementor1(let variable: Int) -> Int {
//    return ++variable
//}
//  所以 let 的参数不能重新赋值是理所应当的。所以要想实现连加，可以把参数声明为 var 的。

func incrementor1(var variable: Int) -> Int {
    return ++variable // variable += 1 return variable
}

var luckyNumber = 7
let newNumber = incrementor1(luckyNumber)
print(luckyNumber)

// 在 Swift 2.2 中代码是可以通过编译并正确工作，但是会触发警告 给输入的参数添加 var 已经被废弃了，现在如果想在函数内部对这样的输入值进行修改的话，只能显示的在函数内部进行使用 var 进行赋值以后再操作了：
func increment2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

// 如果希望子啊方法内部直接修改输入的值 可以在参数前加 inout
func increment3(inout variable: Int) {
    variable += 1
}
var num1 = 10
// 调用也要改变为相应的形式，在前面加上 & 符号：
increment3(&num1)
print(num1)

// 参数的修饰是具有传递限制的 对于跨越层级的调用，我们需要保证同一参数的修饰是统一
func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(inout variable: Int) -> () {
        variable += addNumber
    }
    return incrementor
}

var num2 = 10
makeIncrementor(23)(&num2)
print(num2)


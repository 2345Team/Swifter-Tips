//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//reduce方法把数组元素组合计算为一个值。
func sum(input: Int...) -> Int {
    return input.reduce(0, combine: +)
}


//
//    Swift 的可变参数十分灵活，在其他很多语言中，因为编译器和语言自身语法特性的限制，在使用可变参数时往往可变参数只能作为方法中的最后一个参数来使用，而不能先声明一个可变参数，然后再声明其他参数。这是很容易理解的，因为编译器将不知道输入的参数应该从哪里截断。这个限制在 Swift 中是不存在的，因为我们会对方法的参数进行命名，所以我们可以随意地放置可变参数的位置

func myFunc(numbers: Int..., string: String) {
    numbers.forEach {
        for i in 0..<$0 {
            print("\(i + 1): \(string)")
        }
    }
}


print(sum(1,2,3,4,5))

myFunc(1, 2, 3, string: "hello")

let name = "Tom"
let date = NSDate()
let string = NSString(format: "Hello %@. Date: %@", name, date)
//: Playground - noun: a place where people can play

import UIKit

/// 初始化方法需要保证类型的所有属性都被初始化
class Cat {
    var name: String
    init() {
        name = "cat"
    }
}

class Tiger: Cat {
    let power: Int
    override init() {
        power = 10
        // 如果我们不需要打改变 name 的话，
        // 虽然我们没有显式地对 super.init() 进行调用
        // 不过由于这是初始化的最后了，Swift 替我们自动完成了
        super.init()
        name = "tiger"
    }
}



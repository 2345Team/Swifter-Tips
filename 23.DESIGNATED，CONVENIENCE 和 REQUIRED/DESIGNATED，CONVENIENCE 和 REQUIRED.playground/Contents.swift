//: Playground - noun: a place where people can play

import UIKit

class ClassA {
    let numA: Int
    init(num: Int) {
        numA = num
    }
}

class ClassB: ClassA {
    let numB: Int
    
    override init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
}
let a = ClassA(num:1)
a.numA

let b = ClassB(num:3)
b.numA
b.numB

/// /////////////////////////////////////////////
// init 前加上 convenience 关键字的初始化方法
class ClassAA {
    let numA: Int
    init(num: Int) {
        numA = num
    }
    
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000 : 1)
    }
}

class ClassBB: ClassAA {
    let numB: Int
    
    override init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
}

let aa = ClassAA(num:1)
aa.numA
//正常调用

let bb = ClassBB(num:3)
bb.numA
bb.numB
//正常调用

let cc = ClassBB(bigNum: true)
cc.numA
cc.numB
//正常调用
//let dd = ClassB(bigNum: true)
////不正常调用


/// /////////////////////////////////////////////
//对于某些我们希望子类中一定实现的 designated 初始化方法，我们可以通过添加 required 关键字进行限制，强制子类对这个方法重写实现。
class ClassAAA {
    let numA: Int
    required init(num: Int) {
        numA = num
    }
    
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000 : 1)
    }
}

class ClassBBB: ClassAAA {
    let numB: Int
    
    required init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
}

let aaa = ClassAAA(num:1)
aaa.numA

let bbb = ClassBBB(num:3)
bbb.numA
bbb.numB

let ccc = ClassBBB(bigNum: true)
ccc.numA
ccc.numB



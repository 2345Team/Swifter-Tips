//: Playground - noun: a place where people can play

import UIKit

//Designated Initializer 指定构造器, 而 Convenience Initializer 译为便利构造器.
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

//而在子类中也强制 (显式或者隐式地) 调用 super 版本的 designated 初始化，所以无论如何走何种路径，被初始化的对象总是可以完成完整的初始化的。

/// /////////////////////////////////////////////
// init 前加上 convenience 关键字的初始化方法

//只要在子类中实现重写了父类 convenience 方法所需要的 init 方法的话，我们在子类中就也可以使用父类的 convenience 初始化方法了。比如在下面的代码中，我们在 ClassBB 里实现了 init(num: Int) 的重写。这样，即使在 ClassBB 中没有 bigNum 版本的 convenience init(bigNum: Bool)，我们仍然还是可以用这个方法来完成子类初始化：

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



//因此进行一下总结，可以看到初始化方法永远遵循以下两个原则：

//初始化路径必须保证对象完全初始化，这可以通过调用本类型的 designated 初始化方法来得到保证；
//子类的 designated 初始化方法必须调用父类的 designated 方法，以保证父类也完成初始化。

/// /////////////////////////////////////////////
//对于某些我们希望子类中一定实现的 designated 初始化方法，我们可以通过添加 required 关键字进行限制，强制子类对这个方法重写实现。
//这样做就可以保证依赖于某个 designated 初始化方法的 convenience 一直可以被使用。就是上面的 init(bigNum: Bool)：如果我们希望这个初始化方法对于子类一定可用，那么应当将 init(num: Int) 声明为必须，这样我们在子类中调用 init(bigNum: Bool) 时就始终能够找到一条完全初始化的路径了：
class ClassAAA {
    let numA: Int
    required init(num: Int) {
        numA = num
    }
    //convenience不能不写 不然编译报错
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



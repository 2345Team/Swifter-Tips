//: Playground - noun: a place where people can play

import UIKit

//使用 Optional Chaining(中文：自判断链接) 可以让我们摆脱很多不必要的判断和取值，但是在使用的时候需要小心陷阱。

class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}


let xiaoming = Child()
let toyName = xiaoming.pet?.toy?.name
//
//xiaoming.pet = Pet()
//xiaoming.pet?.toy = Toy(name: "娃娃")
let toyName2 = xiaoming.pet?.toy?.name
if let toyName = xiaoming.pet?.toy?.name {
    print(" 太好了，小明既有宠物，而且宠物还正好有个玩具")
}else{
    print("没有")
}

// Toy 定义了一个扩展，以及一个玩玩具的 play() 方法
extension Toy {
    func play() {
        //...
    }
}

xiaoming.pet?.toy?.play()

let playClosure1 = {(child: Child) -> () in child.pet?.toy?.play()}
let playClosure2 = {(child: Child) -> ()? in child.pet?.toy?.play()}


if let result: () = playClosure1(xiaoming) {
    print("好开心~")
} else {
    print("没有玩具可以玩 :(")
}

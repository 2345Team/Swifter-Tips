//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let diceFaceCount = 6
let randomRoll = Int(arc4random()) % diceFaceCount + 1
print(randomRoll)

// 其实在 iPhone 5s 上完全没有问题，但是在 iPhone 5 或者以下的设备中，有时候 程序会崩溃

/*
 小贴士： Swift的 Int 是和 CPU 架构相关的，在32位CPU（iPhone5和以前的机型），实际上是 Int32，而在64位 CPU（iPhone5s和之后的机型）上是 Int64，arm4random返回值不论在什么平台上都是 UInt32，于是 32 位的平台上就有一半几率在进行 Int 转换时越界。所以会造成崩溃。
 */

// 这种情况下，一种相对安全的做法是使用一个 arc4random 的改良版本：
// func arc4random_uniform(_: UInt32) -> UInt32

//这个改良版本接受一个 UInt32 的数字 n 作为输入，将结果归一化到 0 到 n - 1 之间。只要我们的输入不超过 Int 的范围，就可以避免危险的转换：

let diceFaceCount1: UInt32 = 6
let randomRoll1 = Int(arc4random_uniform(diceFaceCount1)) + 1
print(randomRoll)

func randomInRange(range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}

for _ in 0...100 {
    print(randomInRange(1...6))
}

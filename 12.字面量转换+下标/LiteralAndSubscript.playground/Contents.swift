//: Playground - noun: a place where people can play

import UIKit

//字面量，就是指像特定的数字，字符串或者是布尔值这样，能够直接了当地指出自己的类型并为变量进行赋值的值
let aNumber = 3
let aString = "helllo"
let aBool = true

let anArray = [1,2,3]
let aDictionary = ["key1": "value1", "key2": "value2"]

//字面量转换为特定的类型
//ArrayLiteralConvertible
//BooleanLiteralConvertible
//DictionaryLiteralConvertible
//FloatLiteralConvertible
//NilLiteralConvertible
//IntegerLiteralConvertible
//StringLiteralConvertible

enum MyBool: Int {
    case myTrue, myFalse
}

extension MyBool: BooleanLiteralConvertible
{
    init(booleanLiteral value: Bool) {
        self = value ? myTrue : myFalse
    }
}

let myTrue: MyBool = true
let myFalse: MyBool = false

myTrue.rawValue    // 0
myFalse.rawValue   // 1

//ExtendedGraphemeClusterLiteralConvertible //字符簇和字符的字面量转换
//UnicodeScalarLiteralConvertible

//class Person
//{
//    let name: String
//    init(name value: String) {
//        self.name = value
//    }
//}

class Person: StringLiteralConvertible
{
    let name: String
    init(name value: String) {
        self.name = value
    }
    
    required init(stringLiteral value: String) {
        self.name = value
    }
    
    required init(extendedGraphemeClusterLiteral value: String) {
        self.name = value
    }
    
    required init(unicodeScalarLiteral value: String) {
        self.name = value
    }
}

let p: Person = "xiaoMing"
print(p.name)


//下标
var arr = [1,2,3]
arr[2]            // 3
arr[2] = 4        // arr = [1,2,4]

var dic = ["cat":"meow", "goat":"mie"]
dic["cat"]          // {Some "meow"}
dic["cat"] = "miao" // dic = ["cat":"miao", "goat":"mie"]
//字典需要注意，我们通过下标访问得到的结果是一个 Optional 的值


//Swift 是允许我们自定义下标
//Array
/*
 subscript (index: Int) -> T  //单个 Int 类型的序号
 subscript (subRange: Range<Int>) -> Slice<T> //表明范围的 Range<Int>
 */


extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index,i) in input.enumerate() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}



//: Playground - noun: a place where people can play

import UIKit

//@autoclosure 做的事情就是把一句表达式自动地封装成一个闭包 (closure)

func logIfTrue(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue({return 2 > 1})

logIfTrue({2 > 1})
logIfTrue{2 > 1}  //尾随闭包Trailing closure


func logIfTrue1(@autoclosure predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue1(2 > 1)


let beginTime =  CACurrentMediaTime()

func expensiveMethod() -> Bool
{
    NSThread.sleepForTimeInterval(10.0)
    print("执行了很久")
    
    let endTime = CACurrentMediaTime()
    let tempTime = endTime-beginTime
    print(tempTime)
    
    return true
}

// //1
//func and(first:Bool,second:Bool)->Bool
//{
//    print("执行and方法")
//
//
//    return first&&second
//}
//let result = and(false, second: expensiveMethod())

// //2
//func and(first:Bool,getSecond:()->Bool)->Bool{
//    if !first
//    {
//        return false
//    }
//    else{
//        return getSecond()
//    }
//}
//let result = and(false, getSecond: { return expensiveMethod()})

// //3
func and(first:Bool,@autoclosure getSecond:()->Bool)->Bool{ if !first{ return false }else{ return getSecond() } }

let result = and(false, getSecond: expensiveMethod())


// ??。这个操作符可以判断输入并在当左侧的值是非 nil 的 Optional 值时返回其 value，当左侧是 nil 时返回右侧的值

var level : Int?
var startLevel = 1

//level = 2
var currentLevel = level ?? startLevel
print(currentLevel)

/*
 @warn_unused_result
 public func ??<T>(optional: T?, @autoclosure defaultValue: () throws -> T) rethrows -> T
 
 @warn_unused_result
 public func ??<T>(optional: T?, @autoclosure defaultValue: () throws -> T?) rethrows -> T?
 */

func ??<T>(optional: T?, @autoclosure defaultValue: () -> T) -> T {
    switch optional {
    case .Some(let value):
        return value
    case .None:
        return defaultValue()
    }
}

//@autoclosure 并不支持带有输入参数的写法，也就是说只有形如 () -> T 的参数才能使用这个特性进行简化。另外因为调用者往往很容易忽视 @autoclosure 这个特性，所以在写接受 @autoclosure 的方法时还请特别小心


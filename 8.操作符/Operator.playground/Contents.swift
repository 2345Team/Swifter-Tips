//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 比如我们需要一个表示二位向量的数据结构
struct Vector2D {
    var x = 0.0
    var y = 0.0
}

// 一个很简单的需求是两个Vector2D相加:

let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 1.0, y: 4.0)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
print(v3)

// 如果只坐一次的话似乎还好，但是一般情况我们会进行很多这种操作。

func -(left:Vector2D,right:Vector2D) -> Vector2D {
    return Vector2D(x: left.x - right.x, y: left.y - right.y)
}

let v4 = v1 - v2
print(v4)

// 如果我们想定义一个全新的运算符的话，要做的事情会多一件。比如点积运算就是一个在适量运算中很常用的运算符，他表示两个向量对应坐标的乘积的和。根据定义，以及参考重载运算符的方法，我们选取 +* 来表示这个运算，不难写出:
func %*(left:Vector2D,right:Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}
// 因为我们没有对这个操作符进行声明。之前可以直接重载像 +，-，*这样的操作符，是因为Swift中已经有定义了，如果我们要新加操作符的话，需要先对其进行声明，告诉编译器这个符号其实是一个操作符。

infix operator %* {
associativity none
precedence 160
}

// infix
// 表示要定义的是一个中位操作符，即前后都是输入；其他的修饰子还包括prefix和postfix

// associativity
// 定义了结合律，即如果多个同类的操作符顺序出现的计算顺序。比如常见的加法和减法都是left，就是说多个加法同时出现时按照从左往右的顺序计算(因为加法满足交换律，所以这个顺序无所谓，但是减法的话计算顺序就很重要了)点乘的结果是一个Double，不再会和其他点乘结合使用，所以这里写成none
// precedence
// 运算的优先级，越高的话越优先进行运算。Swift中乘法和除法的优先级是150.加法和减法是140，这里我们定义点积优先级160，就是说应该早于普通的乘除进行运算

// 点积运算
let result = v1 %* v2
print(result)













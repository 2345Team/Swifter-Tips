//
//  ViewController.swift
//  Sequence
//
//  Created by yangbin on 16/6/13.
//  Copyright © 2016年 yangbin. All rights reserved.
//

import UIKit

// 这个特性，可以让自己定义的类也支持 for .. in 语法

//提到数组我们就会想到遍历，一般的遍历可能都是从头到尾进行的。但是如果你有特殊的需求呢。你可能不想呆板的进行遍历。这时候Generators就可以派上用场了。
//一个字：Generators的存在是进行特殊癖好的数组遍历，其筛选出符合该癖好的下标索引到数组没有元素为止


// 先定义一个实现了GeneratorType protocol的类型
// GeneratorType需要指定一个typealias Element
// 以及提供一个返回Element？ 的方法next()

class ReverseGenerator<T>: GeneratorType {
    typealias Element = T
    
    var array : [Element]
    var currentIndex = 0
    
    init(array : [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
            
        }
    }
    
}

// 然后我们来定义SequenceType
//

struct ReverseSequence<T>: SequenceType {
    var array : [T]
    
    init(array: [T]) {
        self.array = array;
    }
    
    typealias Generator = ReverseGenerator<T>
    func generate() -> Generator {
        return ReverseGenerator(array: self.array)
    }
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arr = [0,1,2,3,4]
        
        // 对SequenceType可以使用for...in来循环访问
        for i in ReverseSequence(array: arr) {
            print("Index\(i) is \(arr[i])")
        }
        
        
        
        let xs = [0,1,2,3,4]
        let generator = ReverseGenerator(array: xs)
        while let j = generator.next() {
            print("Index\(j) is \(xs[j])")
        }
        
        
        // for...in内部究竟做了什么
        var g = arr.generate()
        while let obj = g.next() {
            print(obj)
        }
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


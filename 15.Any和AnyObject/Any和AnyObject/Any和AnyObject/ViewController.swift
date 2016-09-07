//
//  ViewController.swift
//  Any和AnyObject
//
//  Created by wanglili on 16/9/7.
//  Copyright © 2016年 wanglili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //假设原来的某个 API 返回的是一个 id，那么在 Swift 中现在就将被映射为 AnyObject? (因为 id 是可以指向 nil 的，所以在这里我们需要一个 Optional 的版本)
    func someMethod() -> AnyObject? {
        return "123"
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 所有的 class 都隐式地实现了这个接口，这也是 AnyObject 只适用于 class 类型的原因
        let anyObject: AnyObject? = self.someMethod()
        // as? 返回一个你试图想转成的类型的可选值
        if let someInstance = anyObject as? String {
            // ...
            // 这里我们拿到了具体 SomeRealClass 的实例
            
            someInstance.startIndex
        }
        
        /*
         struct 类型，并不能由 AnyObject 来表示，于是 Apple 提出了一个更为特殊的 Any，除了 class 以外，它还可以表示包括 struct 和 enum 在内的所有类型。
         */
        // 我们在这里声明了一个 Int 和一个 String，按理说它们都应该只能被 Any 代表，而不能被 AnyObject 代表的
        // 因为我们显式地声明了需要 AnyObject，编译器认为我们需要的的是 Cocoa 类型而非原生类型，而帮我们进行了自动的转换
        let swiftInt: Int = 1
        let swiftString: String = "miao"
        
        var array: [AnyObject] = []
        array.append(swiftInt)
        array.append(swiftString)
        
        print(array.first)
        print(array.last)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


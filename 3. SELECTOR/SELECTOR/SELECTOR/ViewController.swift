//
//  ViewController.swift
//  SELECTOR
//
//  Created by william on 16/6/2.
//  Copyright © 2016年 陈大威. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /********************************** Swift 2.2 ****************************************/
        //Swift 2.2 发布了。Swift是一种使用现代的安全设计方式和软件设计模式构建的通用编程语言。该版本语言更新如下：
        
        //SE-0022: Referencing the Objective-C selector of a method

        //https://github.com/apple/swift-evolution/blob/master/proposals/0022-objc-selectors.md
        
        
        /********************************** SELECTOR ****************************************/
        //在 Swift 中没有 @selector 了，取而代之，从 Swift 2.2 开始我们使用 #selector 来从暴露给 Objective-C 的代码中获取一个 selector。类似地，在 Swift 里对应原来 SEL 的类型是一个叫做 Selector 的结构体
        let someMethod = #selector(callMe)
        //==let someMethod2 = #selector(ViewController.callMe)
        
        
        let anotherMethod = #selector(callMeWithParam(_:))
        
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self,
//                                               selector: "callMe", userInfo: nil, repeats: true)
        
        /**我们知道Selector是Objective-C的产物，它用于在运行时作为一个键值去找到对应方法的实现。一个Objective-C的方法是由objc_method结束体定义的，其声明如下：
        
        
        struct objc_method {
            SEL method_name                    OBJC2_UNAVAILABLE;  // 方法名
            char *method_types                  OBJC2_UNAVAILABLE;
            IMP method_imp                      OBJC2_UNAVAILABLE;  // 方法实现
        }
        这就要求selector引用的方法必须对ObjC运行时是可见的。而Swift是静态语言，虽然继承自NSObject的类默认对ObjC运行时是可见的，但如果方法是由private关键字修饰的，则方法默认情况下对ObjC运行时并不是可见的，所以就导致了以上的异常：运行时并没找到callPrivateMe方法。
         **/
        NSTimer.scheduledTimerWithTimeInterval(1, target: self,
                                               selector:#selector(callPrivateMe), userInfo: nil, repeats: true)
        
        //        如果方法名字在方法所在域内是唯一的话，我们可以简单地只是用方法的名字来作为 #selector 的内容。相比于前面带有冒号的完整的形式来说，这么写起来会方便一些：
        let anotherMethod2 = #selector(callMeWithParam)
        
        let an = #selector(callBack111)
        //如果在同一个作用域中存在同样名字的两个方法，即使它们的函数签名不相同，Swift 编译器也不允许编译通过：我们可以通过将方法进行强制转换来使用：
        let method1 = #selector(commonFunc as ()->())
        let method2 = #selector(commonFunc as Int->Int)
        
        _ = #selector(jjjj)
    }
    
    func jjjj() {
        
    }
    
    func callBack111() {
        
    }
    
    func callMe() {
        //...
    }
    
    func callMeWithParam(obj: AnyObject!) {
        //...
    }
    
    @objc private func callPrivateMe() {
        //...
    }
    
    
    func commonFunc() {
        
    }
    
    func commonFunc(input: Int) -> Int {
        return input
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


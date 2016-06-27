//
//  ViewController.swift
//  5.Tuple
//
//  Created by luzhiyong on 16/6/15.
//  Copyright © 2016年 2345. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        var a = 3
        var b = 4
        
        swapMe(&a, b: &b)
        
        print(a)
        print(b)
        
        swapMe2(&a, b: &b)
        
        print(a)
        print(b)
        
    
        // 利用元组同时返回多个值，从而解决了在Objective-C中返回值只能有一个而造成的一些问题
//        var areaOne: CGRect = CGRectMake(0, 0, 0, 0)
//        var areaTwo: CGRect = CGRectMake(0, 0, 0, 0)
//        
//        CGRectDivide(self.view.bounds, &areaOne, &areaTwo, self.view.bounds.size.width * 0.3, .MinXEdge)
//        
//        let viewOne = UIView()
//        viewOne.frame = areaOne
//        viewOne.backgroundColor = UIColor.redColor()
//        self.view.addSubview(viewOne)
//        
//        let viewTwo = UIView()
//        viewTwo.frame = areaTwo
//        viewTwo.backgroundColor = UIColor.yellowColor()
//        self.view.addSubview(viewTwo)
        
        var (areaOne, areaTwo) = CGRectDivide(self.view.bounds, amount: self.view.bounds.size.width * 0.3, edge: .MinXEdge)
        let viewOne = UIView()
        viewOne.frame = areaOne
        viewOne.backgroundColor = UIColor.redColor()
        self.view.addSubview(viewOne)
        
        let viewTwo = UIView()
        viewTwo.frame = areaTwo
        viewTwo.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(viewTwo)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*!
     普通实现方法
     - parameter a: 参数a
     - parameter b: 参数b
     */
    func swapMe<T>(inout a: T, inout b: T) {
        let tmp = a
        a = b
        b = tmp
    }
    
    /*!
     高级实现方法
     - parameter a: 参数a
     - parameter b: 参数b
     */
    func swapMe2<T>(inout a: T, inout b: T) {
        (a,b) = (b,a)
    }
    

}


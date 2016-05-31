//
//  ViewController.swift
//  1.柯里化(Curring)
//
//  Created by luzhiyong on 16/5/26.
//  Copyright © 2016年 2345. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = Control()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let addTwo = addTo(2);
        let result = addTwo(6);
        print(result);
        
        let greaterThan10 = greaterThan(10)
        greaterThan10(13)
        greaterThan10(9)
        
        button.setTarget(self, action: ViewController.onButtonTap, controlEvent: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*!
     将传入参数默认加1
     - parameter num: 传入的数值
     - returns: 加1后的数值
     */
    func addOne(num: Int) -> Int {
        return num + 1
    }
    
    // 函数类型作为返回类型
    /*!
       返回一个函数，函数的作用是讲num加上当前函数的参数
     - parameter adder: 加上的数值
     - returns: 加上adder后的数值
     */
    func addTo(adder: Int) -> Int -> Int {
        return {
            num in
            return num + adder
        }
    }
    
    func greaterThan(comparer: Int) -> Int -> Bool {
        return { $0 > comparer}
    }
    
    func onButtonTap() {
        print("Button was tapped")
    }

}


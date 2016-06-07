//
//  ClassOne.swift
//  SELECTOR
//
//  Created by william on 16/6/6.
//  Copyright © 2016年 陈大威. All rights reserved.
//

import Foundation
class ClassOne{
    //我们的类是纯Swift类，而不是继承自NSObject，则不管方法是private还是internal或public，如果要用在Selector中，都需要加上@objc修饰符。
    let someMethod = #selector(callMe)
    
    @objc func callMe() {
        //...
    }
}
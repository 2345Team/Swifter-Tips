//
//  MyFramework.swift
//  NameSpace
//
//  Created by yangbin on 16/9/5.
//  Copyright © 2016年 yangbin. All rights reserved.
//

import UIKit

class MyFramework: NSObject {
    
     class MyClass {
        public class func hello() {
            print("hello from framework")
        }
    }
    
    
}
struct MyClassContainer2 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer2")
        }
    }
}
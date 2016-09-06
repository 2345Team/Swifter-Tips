//
//  MyApp.swift
//  NameSpace
//
//  Created by yangbin on 16/9/5.
//  Copyright © 2016年 yangbin. All rights reserved.
//

import Foundation

class MyApp: NSObject {

   
      public  class func hello() {
            print("hello from app")
        }
    
   
}

struct MyClassContainer1 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer1")
        }
    }
}
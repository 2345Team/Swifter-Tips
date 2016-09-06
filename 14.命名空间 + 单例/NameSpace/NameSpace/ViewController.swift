//
//  ViewController.swift
//  NameSpace
//
//  Created by yangbin on 16/9/5.
//  Copyright © 2016年 yangbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(MyClass.hello())
        print(MyFramework.MyClass.hello())
        
        
       print(MyClassContainer1.MyClass.hello())
        print(MyClassContainer2.MyClass.hello()
)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


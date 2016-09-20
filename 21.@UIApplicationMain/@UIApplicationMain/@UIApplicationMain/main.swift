//
//  main.swift
//  @UIApplicationMain
//
//  Created by Merlin on 16/9/19.
//  Copyright © 2016年 2345. All rights reserved.
//

import Foundation
import UIKit

//UIApplicationMain(Process.argc, Process.unsafeArgv, nil,NSStringFromClass(AppDelegate))

//这样每次发送事件 (比如点击按钮) 时，我们都可以监听到这个事件了。

class MyApplication: UIApplication
{
    override func sendEvent(event: UIEvent)
    {
        super.sendEvent(event)
        print("Event sent: \(event)");
    }
}

//我们还可以通过将第三个参数替换成自己的 UIApplication 子类，这样我们就可以轻易地做一些控制整个应用行为的事情了

UIApplicationMain(Process.argc, Process.unsafeArgv,
                  NSStringFromClass(MyApplication), NSStringFromClass(AppDelegate))
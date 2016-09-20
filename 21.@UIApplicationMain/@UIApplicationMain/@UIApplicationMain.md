在 C 系语言中，程序的入口都是 main 函数。对于一个 Objective-C 的 iOS app 项目，在新建项目时， Xcode 将帮我们准备好一个 main.m 文件，其中就有这个 main 函数：

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil,
                   NSStringFromClass([AppDelegate class]));
    }
}


Swift  采用@UIApplicationMain 的标签。

不说可能您也已经猜到，这个标签做的事情就是将被标注的类作为委托，去创建一个 UIApplication 并启动整个程序。在编译的时候，编译器将寻找这个标记的类，并自动插入像 main 函数这样的模板代码
       
Swift 项目也可以有一个名为 main.swift 特殊的文件。在这个文件中，我们不需要定义作用域，而可以直接书写代码。这个文件中的代码将作为 main 函数来执行。比如我们在删除 @UIApplicationMain 后，在项目中添加一个 main.swift 文件，然后加上这样的代码：

UIApplicationMain(Process.argc, Process.unsafeArgv, nil,
    NSStringFromClass(AppDelegate))

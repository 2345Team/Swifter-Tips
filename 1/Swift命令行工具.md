### Swift命令行工具

Swift的REPL（Read-Eval-Print Loop）环境可以让我们使用Swift进行简单的交互式编程。

要启动REPL环境，就需要使用Swift的命令行工具，它是以xcrun命令的参数形式存在的。

#### 让我们通过实际操作也了解如何运用Swift命令行工具

1. 首先需要确认使用的Xcode版本是6.1以上，如果不是也可以通过Command Lines Tools安装。
2. 输入**swift**命令，进入swift运行模式
      
         $ swift
         Welcome to Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.30). Type :help for assistance.
         
3. 进入命令行模式之后，我们就可以输入Swift代码了

         1> 200
         $R0: Int = 200
         2> var name = "luzhiyong"
         name: String = "luzhiyong"
         3> print("Hello, \(name)")
         Hello, luzhiyong
         
   第一行代码输入后，返回结果中的 $R0 是一个变量名，在swift命令行工具中，如果我们没有输入变量名，它会帮我们自动生成一个变量名。
   
         4> $R0 + 300
         $R1: Int = 500
         
4. 在命令行工具中定义函数

         5> func sum(left: Int, right: Int) -> Int {
         6.    return left + right
         7. }
         
    定义好函数后，我们就可以在后面的命令中调用它了
    
         8> sum(200,right:300)
         $R2: Int = 500
         
5. swift命令行工具还可以将一个**.swift**文件作为命令行工具的输入

   


### 参考
[swift-tips 命令行工具](http://swifter.tips/swift-cli/)

[swift 命令行工具初探](http://www.cnblogs.com/theswiftworld/p/4263949.html)
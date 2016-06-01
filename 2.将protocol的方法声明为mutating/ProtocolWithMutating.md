## Swift - protocol

Swift中protocol的功能比OC中强大很多，不仅能在class中实现，同时也适用于struct、enum。

## Swift与mutating

Swift 的 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，所以如果你没在接口方法里写 mutating 的话，别人如果用 struct 或者 enum 来实现这个接口的话，就不能在方法里改变自己的变量了。在设计接口的时候，要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法。

## class与mutating
class 来实现带有 mutating 的方法的接口时，具体实现的前面是不需要加 mutating 修饰的，因为 class 可以随意更改自己的成员变量。所以说在接口里用 mutating 修饰方法，对于 class 的实现是完全透明，可以当作不存在的


### 参考链接
[Swifter-tips-protocolWithMutating](http://swifter.tips/protocol-mutation/)
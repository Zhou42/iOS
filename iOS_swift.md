# 2016/05/31
1. 如果从dict中取出元素，可能存在key不在dict中的情况。所以取出来的结果是optional 用之前要用!来unwrap, 比如
```swift
class HitTracker {
    var cellsHit: [GridLocation: Bool] = [:]
}
```
2. 关于 class或者struct等的initializer 
http://wiki.jikexueyuan.com/project/swift/chapter2/14_Initialization.html
其中，关于default initializers: 
如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。
```swift
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
```
如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器（default initializers）。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。
```swift
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
```
总的来说，一定要保证实例化一个class/struct的时候，每一个field被赋予了初始值

# 05/13/2016
-	Constants: let pi = 3.14
-	变量统一格式: student: Student 前面是变量名称, 后面是type
-	Func
greetStudent(Jessica, lateForClass: false)
调用函数的时候，需要将变量名也写上，但是第一个变量可以省略
```swift
1.	func someFunction(externalParameterName localParameterName: Int) {
2.	// function body goes here, and can use localParameterName
3.	// to refer to the argument value for that parameter
4.	}
```
貌似externalParameter是为了读起来像句子用的 

# 05/19/2016
-	if let 语句 http://wiki.jikexueyuan.com/project/rust/if-let.html

# 05/20/2016
-	关于swift中json操作
http://swiftcafe.io/2015/07/18/swift-json/

# 05/24/2016
-	Swift 中的属性
http://southpeak.github.io/blog/2014/06/27/ios-swift-property/

# 05/25/2016
-	关于struct中computed property和method。 如果struct中含有所需结果的所有parameter，则用computed property。如果需要外界输入参数，使用method

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



func makeAdd(forAdd amount: Int) -> () -> Int {
    var total = 0
    total
    func add() -> Int {
        //total=10
        total += amount                // 在函数体内捕获了total和amount两个变量的引用
        //print(String(total))
        return total                   // 捕获保证了两个变量在makeAdd调用完并不会消失
    }
   
    return add                         // 并且保证在下次调用makeAdd时候total依然存在
    //print(String(describing: add))
}

let addTen = makeAdd(forAdd: 10)       // 定义了一个常量,相当于持续持有add()函数
addTen()// 10, 每一次调用都会将total增加10
addTen()


var a:Int=3
var b:Int=4

a=b
a
b=a
b

    print(a)


//: Playground - noun: a place where people can play

import UIKit



class Food {
    var name: String
    init(name: String) {// 指定构造器
        print("food init daichan")
        self.name = name
    }
    convenience init() {               // 便利构造器,横向调用指定构造器
       print("food convenience init")
        self.init(name: "名字未知")
    }
}

class Recepe: Food {
    var quantity: Int
    init(name: String, quantity: Int) { // 指定构造器
        print("recepe init daichan")
        self.quantity = quantity       // 初始化属性
        super.init(name: name)         // 初始化父类属性
    }
    override convenience init(name: String) { // 遍历构造器重写了父类的指定构造器
        print("recepe override convenience init")

        self.init(name: name, quantity: 1) // 调用指定构造器,quantity为默认值1
    }
}

let recepe1 = Recepe()
print("\(recepe1.name),\(recepe1.quantity)")  // 名字未知,1

print("==========================================================")

let recepe2 = Recepe(name: "Beef")
print("\(recepe2.name),\(recepe2.quantity)")  // Beef,1

print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
let recepe3 = Recepe(name: "Egg", quantity: 3)
print("\(recepe3.name),\(recepe3.quantity)")  // Egg,3
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class docModel{
    var docid=""
    var docver=""
    func setdocid (docid:String)->String{
        self.docid=docid
         return self.docid
    }
    func setdocver(docver:String)->String{
        self.docver=docver
return self.docver

    }
    deinit {
        
    }
}

let nums = [4, 6, 2, 9, 5]

let sortNums2 = nums.sorted(by: { (n1: Int, n2: Int) -> Bool in
    n1+n2
    n1
    n2
    return n1 > n2
})
print(sortNums2)



func swapTwoInts(_ a: inout Int, _ b: inout Int) {  //  加inout可以传指针
    let temp = a
    a = b
    b = temp
}
var a = 2
var b = 3
swapTwoInts(&a, &b)





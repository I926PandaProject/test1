//: Playground - noun: a place where people can play

import UIKit
//数据类型－－test

//变量

var str = "Hello, playground";
//常量
let aa="abc"
//可选型
var str1:String?=nil


str1

//数组

var arr:Array=[1,2,3];
arr
for i in arr
{
    print(i)
}
/*
for var o=0; o..<10; {
    o+=1
    o+=o
    
}
*/
var p=0
var result=2
while p<10 {
   p+=1
    result=result*2
    
}
result
var a:option

var b="b"
//var y{1:"a",2:"b"}

//枚举

enum e{
    case a
    case b
    case c
}
let d=e.self
let x=e.a



d.a


e.a
e.b
e.c
//元组
var yz:(Int,Int)=(1,2)
yz.0
yz.1
yz=(3,4)
var yz2=(x:1,y:2)
yz2.x
yz2.y
var yz3=(x:1,y:2,z:3)
let yz4:(Int,Int,Int)
yz4=(1,2,3)
switch yz4{
case (_,2,3):
    print ("ok")
    fallthrough
case (1,2,_):
    print ("1111")
default :
    //print ("ng")
    break
}
//函数

func add(_ a:Int,by b:Int)->Int {
    return a+b
}

add(5,by:6)

func substract(Inout a:Int,Inout b:Int)->Int
{
    return a*b
}
//substract(2,2)



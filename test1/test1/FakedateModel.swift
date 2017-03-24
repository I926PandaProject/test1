//
//  dataModel.swift
//  test1
//
//  Created by panda on 2017/03/13.
//  Copyright © 2017年 panda. All rights reserved.
//


import UIKit

class FakedateModel{
    
    var docid:String=""
    var docvers:String=""
    var doctitle:String=""
    var docdate:Date?
    var isread:String=""
    
    var isflg=false
    
    init(id:String,title:String,date:Date?,read:String) {
        self.docid=id
        self.doctitle=title
        self.docdate=date
        self.isread=read
        
    }
    func setdocid(docid:String){
        self.docid=docid
        
    }
    
    func setdocvers(docvers:String){
        self.docvers=docvers
        
    }
    
    
}

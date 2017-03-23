//
//  ViewController.swift
//  test1
//
//  Created by panda on 2017/03/08.
//  Copyright © 2017年 panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    var d1:Dictionary=["":""]
    var docidstr:String = ""
    var dbConnect1 = dbConnectModel()
    let dm=dataModel()
    @IBOutlet weak var Context1: UITextField!
    
    @IBOutlet weak var Context2: UITextField!

    @IBOutlet weak var docid: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        docid.delegate=self
        Context1.delegate=self
        Context2.delegate=self
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ADD(_ sender: Any) {
        print("======ADD Button=======")
        if let docidstr = self.docid.text{
            
            self.docidstr=docidstr
            if let docNo=self.Context1.text {
                
                if let docv=self.Context2.text {
                    d1.removeAll()
                    d1.updateValue(docv, forKey:docNo)
                                       
                }
                else{
                    print ("请输入内容2")
                }
            }else{
                
                print ("请输入内容1")
            }
        }else{
            print("请输入内容docid")
        }
        dbConnect1.dbAdd(docid:self.docidstr,context:d1)
        //Messagbox --------------------------------------------------------------------------------------
        sleep(5)
        let alertController = UIAlertController(title: "Add成功",
                                                message: "DocId=\(self.docidstr)", preferredStyle: UIAlertControllerStyle.alert)
        //let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default,
                                     handler: {
                                        action in
                                        print("点击了确定")
        })
        //alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        //Messagbox --------------------------------------------------------------------------------------
        }
        
    
    
    


    @IBAction func SELECT(_ sender: Any) {
        print("======SELECT Button=======")
        if let docidstr = self.docid.text{
            self.docidstr=docidstr
        }
        
        
        dbConnect1.dbSelect(selectID: self.docidstr,dm: dm)
         print ("dm.isflg1111========\(dm.isflg)")
        
        //Messagbox --------------------------------------------------------------------------------------
        //sleep(5)
        
        if dm.isflg {
            showalert(title: "Select成功")
        }
        
        //Messagbox --------------------------------------------------------------------------------------

    }
    
    
    @IBAction func DEL(_ sender: Any) {
        print("======DEL Button=======")
        if let docidstr = self.docid.text{
            
            self.docidstr=docidstr
        }
        dbConnect1.dbSelect(selectID: self.docidstr,dm: dm)
        print("dm.docvers\(dm.docvers)")
        
        sleep(5)
        
        dbConnect1.docDelect(deleteID: self.docidstr,
                                                deleteVer:dm.docvers)
        
        //Messagbox --------------------------------------------------------------------------------------
        sleep(5)
        showalert(title: "Del成功")
        dm.setdocid(docid: "")
        dm.setdocvers(docvers: "")
        //Messagbox --------------------------------------------------------------------------------------
        
        
    }
    func showalert(title:String){
        let alertController = UIAlertController(title: title,
                                                message: "DocId=\(self.docidstr)\n docversion=\(dm.docvers)", preferredStyle: UIAlertControllerStyle.alert)
        //let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default,
                                     handler: {
                                        action in
                                        print("点击了确定")
        })
        //alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

    

    

    
    



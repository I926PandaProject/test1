//
//  dbConnectModel.swift
//  test1
//
//  Created by panda on 2017/03/08.
//  Copyright © 2017年 panda. All rights reserved.
//

import Foundation
import SwiftCloudant

//extension dbConnectModel:sendMSGDelegate{
//   func sendValue(message: String) {
//        let tempIDs=message
//   }
//}

class dbConnectModel{
    
    
    
    let cloudantURL = NSURL(string:"https://27f9bc4c-4925-4200-b2d8-417cc3220b7f-bluemix:110141f51e1ed07f75940b430fdf726b7c78c6f03a9fcfbafb9be445293774f2@27f9bc4c-4925-4200-b2d8-417cc3220b7f-bluemix.cloudant.com")!
    
    
    let accountNo = "27f9bc4c-4925-4200-b2d8-417cc3220b7f-bluemix"
    
    let pwd = "110141f51e1ed07f75940b430fdf726b7c78c6f03a9fcfbafb9be445293774f2"
    
    let dbName = "pandadb"
    
    
    func dbAdd(docid:String,context:Dictionary<String,String>){
               
        let client = CouchDBClient(url:cloudantURL as URL, username: accountNo, password: pwd)
        
        let create = PutDocumentOperation(id:docid, body:context,
                                          databaseName: dbName) {(response, httpInfo, error) in
                                            if let error = error {
                                                print("Encountered an error while creating a document. Error:\(error)")
                                                

                                            } else {
                                                print("Created document \(response?["id"]) with revision id \(response?["rev"])")
                                                
                                            }
                                            
        }
        client.add(operation: create)
        
    }

    
    func dbSelect(selectID :String,dm :dataModel)  {
        
        let client = CouchDBClient(url:cloudantURL as URL, username: accountNo, password: pwd)
        
        let read = GetDocumentOperation(id: selectID, databaseName: dbName){(response1, httpInfo1, error) in
            if let error1 = error {
                print("Encountered an error while reading a document. ERROR:\(error1)")
                dm.isflg=false
                 print ("dm.isflg========\(dm.isflg)")
              //  self.flagSelect = false
                
            } else {
                print ("Read document: \(response1)")
                //print("Version================\(response1?["_rev"])")
                if let vers=response1?["_rev"] {
                    print ("Version================\(vers)")
                    
                   dm.setdocvers(docvers: vers as! String)
                    print ("dm.docvers================\(dm.docvers)")
                    dm.isflg=true
                    print ("dm.isflg========\(dm.isflg)")
                    
                }
                
               // self.flagSelect = true
            }
        }
        
        client.add(operation:read)
        
        // print (read.revision!)
        
        // return self.flagSelect
    }
    
    func docDelect(deleteID :String, deleteVer: String ) {
        let client = CouchDBClient(url:cloudantURL as URL, username: accountNo, password: pwd)
        print("deleteID\(deleteID)")
        print("deleteVer\(deleteVer)")
        let delete = DeleteDocumentOperation(id: deleteID, revision :deleteVer,databaseName: dbName) {(response2, httpInfo2, error) in
            if let error2 = error {
                print("Encountered an error while deleting a document. ERROR:\(error2)")
               // self.flagDelete = false
                
            } else {
                print ("Document Deleted")
               // self.flagDelete = true
            }
        }
        client.add(operation:delete)
        //return self.flagDelete
        
    }
}

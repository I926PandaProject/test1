//
//  doclistViewController.swift
//  test1
//
//  Created by panda on 2017/03/24.
//  Copyright © 2017年 panda. All rights reserved.
//

import UIKit

var fds:[FakedateModel]=[]

func dateFromString(dateStr:String)->Date?{
    let dateFormatter=DateFormatter()
    dateFormatter.dateFormat="yyyy-MM-dd"
    let date=dateFormatter.date(from: dateStr)
    return date
    
}


class doclistViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fds=[FakedateModel(id:"D0001",title:"PONY申请书1",date: dateFromString(dateStr: "2017-03-21"),read: "未读")
            ,FakedateModel(id:"D0002",title:"PONY申请书2",date: dateFromString(dateStr: "2017-03-22"),read: "未读")
            ,FakedateModel(id:"D0003",title:"PONY申请书3",date: dateFromString(dateStr: "2017-03-23"),read: "已读")
            ,FakedateModel(id:"D0004",title:"PONY申请书4",date: dateFromString(dateStr: "2017-03-24"),read: "已读")
        ]
        
         ///按钮删除备用--一时注释
      //navigationItem.leftBarButtonItem=editButtonItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fds.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell=tableView.dequeueReusableCell(withIdentifier: "tablecell")
        
        let fd=fds[indexPath.row] as FakedateModel
        let id=cell?.viewWithTag(101) as! UILabel
        let title=cell?.viewWithTag(102) as! UILabel
        let date=cell?.viewWithTag(103) as! UILabel
        let isread=cell?.viewWithTag(104) as! UILabel
        id.text=fd.docid
        title.text=fd.doctitle
        isread.text=fd.isread
        //let local=NSLocale.current
        
        let dateFormatter=DateFormatter()
        dateFormatter.dateFormat="yyyy-MM-dd"
        
        date.text=dateFormatter.string(from: fd.docdate!)
        
        return cell!
    }
    //UItableviewDelegate
    
    ///添加手势删除功能
    
    //返回编辑类型，滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    //在这里修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "点击删除xxx"
    }
    
    //点击删除按钮的响应方法，在这里处理删除的逻辑
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            fds.remove(at: indexPath.row)
            self.tableview.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    /*
  public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle{
    
    tableView.allowsMultipleSelection=true
   return UITableViewCellEditingStyle(rawValue: 1)!
    }
*/
    
    ///按钮删除备用
    override func setEditing(_ editing: Bool, animated: Bool) {
     super.setEditing(editing,animated: animated)
        self.tableview.setEditing(editing,animated: animated)
    }
    
    
       @IBAction func close(segue : UIStoryboardSegue){
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

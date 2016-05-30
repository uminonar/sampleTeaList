//
//  ViewController.swift
//  sampleTeaList_1
//
//  Created by RIho OKubo on 2016/05/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var teaList:[NSDictionary]=[]
    
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        //-- json.txtファイルを読み込んで
        let path = NSBundle.mainBundle().pathForResource("json", ofType: "txt")
        let jsondata = NSData(contentsOfFile: path!)
        //-- 辞書データに変換して
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        //--  辞書データの個数だけ繰り返して表示する
        for data in jsonArray {
            print("[\(data["name"])]")
            teaList.append(data as! NSDictionary)
        }
    
    
    }
    
    //行数を設定する
    
    func tableView (tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return teaList.count
    }
    
    
    //行の中身を設定する
    func tableView (tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell{
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.brownColor()
        
        //矢印を右側につける
        cell.accessoryType = .DisclosureIndicator
        
        var teaName = teaList[indexPath.row]["name"] as! String
        
        cell.textLabel?.text = "\(teaName)"

        return cell
    }
    
    //行を選択した時の処理
    func tableView (tableView:UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)行目を選択")
        
        selectedIndex = indexPath.row
        performSegueWithIdentifier("showDetailView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var detailVC = segue.destinationViewController as! DetailViewController
        
        detailVC.dtSelectedIndex = selectedIndex
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


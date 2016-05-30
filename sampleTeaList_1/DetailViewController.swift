//
//  DetailViewController.swift
//  sampleTeaList_1
//
//  Created by RIho OKubo on 2016/05/08.
//  Copyright © 2016年 RIho OKubo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var dtSelectedIndex = -2
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        print(dtSelectedIndex)
        
        var path = NSBundle.mainBundle().pathForResource("json", ofType: "txt")
        var jsondata = NSData(contentsOfFile:path!)
        
        //-- 辞書データに変換して
        //let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        let jsonArray = (try! NSJSONSerialization.JSONObjectWithData(jsondata!, options: [])) as! NSArray
        
        let dic = jsonArray[dtSelectedIndex]
        
        myLabel.text = dic["name"] as! String
        myTextView.text = dic["description"] as! String
        myImageView.image = UIImage(named: dic["image"] as! String)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

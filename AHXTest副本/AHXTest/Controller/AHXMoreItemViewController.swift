//
//  AHXMoreItemViewController.swift
//  AHXTest
//
//  Created by qianfeng on 16/9/30.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit



class AHXMoreItemViewController: AHXBaseViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var moreLabel: UILabel!
    
    @IBOutlet weak var tableViewCellOne: UITableViewCell!
    
    @IBOutlet weak var tableViewCellTwo: UITableViewCell!
    
    
    @IBOutlet weak var tableViewCellThree: UITableViewCell!
    
    @IBOutlet weak var tableViewCellFour: UITableViewCell!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var tableViewCellUseOne: UITableViewCell!
    
    @IBOutlet weak var tableViewCellUseTwo: UITableViewCell!
    
    
    @IBOutlet weak var tableViewCellUseThre: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNaviTitle("关于i派党")
        
        
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

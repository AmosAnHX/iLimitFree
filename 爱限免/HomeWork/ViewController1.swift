//
//  ViewController1.swift
//  HomeWork
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController1: ViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextButton = UIButton(type: .System)
        nextButton.frame = CGRectMake(0, 100, 414, 50)
        nextButton.backgroundColor = UIColor.brownColor()
        nextButton.setTitle("铁甲钢拳", forState: .Normal)
        nextButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        nextButton.addTarget(self, action: "nextAction", forControlEvents: .TouchUpInside)
        self.view.addSubview(nextButton)

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        //let image = UIImage(named: "")
        
        self.view.backgroundColor = UIColor.whiteColor()
        
         }
    func nextAction(){
        //点开铁甲钢拳
        let vc6 = ViewController6()
        vc6.title = "应用详情"
        vc6.hidesBottomBarWhenPushed = false
        self.navigationController?.pushViewController(vc6, animated: true)
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

//
//  ViewController.swift
//  UI-1day-homework
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var views = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let photo = "/Users/qianfeng/Desktop/UI-1day/UI-1day-homework/UI-1day-homework/1_24.jpg"
        
        let img1 = UIImage(named: photo)
        let view1 = UIImageView(image: img1)
        view1.frame = CGRectMake(0, 0, 320, 480)
        view1.tag = 0
        self.view.addSubview(view1)
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "downSnow", userInfo: nil, repeats: true)
      
        }
    
        func createSnow()
        {
            let snow = "/Users/qianfeng/Desktop/UI-1day/UI-1day-homework/UI-1day-homework/snow.png"
            let img2 = UIImage(named: snow)
            let view2 = UIImageView(image: img2)
            view2.frame = CGRectMake(CGFloat(arc4random_uniform(320))%320, 0, 30, 30)
            let a = self.view.viewWithTag(0)
            a!.addSubview(view2)
            views.append(view2)
        }
    
    
        func downSnow(){
            createSnow()
            for v in views{
                let a = arc4random_uniform(3)
                switch a {
                case 0:v.center = CGPointMake(v.center.x, v.center.y+20)
                case 1:v.center = CGPointMake(v.center.x+8, v.center.y+10)
                case 2:v.center = CGPointMake(v.center.x-10, v.center.y+15)
                default:break
                }
                if v.center.y > 450{
                    v.removeFromSuperview()
                    let index = views.indexOf(v)
                    views.removeAtIndex(index!)
                }
            }
            print(views.count)
        }
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}























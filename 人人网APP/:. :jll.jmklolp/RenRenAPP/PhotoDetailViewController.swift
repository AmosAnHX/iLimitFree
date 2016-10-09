//
//  PhotoDetailViewController.swift
//  RenRenAPP
//
//  Created by KG on 16/9/1.
//  Copyright © 2016年 KG. All rights reserved.
//

import UIKit

class PhotoDetailViewController: BasicViewController {

    
    var images : [UIImage]?
    var indexPD : Int?
    
    let scrollView = UIScrollView()
    let pageCtl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = nil
        self.automaticallyAdjustsScrollViewInsets = true
        
        print(indexPD)
        print(images)
        
        self.navigationItem.title = "第\(indexPD! + 1)张照片"
        
        //
        scrollView.frame = UIScreen.mainScreen().bounds
        
        for i in 0..<images!.count{
            let image = images![i]
            let imageView = UIImageView()
            imageView.frame = UIScreen.mainScreen().bounds
            imageView.userInteractionEnabled = true
            let tap1 = UITapGestureRecognizer(target: self, action: "tap1Action:")
            imageView.addGestureRecognizer(tap1)
            let tap2 = UITapGestureRecognizer(target: self, action: "tap2Action:")
            imageView.addGestureRecognizer(tap2)
            tap1.requireGestureRecognizerToFail(tap2)
            
            imageView.image = image
            
            let sv = UIScrollView()
            sv.frame = CGRectMake(CGFloat(i*414), 0, 414, 736)
            sv.addSubview(imageView)
            
            sv.showsHorizontalScrollIndicator = false
            sv.showsVerticalScrollIndicator = false
            sv.maximumZoomScale = 3
            sv.minimumZoomScale = 1
            sv.bounces = false
            sv.delegate = self
            self.scrollView.addSubview(sv)
            
        }
        scrollView.contentSize = CGSizeMake(CGFloat((images?.count)!*414), 736)
        scrollView.contentOffset = CGPointMake(CGFloat(indexPD!*414), 0)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        pageCtl.frame = CGRectMake(0, 700, 414, 30)
        
        
        pageCtl.numberOfPages = (images?.count)!
        pageCtl.pageIndicatorTintColor = UIColor.blueColor()
        pageCtl.currentPageIndicatorTintColor = UIColor.redColor()
        pageCtl.enabled = true
        pageCtl.currentPage = NSInteger(indexPD!)
        self.view.addSubview(pageCtl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }
extension PhotoDetailViewController{
    func tap1Action(tap:UITapGestureRecognizer){
        if self.navigationController?.navigationBarHidden == true {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }else{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    func tap2Actin(tap:UITapGestureRecognizer){
        let currentPoint = tap.locationInView(tap.view)
        let zoomRect = CGRectMake(currentPoint.x-25, currentPoint.y-25, 50, 50)
        let sv = tap.view?.superview as! UIScrollView
        if sv.zoomScale > 1 {
            sv.setZoomScale(1, animated: true)
        }else{
            sv.zoomToRect(zoomRect, animated: true)
        }
    }
}

extension PhotoDetailViewController:UIScrollViewDelegate{
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let index = scrollView.contentOffset.x / 414
            pageCtl.currentPage = NSInteger(index)
            
            self.navigationItem.title = "第\(pageCtl.currentPage + 1)张图片"
            print(pageCtl.currentPage)
            
            for view in scrollView.subviews {
                let sv = view as! UIScrollView
                if sv.zoomScale > 1 {
                    sv.setZoomScale(1, animated: true)
                }
            }
        }
    }
}



















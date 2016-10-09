//
//  PhotoDetailViewController.swift
//  人人练习2
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//照片点击放大的视图




class PhotoDetailViewController: BasicViewController {

    //声明一个属性,用来接收传过来的数组
    var images : [UIImage]?
        //
    var indexCZ : Int?
    
    //第一个外层滚动视图
    let scrollView = UIScrollView()
    //页码指示器
    let pageCtl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Amos\(images)")
        print(indexCZ)
        
                
        self.navigationItem.titleView = nil   //?
        
        //关闭自动躲避
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        //配置外层滚动视图
        scrollView.frame = UIScreen.mainScreen().bounds
        
        //设置标题
        self.navigationItem.title = "第\(indexCZ! + 1)张图片"
         //设置透明度
        self.navigationController?.navigationBar.translucent = true
        
        //配置滚动视图的显示内容
        for i in 0..<images!.count{
            let image = images![i]
            //创建一个imageView用来去展示图片
            let imageView = UIImageView()
            imageView.frame = UIScreen.mainScreen().bounds
            //添加两个手势
            //打开图片视图交互
            imageView.userInteractionEnabled = true
            //单击:去隐藏显示导航条
            let tap1 = UITapGestureRecognizer(target: self, action: "tap1Action:")
            imageView.addGestureRecognizer(tap1)
            //双击:放大
            let tap2 = UITapGestureRecognizer(target: self, action: "tap2Action:")
            tap2.numberOfTapsRequired = 2  //设置点击次数
            imageView.addGestureRecognizer(tap2)
            //手势冲突,设置如果单击失败
            tap1.requireGestureRecognizerToFail(tap2)
            
            
            
            imageView.image = image
            
            //现在讲创建出来的视图每一张单独的去加到一个滚动视图上
            //然后去负责图片的放大
            let sv = UIScrollView()
            sv.frame = CGRectMake(CGFloat(i*414), 0, 414, 736)
            //将图片加到内层负责放大的滚动视图上
            sv.addSubview(imageView)
            //将提示条禁用
            sv.showsHorizontalScrollIndicator = false
            sv.showsVerticalScrollIndicator = false
            //设置缩放比例
            sv.maximumZoomScale = 3
            sv.minimumZoomScale = 1
            //禁止回弹
            sv.bounces = false
            
            //设置代理,目的为了获取缩放的视图
            sv.delegate = self
            
            
            
            //将内层小滚动视图加到外层大滚动视图上
            self.scrollView.addSubview(sv)
            
        }
        //设置外层滚动范围
        scrollView.contentSize = CGSizeMake(CGFloat((images!.count)*414), 736)
        
        scrollView.contentOffset = CGPointMake(CGFloat(indexCZ!*414), 0)
        //禁止外层提示条
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        //翻页 !!!!!!!
        scrollView.pagingEnabled = true
        //禁止回弹
        scrollView.bounces = false
        //在设置代理, 目的是为了翻页滚动
        scrollView.delegate = self
        
        
        self.view.addSubview(scrollView)
        
        //配置页码指示器
        pageCtl.frame = CGRectMake(0, 700, 414, 30)
        
        //设置总页数
        pageCtl.numberOfPages = (images?.count)!
        //设置颜色
        pageCtl.pageIndicatorTintColor = UIColor.blueColor()
        pageCtl.currentPageIndicatorTintColor = UIColor.redColor()
        //禁用响应
        pageCtl.enabled = true
        
        pageCtl.currentPage = NSInteger(indexCZ!)        //?????

        //将指示器加到view上
        self.view.addSubview(pageCtl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension PhotoDetailViewController{
    //手势的响应方法
    func tap1Action(tap:UITapGestureRecognizer){
        //判断如果导航条隐藏
        if self.navigationController?.navigationBarHidden == true {
            //将导航条显示
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }else{
            //导航条隐藏
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
    }
    //双击手势负责所当指定位置
    func tap2Action(tap:UITapGestureRecognizer){
        //首先获取当前手势作用一个点     tap.locationInView
        let currentPoint = tap.locationInView(tap.view)
        //来计算一个被缩放的区域
        let zoomRect = CGRectMake(currentPoint.x-25, currentPoint.y-25, 50, 50)
        //获取滚动视图来进行缩放
        let sv = tap.view?.superview as! UIScrollView
        //判断,如果当前是放大状态,那么让视图缩小到原始大小
        if sv.zoomScale > 1 {
            //变回原始大下
            sv.setZoomScale(1, animated: true)
        }else{
            //调用方法开始缩放
            sv.zoomToRect(zoomRect, animated: true)
        }
        
    }
}


//实现代理方法

extension PhotoDetailViewController:UIScrollViewDelegate{
    
    //
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        //返回视图里的视图
        return scrollView.subviews.first
    }
    
    func scrollViewDidEndDecelerating(scrollView : UIScrollView) {
        //在这里内层和外层滚动视图都设置了代理,都会响应代理方法
        //因为实现的功能是不一样的,所以实现协议方法时,需要将功能区分开
        //做判断
        if scrollView == self.scrollView{
            //如果判断是外层视图,计算当前页
            let index = scrollView.contentOffset.x / 414
            pageCtl.currentPage = NSInteger(index)

            //添加标题
            
            self.navigationItem.title = "第\(pageCtl.currentPage + 1)张图片"
            
            print(pageCtl.currentPage)
            
            
            //在翻页后将放大的图片复位
            for smellView in scrollView.subviews {
                //循环中取出的每一个视图都是内层的小滚动视图
                //判断小视图是否有缩放过,如果有放大,复位
                let sv = smellView as! UIScrollView
                //如果放大比例大于一,判断复位
                if sv.zoomScale > 1 {
                    //复位
                    sv.setZoomScale(1, animated: true)
                }
            }
        }
    }
}



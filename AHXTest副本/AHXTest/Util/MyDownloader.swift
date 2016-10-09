//
//  LFDownloader.swift
//  爱限免LimitFree
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 Amos. All rights reserved.
//

import UIKit

//
//下载的类型
//public enum DownloadType: Int {
//    
//    case Default //默认值
//    case Detail  //详情数据
//    case NearBy  //详情页的附近数据
//    
//}


protocol MyDownloaderDelegate: NSObjectProtocol {
    //下载失败
    func downloader(downloader: MyDownloader, didFailWitnError error: NSError)
    //下载成功
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData)
}



class MyDownloader: NSObject {
    
    //下载类型
    var type: Int?
    
    //代理属性
    weak var delegate: MyDownloaderDelegate?
    
    //下载的方法
    func downloadeWithURLString(urlString: String){
        //创建NSURL对象
        let url = NSURL(string: urlString)
        //创建NSURLRequest对象
        let request = NSURLRequest(URL: url!)
        //创建session对象
        let session = NSURLSession.sharedSession()
        //4.创建task对象
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            if let tmpError = error {
                //下载失败
                self.delegate?.downloader(self, didFailWitnError: tmpError)
            }else {
                let httpResponse = response as! NSHTTPURLResponse
                if httpResponse.statusCode == 200 {
                    //下载成功
                    self.delegate?.downloader(self, didFinishWithData: data!)
                }else {
                    //下载失败
                    let myError = NSError(domain: urlString, code: httpResponse.statusCode, userInfo: ["msg":"下载失败"])
                    self.delegate?.downloader(self, didFailWitnError: myError)
                }
            }
        }
        //5.下载
        task.resume()
        
    }
}

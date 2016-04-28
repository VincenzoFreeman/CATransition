//
//  NetworkTools.swift
//  CATransition
//
//  Created by wenzhiji on 16/4/28.
//  Copyright © 2016年 Manager. All rights reserved.
//
import UIKit

import AFNetworking
enum RequestType : String{
    case GIT = "GIT"
    case POST = "POST"
}
class NetworkTools: AFHTTPSessionManager {
    // 包装成单例
    static let shareInstance : NetworkTools = {
        let tool = NetworkTools()
        // 添加支持的语言格式
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        return tool
    }()
    
}
// MARK:- 封装网络请求
extension NetworkTools{
    
    func request(requestType : RequestType, urlString : String, parameters :[String : AnyObject], finished : (result : AnyObject?, error : NSError?)->()) ->(){
        // 成功闭包
        let succeedCallBack = { (task : NSURLSessionDataTask?, result : AnyObject?) -> Void in
            finished(result: result, error: nil)
        }
        // 失败闭包
        let failureCallBack = { (task : NSURLSessionDataTask?, error : NSError) -> Void in
            finished(result: nil, error: error)
        }
        if requestType == .GIT{
             GET(urlString, parameters: parameters, progress: nil, success: succeedCallBack ,  failure:failureCallBack)
        }else{
            POST(urlString, parameters: parameters, progress: nil, success: succeedCallBack, failure: failureCallBack)
        }
    }

}
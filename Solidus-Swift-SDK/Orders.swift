//
//  Orders.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/3/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class Orders: NSObject {

    class var EndPoint : String{
        return "/api/orders"
    }
    
    class func List (callback: (Bool, AnyObject) -> ()) {
        let currentService = self.EndPoint
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    // toDo: figure out how to search using Ransack
    class func Search (predicate: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = self.EndPoint+"?\(predicate)&token=\(Definitions.AUTH_TOKEN)"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Show (orderId: String, orderToken: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = self.EndPoint + "/\(orderId)?order_token=\(orderToken)" // new swift style to concat
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Create (orderInfo: AnyObject, callback: (Bool, AnyObject) -> ()) {
        let currentService = self.EndPoint
        RESTManager.sendData(orderInfo, service: currentService, method: "POST", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }

    //toDo: pending Address
    
    class func Empty (orderId: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = self.EndPoint + "/\(orderId)/empty"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "PUT", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
}

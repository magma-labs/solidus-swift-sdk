//
//  Orders.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/3/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class Orders: NSObject {

    class func List (callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Search (predicate: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders+"?\(predicate)&token=\(Definitions.AUTH_TOKEN)"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Show (orderId: String, orderToken: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders + "/\(orderId)?order_token=\(orderToken)" // new swift style to concat
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Create (orderInfo: AnyObject, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders
        RESTManager.sendData(orderInfo, service: currentService, method: "POST", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Empty (orderId: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders + "/\(orderId)/empty"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "PUT", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
}

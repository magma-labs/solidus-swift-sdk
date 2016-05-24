//
//  Orders.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/3/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class Orders: NSObject {

    class func list (callback: (Bool, AnyObject, NSError) -> ()) {
        let currentService = EndpointsBase.orders
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result, error) in
            callback(success, result, error)
        }
    }
    
    class func search (predicate: String, callback: (Bool, AnyObject, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders + "?\(predicate)&token=\(Definitions.AUTH_TOKEN)"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result, error) in
            callback(success, result, error)
        }
    }
    
    class func show (orderId: String, orderToken: String, callback: (Bool, AnyObject, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders + "/\(orderId)?order_token=\(orderToken)" // new swift style to concat
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result, error) in
            callback(success, result, error)
        }
    }
    
    class func create (orderInfo: AnyObject, callback: (Bool, AnyObject, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders
        RESTManager.sendData(orderInfo, service: currentService, method: "POST", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result, error) in
            callback(success, result, error)
        }
    }
    
    class func empty (orderId: String, callback: (Bool, AnyObject, AnyObject) -> ()) {
        let currentService = EndpointsBase.orders + "/\(orderId)/empty"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "PUT", accessToken: Definitions.AUTH_TOKEN, accessTokenInHeader: false) { (success, result, error) in
            callback(success, result, error)
        }
    }
}

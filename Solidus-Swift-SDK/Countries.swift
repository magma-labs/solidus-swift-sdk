//
//  Countries.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/2/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class Countries: NSObject {
    
    class func List (callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.countries
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Show (countryId: String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.countries + "/" + countryId
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func ListStates (countryId:String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.countries + "/" + countryId + "/states"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func ShowState (countryId:String, stateId:String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.countries + "/" + countryId + "/states/" + stateId
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
    
    class func Search (stateName:String, callback: (Bool, AnyObject) -> ()) {
        let currentService = EndpointsBase.countries + "?q[name_cont]=\(stateName)"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (success, result) in
            callback(success, result)
        }
    }
}
//
//  Countries.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/2/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class Countries: NSObject {
    
    class var EndPoint : String {
        return "/api/countries"
    }
    
    class func List (callback: (AnyObject) -> ()) {
        let currentService = self.EndPoint
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (result) in
            callback(result)
        }
    }
    
    class func Show (CountryId:String, callback: (AnyObject) -> ()) {
        let currentService = self.EndPoint+"/"+CountryId
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (result) in
            callback(result)
        }
    }
    
    class func ListStates (CountryId:String, callback: (AnyObject) -> ()) {
        let currentService = self.EndPoint+"/"+CountryId+"/states"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (result) in
            callback(result)
        }
    }
    
    class func ShowState (CountryId:String, StateId:String, callback: (AnyObject) -> ()) {
        let currentService = self.EndPoint+"/"+CountryId+"/states/"+StateId
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (result) in
            callback(result)
        }
    }
    
    class func Search (StateName:String, callback: (AnyObject) -> ()) {
        let currentService = self.EndPoint+"?q[name_cont]=\(StateName)"
        RESTManager.sendData(NSDictionary() as! Dictionary<String, String>, service: currentService, method: "GET", accessToken: "", accessTokenInHeader: false) { (result) in
            callback(result)
        }
    }
}
//
//  RESTManager.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/2/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation
import UIKit

class RESTManager: NSObject {
    class func sendData (data:AnyObject, service:String, method:String, accessToken:String, accessTokenInHeader:Bool, callback: (Bool, AnyObject, NSError) -> ()) {
        let strURL:String
        if(accessToken != ""){
            strURL = Definitions.SERVER_URL + "\(service)?token=\(accessToken)"
        } else {
            strURL = Definitions.SERVER_URL + service
        }
        let request = NSMutableURLRequest(URL: NSURL(string: strURL)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
        if method == "POST" {
            do{
                let jsonData = try NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted)
                let theJSONText = NSString(data: jsonData, encoding: NSASCIIStringEncoding)
                #if DEBUG
                    print("JSON string = \(theJSONText!)")
                #endif
                request.HTTPBody = jsonData
            } catch let error as NSError {
                print(error)
            }
        }
        
        let task = session.dataTaskWithRequest(request) { (result, response, error) -> Void in
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(result!, options: []) as? NSDictionary {
                    if (json.objectForKey("error") != nil) {
                        #if DEBUG
                            print("Debug Log info: \(response), \(error)")
                        #endif
                        if(error != nil) {
                            callback(false, json, error!)
                        } else {
                            let err = NSError(domain: "", code: 0, userInfo: nil)
                            callback(false, json, err)
                        }
                    } else {
                        #if DEBUG
                            print("Debug Log info: \(response), \(error)")
                        #endif
                        if(error != nil) {
                            callback(true, json, error!)
                        } else {
                            let err = NSError(domain: "", code: 0, userInfo: nil)
                            callback(true, json, err)
                        }
                    }
                } else {
                    let jsonStr = NSString(data: result!, encoding: NSUTF8StringEncoding)
                    #if DEBUG
                        print("Debug Log info: \(response), \(error)")
                    #endif
                    callback(false, jsonStr!, error!)
                }
            } catch let parseError {
                print(parseError)
                let jsonStr = NSString(data: result!, encoding: NSUTF8StringEncoding)
                #if DEBUG
                    print("Debug Log info: \(response), \(error)")
                #endif
                if let httpResponse = response as? NSHTTPURLResponse {
                    if(httpResponse.statusCode == 204) {
                        callback(true, jsonStr!, error!)
                    } else {
                        callback(false, jsonStr!, error!)
                    }
                }
            }
        }
        task.resume()
    }
}
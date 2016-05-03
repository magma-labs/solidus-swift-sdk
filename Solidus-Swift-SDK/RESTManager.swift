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
    class func sendData (data:Dictionary <String, String>, service:String, method:String, accessToken:String, accessTokenInHeader:Bool, callback: (AnyObject) -> ()) {
        let request = NSMutableURLRequest(URL: NSURL(string: Definitions.SERVER_URL + service)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if method != "GET" {
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(data, options: [])
        }
        
        let task = session.dataTaskWithRequest(request) { (result, response, error) -> Void in
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(result!, options: []) as? NSDictionary { // json properly fetched
                    if (json.objectForKey("error") != nil) {
                        callback(false)
                    }
                    else {
                        callback(json)
                    }
                } else {
                    let jsonStr = NSString(data: result!, encoding: NSUTF8StringEncoding)    // No error thrown, but not NSDictionary
                    print("Error could not parse JSON: \(jsonStr)")
                    callback(false)
                }
            } catch let parseError {
                print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                let jsonStr = NSString(data: result!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                callback(false)
            }
        }
        task.resume()
    }
}
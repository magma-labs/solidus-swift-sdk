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
    class func sendData (data:AnyObject, service:String, method:String, accessToken:String, accessTokenInHeader:Bool, callback: (Bool, AnyObject) -> ()) {
        let strURL:String
        if(accessToken != ""){
            strURL = Definitions.SERVER_URL + "\(service)?token=\(accessToken)"
        }
        else{
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
                print("JSON string = \(theJSONText!)")
                request.HTTPBody = jsonData
            } catch let error as NSError {
                print(error)
            }
        }
        
        let task = session.dataTaskWithRequest(request) { (result, response, error) -> Void in
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(result!, options: []) as? NSDictionary { // json properly fetched
                    if (json.objectForKey("error") != nil) {
                        #if DEBUG
                            print("Debug Log info: \(response), \(error)")
                        #endif
                        callback(false, json)
                    }
                    else {
                        #if DEBUG
                            print("Debug Log info: \(response), \(error)")
                        #endif
                        callback(true, json)
                    }
                } else {
                    let jsonStr = NSString(data: result!, encoding: NSUTF8StringEncoding)    // No error thrown, but not NSDictionary
                    #if DEBUG
                        print("Debug Log info: \(response), \(error)")
                    #endif
                    callback(false, jsonStr!)
                }
            } catch let parseError {
                print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
                let jsonStr = NSString(data: result!, encoding: NSUTF8StringEncoding)
                #if DEBUG
                    print("Debug Log info: \(response), \(error)")
                #endif
                if let httpResponse = response as? NSHTTPURLResponse {
                    if(httpResponse.statusCode == 204){ // this happens when emptying an order
                        callback(true, jsonStr!)
                    }
                    else{
                        callback(false, jsonStr!)
                    }
                }
            }
        }
        task.resume()
    }
}
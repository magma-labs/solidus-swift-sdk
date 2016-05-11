//
//  APICall.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/11/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
//

import Foundation

class APICall : NSObject {
    
    class func request(url: String, httpMethod: HTTPMethods, data: NSData?, successStatusCode: Int, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let enpointURL = NSURL(string: url)!
        let request = NSMutableURLRequest(URL: enpointURL)
        request.HTTPMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
        if let data = data {
            request.HTTPBody = data
        }
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == successStatusCode {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                        completionHandler(result: json, error: nil)
                    } catch let error as NSError {
                        completionHandler(result: nil, error: error)
                    }
                } else {
                    completionHandler(result: nil, error: error)
                }
            }
        }
        task.resume()
    }
}
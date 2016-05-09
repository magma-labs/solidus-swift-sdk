//
//  Products.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/5/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class Products: NSObject {


    func list(page: Int?, completionHandler: (result: NSDictionary?, error: NSError?) -> Void){
        
        var urlQuery : String
        if let page = page {
            urlQuery = "\(EndpointsBase.products)?page=\(String(page))"
        } else {
            urlQuery = "\(EndpointsBase.products)"
        }
        
        let url = NSURL(string: urlQuery)!
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("json", forHTTPHeaderField: "Data-Type")
        request.addValue(Definitions.AUTH_TOKEN, forHTTPHeaderField: "token")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                        completionHandler(result: json, error: error)
                    } catch let error as NSError {
                        completionHandler(result: nil, error: error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
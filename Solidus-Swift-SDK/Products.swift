//
//  Products.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/5/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
//

import Foundation

class Products: NSObject {


    func list(page: Int?, completionHandler: (result: NSDictionary?, error: NSError?) -> Void){
        
        var urlQuery : String
        if let page = page {
            urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)&page=\(String(page))"
        } else {
            urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)"
        }
        
        let url = NSURL(string: urlQuery)!
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
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
    
    func showByPermalink(permalink: String, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(permalink)?token=\(Definitions.AUTH_TOKEN)"
        let url = NSURL(string: urlQuery)!
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                        completionHandler(result: json, error: nil)
                    } catch let error as NSError {
                        completionHandler(result: nil, error: error)
                    }
                }
            }
        }
        task.resume()
    }
    
    func showById(productID: Int, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(String(productID))?token=\(Definitions.AUTH_TOKEN)"
        let url = NSURL(string: urlQuery)!
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                        completionHandler(result: json, error: nil)
                    } catch let error as NSError {
                        completionHandler(result: nil, error: error)
                    }
                }
            }
        }
        task.resume()
    }
    
    func create(dictAttributes: NSDictionary, completionHandler: (result: AnyObject?, error: NSError?) -> Void ) {
    
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)"
        let url = NSURL(string: urlQuery)!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dictAttributes, options: NSJSONWritingOptions.PrettyPrinted)
            request.HTTPBody = jsonData
        } catch let error as NSError {
            completionHandler(result: nil, error: error)
        }
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 201 {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                        completionHandler(result: json, error: nil)
                    } catch let error as NSError {
                        completionHandler(result: nil, error: error)
                    }
                }
            }
        }
        task.resume()
    }
    
    func delete(permalink: String, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
    
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(permalink)?token=\(Definitions.AUTH_TOKEN)"
        let url = NSURL(string: urlQuery)!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Data-Type")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if let error = error {
                completionHandler(result: nil, error: error)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 204 {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                        completionHandler(result: json, error: nil)
                    } catch let error as NSError {
                        completionHandler(result: nil, error: error)
                    }
                }
            }
        }
        task.resume()
    }
    
    
}
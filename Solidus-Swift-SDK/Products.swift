//
//  Products.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/5/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
//

import Foundation

class Products: NSObject {


    func list(page: Int?, arrQueries: [RansackQuery]?, completionHandler: (result: NSDictionary?, error: NSError?) -> Void){
        
        var urlQuery : String
        if let page = page {
            urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)&page=\(String(page))"
        } else {
            urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)"
        }
        
        if let arrQueries = arrQueries {
            let parameterizedQueries = UtilsManager.parameterizeRansackQueries(arrQueries)
            urlQuery = "\(urlQuery)\(parameterizedQueries)"
        }
        
        APICall.request(urlQuery, httpMethod: .get, data: nil, successStatusCode: 200) { (result, error) in
            completionHandler(result: result, error: error)
        }
    }
    
    func findByPermalink(permalink: String, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(permalink)?token=\(Definitions.AUTH_TOKEN)"
        
        APICall.request(urlQuery, httpMethod: .get, data: nil, successStatusCode: 200) { (result, error) in
            completionHandler(result: result, error: error)
        }
    }
    
    func findById(productID: Int, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(String(productID))?token=\(Definitions.AUTH_TOKEN)"
        
        APICall.request(urlQuery, httpMethod: .get, data: nil, successStatusCode: 200) { (result, error) in
            completionHandler(result: result, error: error)
        }
    }
    
    func create(dictAttributes: NSDictionary, completionHandler: (result: AnyObject?, error: NSError?) -> Void ) {
    
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)"
        let newProduct = ["product": dictAttributes]
        
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(newProduct, options: .PrettyPrinted)
            APICall.request(urlQuery, httpMethod: .post, data: jsonData, successStatusCode: 201, completionHandler: { (result, error) in
                completionHandler(result: result, error: error)
            })
        } catch let error as NSError {
            completionHandler(result: nil, error: error)
        }
    }
    
    func delete(permalink: String, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
    
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(permalink)?token=\(Definitions.AUTH_TOKEN)"
        
        APICall.request(urlQuery, httpMethod: .delete, data: nil, successStatusCode: 204) { (result, error) in
            completionHandler(result: result, error: error)
        }
    }
    
    func update(permalink: String, attributesToUpdate: NSDictionary, completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let parameterizedAttributes = UtilsManager.parameterizeAttributesDictionary("product", dictAttributes: attributesToUpdate)
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/\(permalink)?token=\(Definitions.AUTH_TOKEN)\(parameterizedAttributes)"
        
        APICall.request(urlQuery, httpMethod: .put, data: nil, successStatusCode: 200) { (result, error) in
            completionHandler(result: result, error: error)
        }
    }
    
    func search(arrQueries: [RansackQuery], completionHandler: (result: NSDictionary?, error: NSError?) -> Void ) {
        
        let parameterizedQueries = UtilsManager.parameterizeRansackQueries(arrQueries)
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)\(parameterizedQueries)"
        
        APICall.request(urlQuery, httpMethod: .get, data: nil, successStatusCode: 200) { (result, error) in
            completionHandler(result: result, error: error)
        }
    }

}
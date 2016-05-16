//
//  UtilsManager.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/13/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import Foundation

class UtilsManager: NSObject {
    
    class func parameterizeAttributesDictionary(prefix: String, dictAttributes: NSDictionary) -> String {
        
        var stringToReturn : String = ""
        
        for (attributeKey, attributeValue) in dictAttributes {
            let expectedCharset = NSCharacterSet.URLFragmentAllowedCharacterSet()
            let attributeValueString = attributeValue.stringByAddingPercentEncodingWithAllowedCharacters(expectedCharset)!
            stringToReturn =  "\(stringToReturn)&\(prefix)[\(attributeKey)]=\(attributeValueString)"
        }
        
        return stringToReturn
    }
    
}

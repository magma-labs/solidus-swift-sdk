//
//  UtilsManager.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/13/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
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
    
    class func parameterizeRansackQueries(arrQueries: [RansackQuery]) -> String {
    
        var stringToReturn : String = ""
        
        for ransackQuery in arrQueries {
            var dictAttributes : [String: String]
            switch ransackQuery.verb {
                case .SortAsc, .SortDesc :
                    dictAttributes = ["s": "\(ransackQuery.key)\(ransackQuery.verb.rawValue)"]
                default :
                    dictAttributes = ["\(ransackQuery.key)\(ransackQuery.verb.rawValue)": "\(ransackQuery.value)"]
            }
            stringToReturn = "\(stringToReturn)\(parameterizeAttributesDictionary("q", dictAttributes: dictAttributes))"
        }

        return stringToReturn
    }
    
}

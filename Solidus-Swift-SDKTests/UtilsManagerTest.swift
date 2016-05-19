//
//  UtilsManagerTest.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/13/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
//

import XCTest

class UtilsManagerTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParameterizeAttributesDictionary() {

        let productAttributes = ["price": "69.99",
                                "name": "Swift softy hoodie"]
        let parameterizedString = UtilsManager.parameterizeAttributesDictionary("product", dictAttributes: productAttributes)
        XCTAssertEqual(parameterizedString, "&product[price]=69.99&product[name]=Swift%20softy%20hoodie")
    }
 
}

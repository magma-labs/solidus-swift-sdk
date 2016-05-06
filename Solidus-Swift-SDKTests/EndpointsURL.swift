//
//  EndpointsURL.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/3/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import XCTest

class EndpointsURL: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsEndpointURL() {
        let result = EndpointsBase.orders
        XCTAssertEqual(result, "/api/orders")
    }

}

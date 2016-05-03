//
//  Solidus_Swift_SDKTests.swift
//  Solidus-Swift-SDKTests
//
//  Created by Omar Guzman on 5/2/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import XCTest
@testable import Solidus_Swift_SDK

class Solidus_Swift_SDKTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountries() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.List { (result) in
            if((result as? Bool) != nil) {
                XCTAssertFalse(result as! Bool, "service error")
                asyncExpectation.fulfill()
            }
            else {
                XCTAssertNotNil(result, "service passed")
                asyncExpectation.fulfill()
            }
            
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testCountryShow() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.Show("117") { (result) in
            if((result as? Bool) != nil) {
                XCTAssertFalse(result as! Bool, "service error")
                asyncExpectation.fulfill()
            }
            else {
                XCTAssertNotNil(result, "service passed")
                asyncExpectation.fulfill()
            }
            
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
}

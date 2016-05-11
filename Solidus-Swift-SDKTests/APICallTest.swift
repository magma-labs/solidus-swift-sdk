//
//  APICallTest.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/11/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
//

import XCTest

class APICallTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAPICallGet() {
        let expectation = expectationWithDescription("apiCallGet")
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)"
        
        APICall.request(urlQuery, httpMethod: .get, data: nil, successStatusCode: 200) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
                let currentPage = result!["current_page"]!.integerValue
                XCTAssertGreaterThanOrEqual(currentPage, 1)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    func testAPICallPost() {
        let expectation = expectationWithDescription("apiCallPost")
        
        let newProductAttributes: [String:AnyObject] = ["name": "Swift soft hoodie",
                                                        "price": "49.99",
                                                        "shipping_category_id": "1"]
        let newProduct = ["product": newProductAttributes]
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)?token=\(Definitions.AUTH_TOKEN)"
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(newProduct, options: NSJSONWritingOptions.PrettyPrinted)
            
            APICall.request(urlQuery, httpMethod: .post, data: jsonData, successStatusCode: 201) { (result, error) in
                if let error = error {
                    print("\n Log infor error: \(error.localizedDescription)")
                } else {
                    XCTAssertEqual(error, nil)
                }
                expectation.fulfill()
            }
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    
    func testAPICallDelete() {
        let expectation = expectationWithDescription("apiCallDelete")
        
        let urlQuery = "\(Definitions.SERVER_URL)\(EndpointsBase.products)/swift-soft-hoodie?token=\(Definitions.AUTH_TOKEN)"
        
        APICall.request(urlQuery, httpMethod: .delete, data: nil, successStatusCode: 204) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("waitForExpectationTimeout errored: \(error)")
            }
        }

    }
    
    

}

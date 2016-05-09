//
//  Products.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/3/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import XCTest

class ProductsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAllProducts() {
        let expectation = expectationWithDescription("getAllProducts")
        let products = Products()
        
        products.list(nil) { (result, error) in
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
    
    func testShowProductByPermalink() {
        let expectation = expectationWithDescription("showProductByPermalink")
        let products = Products()
        
        products.showByPermalink("ruby-on-rails-tote") { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                XCTAssertEqual(error, nil)
                let productId = result!["id"]!.integerValue
                XCTAssertGreaterThanOrEqual(productId, 1)
                print(result)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    func testShowProductById() {
        let expectation = expectationWithDescription("showProductById")
        let products = Products()
        let expectedProductId = 2
        
        products.showProductById(expectedProductId) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
                let productId = result!["id"]!.integerValue
                XCTAssertEqual(productId, expectedProductId)
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
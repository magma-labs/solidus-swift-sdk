//
//  Products.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/3/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
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
        
        products.findByPermalink("ruby-on-rails-tote") { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
                XCTAssertEqual(error, nil)
                let productId = result!["id"]!.integerValue
                XCTAssertGreaterThanOrEqual(productId, 1)
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
        let expectedProductID = 2
        
        products.findById(expectedProductID) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
                let productID = result!["id"]!.integerValue
                XCTAssertEqual(productID, expectedProductID)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    func testCreateProduct() {
        let expectation = expectationWithDescription("createProduct")
        let products = Products()
        let newProductAttributes: [String: AnyObject] = ["name": "Swift soft hoodie",
                                              "price": "49.99",
                                              "shipping_category_id": "1"]
        
        products.create(newProductAttributes) { (result, error) in
            if let error = error {
                print("\n Log info error: \(error.localizedDescription)")
            } else {
                XCTAssertEqual(error, nil)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("\n waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    func testDeleteProduct() {
        let expectation = expectationWithDescription("deleteProduct")
        let products = Products()
        
        products.delete("swift-soft-hoodie") { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("\n waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    func testUpdateProduct() {
        let expectation = expectationWithDescription("updateProduct")
        let products = Products()
        let productAttributesToUpdate: [String: String] = ["description": "Updating description of this product",
                                                              "price": "49.99"]
        
        products.update("apache-baseball-jersey", attributesToUpdate: productAttributesToUpdate) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("\n waitForExpectationTimeout errored: \(error)")
            }
        }
    }
    
    
    func testSearchProducts() {
        let expectation = expectationWithDescription("searchProducts")
        let products = Products()
        let expectedProductsCount = 3
        
        let searchQueries : [RansackQuery] = [RansackQuery(key: "name", verb: .Contains, value: "jersey"),
                                              RansackQuery(key: "name", verb: .SortAsc, value: "")]
        
        products.search(searchQueries) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                XCTAssertEqual(error, nil)
                let productsCount = result!["count"]!.integerValue
                XCTAssertEqual(productsCount, expectedProductsCount)
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                XCTFail("\n waitForExpectationTimeout errored: \(error)")
            }
        }
    
    }
}
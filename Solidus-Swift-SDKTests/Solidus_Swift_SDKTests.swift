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
    
    // countries tests
    func testCountriesList() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.List { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                let count = result.objectForKey("count") as! Int
                if(count > 0){
                    XCTAssertGreaterThan(count, 0) // result has info
                }
                else{
                    XCTAssertEqual(count, 0) // result has no info
                }
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(20) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testCountriesShow() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.Show("157") { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                let countryName = result.objectForKey("name") as? String
                XCTAssertEqual(countryName, "Mexico")
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testCountriesListState() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.ListStates("1") { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                let states = result.objectForKey("states")
                XCTAssertNotNil(states)
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testCountriesShowState() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.ShowState("157", stateId: "2249") { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                let stateAbbr = result.objectForKey("abbr") as? String
                XCTAssertEqual(stateAbbr, "MIC")
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testCountriesSearch() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Countries.Search("Mexico") { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                let count = result.objectForKey("count") as! Int
                if(count > 0){
                    XCTAssertGreaterThan(count, 0) // result has info
                }
                else{
                    XCTAssertEqual(count, 0) // result has no info
                }
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    // orders testing
    func testOrdersList() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Orders.List { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                let currentPage = result.objectForKey("current_page") as! Int
                if(currentPage > 0){
                    XCTAssertGreaterThan(currentPage, 0) // result has info
                }
                else{
                    XCTAssertEqual(currentPage, 0) // result has no info
                }
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testOrdersCreate() {
        let asyncExpectation = expectationWithDescription("async call")
        
        let params = ["order":["line_items":["0":["variant_id":"1", "quantity":"10"]]]]
        Orders.Create(params) { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                XCTAssertNotNil(result)
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testOrdersEmpty() {
        let asyncExpectation = expectationWithDescription("async call")
        
        Orders.Empty("R888564437") { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testOrdersSearchByOrderNumber() {
        let asyncExpectation = expectationWithDescription("async call")
        
        let predicate = "q[number]=R888564437"
        Orders.Search(predicate) { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
    
    func testOrdersSearchByEmail() {
        let asyncExpectation = expectationWithDescription("async call")
        
        let predicate = "q[email_cont]=spree@example.com"//"q[number]=R614298791"
        Orders.Search(predicate) { (success, result) in
            if(success){
                XCTAssert(success, "service success")
                asyncExpectation.fulfill()
            }
            else{
                XCTAssertFalse(success, "service unsuccess") // service fails but fullfills expectation to pass test
                asyncExpectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "something went wrong")
        }
    }
}

//
//  JsonTest.swift
//  GoStructTests
//
//  Created by kingcheung on 1/9/2019.
//  Copyright © 2019 kingcheung. All rights reserved.
//

import XCTest
@testable import GoStruct


class JsonTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let word1 = "a_b_c"
        let word2 = "Abc_a"
        
        XCTAssertEqual(Json.camelCase(key: word1), "ABC", "错误")
        XCTAssertEqual(Json.camelCase(key: word2), "AbcA", "错误")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

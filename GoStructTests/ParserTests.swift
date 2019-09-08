//
//  ParserTests.swift
//  GoStructTests
//
//  Created by kingcheung on 2/9/2019.
//  Copyright © 2019 kingcheung. All rights reserved.
//

import XCTest

@testable import GoStruct

class ParserTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let sql = "CREATE TABLE new_table(col int NOT NULL); "
        let parse = Parser(sql: sql)
        dump(parse.token)
        //XCTAssertEqual(parse.token, ["select", "*", "from", "test"], "token is error")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

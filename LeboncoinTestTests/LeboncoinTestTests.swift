//
//  LeboncoinTestTests.swift
//  LeboncoinTestTests
//
//  Created by JC on 15/04/2021.
//

import XCTest
@testable import LeboncoinTest

class LeboncoinTestTests: XCTestCase {
    
    var smallAds = [SSmallAd]()
    var allSmallAds = [SSmallAd]()
    var vc = LBCAdListViewcontroller()
    
    let json : [[String: Any]] = [["images_url": ["small": "https://ad-small.jpg", "thumb" : "https://ad-thumb.jpg"], "creation_date": "2019-11-05T15:56:59+0000", "price": 140.0, "id": 1461267313, "description": "Magnifique Statuette", "is_urgent": false, "title": "Statue homme noir assis", "category_id": 4], ["images_url": ["small": "https://ad-small.jpg", "thumb" : "https://ad-thumb.jpg"], "creation_date": "2019-11-06T15:56:59+0000", "price": 140.0, "id": 1461267313, "description": "Magnifique Statuette", "is_urgent": true, "title": "Statue homme noir assis", "category_id": 5]]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

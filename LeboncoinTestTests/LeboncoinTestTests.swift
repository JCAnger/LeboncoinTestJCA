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
    let httpManagerVC = LBCHttpManager()
    
    let json : [[String: Any]] = [["images_url": ["small": "https://ad-small.jpg", "thumb" : "https://ad-thumb.jpg"], "creation_date": "2019-11-05T15:56:59+0000", "price": 140.0, "id": 1234, "description": "Magnifique Statuette", "is_urgent": false, "title": "Statue homme noir assis", "category_id": 4], ["images_url": ["small": "https://ad-small.jpg", "thumb" : "https://ad-thumb.jpg"], "creation_date": "2019-11-06T15:56:59+0000", "price": 140.0, "id": 5678, "description": "Magnifique Statuette", "is_urgent": true, "title": "Statue homme noir assis", "category_id": 5]]
    
    let dataCat = "WwogIHsKICAgICJpZCI6IDEsCiAgICAibmFtZSI6ICJWw6loaWN1bGUiCiAgfSwKICB7CiAgICAiaWQiOiAyLAogICAgIm5hbWUiOiAiTW9kZSIKICB9LAogIHsKICAgICJpZCI6IDMsCiAgICAibmFtZSI6ICJCcmljb2xhZ2UiCiAgfSwKICB7CiAgICAiaWQiOiA0LAogICAgIm5hbWUiOiAiTWFpc29uIgogIH0sCiAgewogICAgImlkIjogNSwKICAgICJuYW1lIjogIkxvaXNpcnMiCiAgfSwKICB7CiAgICAiaWQiOiA2LAogICAgIm5hbWUiOiAiSW1tb2JpbGllciIKICB9LAogIHsKICAgICJpZCI6IDcsCiAgICAibmFtZSI6ICJMaXZyZXMvQ0QvRFZEIgogIH0sCiAgewogICAgImlkIjogOCwKICAgICJuYW1lIjogIk11bHRpbcOpZGlhIgogIH0sCiAgewogICAgImlkIjogOSwKICAgICJuYW1lIjogIlNlcnZpY2UiCiAgfSwKICB7CiAgICAiaWQiOiAxMCwKICAgICJuYW1lIjogIkFuaW1hdXgiCiAgfSwKICB7CiAgICAiaWQiOiAxMSwKICAgICJuYW1lIjogIkVuZmFudHMiCiAgfQpdCg=="
    
    let categories = [["id": 1234, "name": "Maison"], ["id": 5678, "name": "Voiture"]]

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
    
    func testGetCategoriesFromDataCount() {
        let data = Data(base64Encoded: dataCat)
        let categories : [SCategory] = httpManagerVC.getCategoriesFromData(data: data!)
        XCTAssertTrue(categories.count == 11)
    }
    
    func testGetCategoriesFromDataid() {
        let data = Data(base64Encoded: dataCat)
        let categories : [SCategory] = httpManagerVC.getCategoriesFromData(data: data!)
        XCTAssertTrue(categories[0].categoryName == "Véhicule")
    }
    
    func testGetCategoriesFromDataName() {
        let data = Data(base64Encoded: dataCat)
        let categories : [SCategory] = httpManagerVC.getCategoriesFromData(data: data!)
        XCTAssertTrue(categories[10].num == 11)
    }
    
    func getAdsFromDataTitle() {
        
    }
    
}

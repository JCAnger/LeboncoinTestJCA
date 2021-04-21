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
    let managerVC = LBCManager()
    let tableViewCell =  LBCAdTableViewCell()
    
    let json : [[String: Any]] = [["images_url": ["small": "https://ad-small1.jpg", "thumb" : "https://ad-thumb1.jpg"], "creation_date": "2019-11-05T15:56:59+0000", "price": 140.0, "id": 1234, "description": "Magnifique Statuette", "is_urgent": false, "title": "Statue homme noir assis", "category_id": 4, "siret": "111222333"], ["images_url": ["small": "https://ad-small2.jpg", "thumb" : "https://ad-thumb2.jpg"], "creation_date": "2019-11-06T15:56:59+0000", "price": 140.0, "id": 5678, "description": "Magnifique Statuette", "is_urgent": true, "title": "Statue homme noir assis", "category_id": 5, "siret": "444555666"]]
    
    let dataCat = "WwogIHsKICAgICJpZCI6IDEsCiAgICAibmFtZSI6ICJWw6loaWN1bGUiCiAgfSwKICB7CiAgICAiaWQiOiAyLAogICAgIm5hbWUiOiAiTW9kZSIKICB9LAogIHsKICAgICJpZCI6IDMsCiAgICAibmFtZSI6ICJCcmljb2xhZ2UiCiAgfSwKICB7CiAgICAiaWQiOiA0LAogICAgIm5hbWUiOiAiTWFpc29uIgogIH0sCiAgewogICAgImlkIjogNSwKICAgICJuYW1lIjogIkxvaXNpcnMiCiAgfSwKICB7CiAgICAiaWQiOiA2LAogICAgIm5hbWUiOiAiSW1tb2JpbGllciIKICB9LAogIHsKICAgICJpZCI6IDcsCiAgICAibmFtZSI6ICJMaXZyZXMvQ0QvRFZEIgogIH0sCiAgewogICAgImlkIjogOCwKICAgICJuYW1lIjogIk11bHRpbcOpZGlhIgogIH0sCiAgewogICAgImlkIjogOSwKICAgICJuYW1lIjogIlNlcnZpY2UiCiAgfSwKICB7CiAgICAiaWQiOiAxMCwKICAgICJuYW1lIjogIkFuaW1hdXgiCiAgfSwKICB7CiAgICAiaWQiOiAxMSwKICAgICJuYW1lIjogIkVuZmFudHMiCiAgfQpdCg=="
    
    let categories = [["num": 4, "categoryName": "Maison"], ["num": 5, "categoryName": "Voiture"]]

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
    
    // MARK: Tests LBCHttpManager
    func testGetCategoriesFromDataName() {
        let data = Data(base64Encoded: dataCat)
        let categories : [SCategory] = httpManagerVC.getCategoriesFromData(data: data!)
        XCTAssertTrue(categories[10].num == 11)
    }
    
    func testGetAdsFromDataDate() {
        let dateFormatter = DateFormatter()
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        let date = dateFormatter.string(from: ads[0].creationDate)
        XCTAssertTrue(date == "2019-11-05T15:56:59+0000")
    }
    
    func testGetAdsFromDataPrice() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].price == 140)
    }
    
    func testGetAdsFromDataTitle() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].title == "Statue homme noir assis")
    }
    
    func testGetAdsFromDataId() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].id == 1234)
    }
    
    func testGetAdsFromDataCatId() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].categoryId == 4)
    }
    
    func testGetAdsFromDataDesc() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].description == "Magnifique Statuette")
    }
    
    func testGetAdsFromDataIsUrg() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].isUrgent == false)
    }
    
    func testGetAdsFromDataSiret() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].siret == "111222333")
    }
    
    func testGetAdsFromDataIsImgThumb() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].imagesUrl?.thumb == "https://ad-thumb.jpg")
    }
    
    func testGetAdsFromDataIsImgSmall() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        XCTAssertTrue(ads[0].imagesUrl?.small == "https://ad-small.jpg")
    }
    
    // MARK: Tests LBCManager
    func testUpdateWithCategories() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        let dataC = Data(base64Encoded: dataCat)
        managerVC.categories = httpManagerVC.getCategoriesFromData(data: dataC!)
        let adsWithCat = managerVC.updateWithCategories(result: ads)
        XCTAssertTrue(adsWithCat[0].cat == "Maison")
    }
    
    //MARK: Test LBCAdTableViewCell
    func testUpdateCellWithAdTitle() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        tableViewCell.updateCellWithAd(theSmallAd: ads[0])
        XCTAssertTrue(tableViewCell.title.text == "Statue homme noir assis")
    }
    
    func testUpdateCellWithAdPrice() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        tableViewCell.updateCellWithAd(theSmallAd: ads[0])
        XCTAssertTrue(tableViewCell.price.text == "140,00 €")
    }
    
    func testUpdateCellWithAdDate() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        tableViewCell.updateCellWithAd(theSmallAd: ads[0])
        XCTAssertTrue(tableViewCell.date.text == "05/11/2019")
    }
    
    func testUpdateCellWithAdCat() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        let dataC = Data(base64Encoded: dataCat)
        managerVC.categories = httpManagerVC.getCategoriesFromData(data: dataC!)
        let adsWithCat = managerVC.updateWithCategories(result: ads)
        tableViewCell.updateCellWithAd(theSmallAd: adsWithCat[0])
        XCTAssertTrue(tableViewCell.category.text == "Maison")
    }
    
    func testUpdateCellWithAdUrgentF() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        tableViewCell.updateCellWithAd(theSmallAd: ads[0])
        XCTAssertTrue(tableViewCell.urgent.backgroundColor == .clear)
    }
    
    func testUpdateCellWithAdUrgentT() {
        let data = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys)
        let ads : [SSmallAd] = httpManagerVC.getAdsFromData(data: data!)
        tableViewCell.updateCellWithAd(theSmallAd: ads[1])
        XCTAssertTrue(tableViewCell.urgent.backgroundColor == .orange)
    }
}

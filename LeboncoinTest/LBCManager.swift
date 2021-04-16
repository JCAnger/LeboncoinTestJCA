//
//  LBCManager.swift
//  LeboncoinTest
//
//  Created by JC on 16/04/2021.
//

import UIKit

class LBCManager: NSObject {
    
    var categories = [Categories]()
    
    let manager = LBCHttpManager.init()
    
    func getAdsFromUrl(success : @escaping (_ result: [SmallAd]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        
        self.getCategoriesFromUrl { (result: [Categories]) in
            //
            self.categories = result
            self.manager.getSmallAdsWithSuccess(success: { (json) in
                let ads = self.convertToSmallAdsArray(results: json)
                success(ads)
            }) { (error : NSError) in
                print("error")
                failure(error)
            }
        } failure: { (error : NSError) in
            failure(error)
        }
    }
    
    
    func getCategoriesFromUrl(success : @escaping (_ result: [Categories]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        manager.getCategoriesWithSuccess(success: { (json : [[String : Any]]) in
            let categories = self.convertToCategoriesArray(results: json)
            success(categories)
        }) { (error : NSError) in
            print("error categories") // TODO
            failure(error)
        }
    }
    
    func convertToSmallAdsArray(results: [[String:Any]]) -> [SmallAd] {
        var allSmallAds = [SmallAd]()
        if results.count > 0 && categories.count > 0 {
            for object: [String: Any] in results {
                let newAd = SmallAd.init(smallAd: object)
                newAd.cat = categories[newAd.numCat - 1].category
                allSmallAds.append(newAd)
            }

            return allSmallAds
        }
        else {
            return []
        }
    }
    
    func convertToCategoriesArray(results: [[String:Any]]) -> [Categories]  {
        if results.count > 0 {
            for object: [String: Any] in results {
                let cat = Categories.init(cat:object)
                categories.append(cat)
            }
        }
        return categories
    }
    

}

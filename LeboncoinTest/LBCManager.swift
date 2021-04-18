//
//  LBCManager.swift
//  LeboncoinTest
//
//  Created by JC on 16/04/2021.
//

import UIKit

class LBCManager: NSObject {
    
    var categories = [SCategories]()
    
    let manager = LBCHttpManager.init()
    
    func getAdsFromUrl(success : @escaping (_ result: [SSmallAd]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        
        self.getCategoriesFromUrl { (result: [SCategories]) in
            //
            self.categories = result
            self.manager.getSmallAdsWithSuccess(success: { (result) in
                let ads = self.updateWithCategories(result: result)
                success(ads)
            }) { (error : NSError) in
                print("error")
                failure(error)
            }
        } failure: { (error : NSError) in
            failure(error)
        }
    }
    
    
    func getCategoriesFromUrl(success : @escaping (_ result: [SCategories]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        manager.getCategoriesWithSuccess(success: { (result : [SCategories]) in
            success(result)
        }) { (error : NSError) in
            print("error categories") // TODO
            failure(error)
        }
    }
    
    func updateWithCategories(result : [SSmallAd]) -> [SSmallAd]{
        for var newAd: SSmallAd in result {
            newAd.cat = categories[newAd.category_id - 1].name
        }
        
        return result
    }
   
}

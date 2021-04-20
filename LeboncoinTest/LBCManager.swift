//
//  LBCManager.swift
//  LeboncoinTest
//
//  Created by JC on 16/04/2021.
//


import UIKit

class LBCManager: NSObject {
    
    var categories = [SCategory]()
    
    let httpManager = LBCHttpManager.init()
    
    func getAdsFromUrl(success : @escaping (_ result: [SSmallAd]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        
        self.getCategoriesFromUrl { (result: [SCategory]) in
            //
            self.categories = result
            self.httpManager.getSmallAdsWithSuccess(success: { (result) in
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
    
    
    func getCategoriesFromUrl(success : @escaping (_ result: [SCategory]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        httpManager.getCategoriesWithSuccess(success: { (result : [SCategory]) in
            success(result)
        }) { (error : NSError) in
            print("error categorys") // TODO
            failure(error)
        }
    }
    
    func updateWithCategories(result : [SSmallAd]) -> [SSmallAd]{ // ???
        var newResult = [SSmallAd]()
        for var newAd: SSmallAd in result {
            newAd.cat = categories[newAd.categoryId - 1].categoryName as String
            newResult.append(newAd)
        }
        
        return newResult
    }
   
}

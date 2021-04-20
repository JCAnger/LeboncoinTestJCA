//
//  LBCHttpManager.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import UIKit

class LBCHttpManager: NSObject {
    
    let session = URLSession.shared
    
    let lbcUrl = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")!
    let categoriesUrl = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json")!

    
    func getSmallAdsWithSuccess(success : @escaping (_ result: [SSmallAd]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        let task = URLSession.shared.dataTask(with: lbcUrl, completionHandler: { data, response, error in
        
            if data != nil {
                let result = self.getAdsFromData(data: data!)
                success (result)
            }
            
            if error != nil {
                print("Failed to load: \(error!.localizedDescription)")
                failure(error! as NSError)
            }
            
            })
        task.resume()
    }

    
    func getCategoriesWithSuccess(success : @escaping (_ result: [SCategory]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        let task = URLSession.shared.dataTask(with: categoriesUrl, completionHandler: { data, response, error in
            
            if data != nil {
                let result = self.getCategoriesFromData(data: data!)
                success (result)
            }
            
            if error != nil {
                print("Failed to load: \(error!.localizedDescription)")
                failure(error! as NSError)
            }
        
            
            })
        task.resume()
        
       //
    }
    
    
    func getAdsFromData(data :  Data) -> [SSmallAd] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.yyyyMMdd)
        if let result = try? decoder.decode([SSmallAd].self, from: data) {
            return result
        }
        return []
    }
    
    func getCategoriesFromData(data :  Data) -> [SCategory] {
        if let result = try? JSONDecoder().decode([SCategory].self, from: data) {
            return result
        }
        return []
    }
}

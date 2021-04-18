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
        let task = session.dataTask(with: lbcUrl, completionHandler: { data, response, error in
        
            if let result = try? JSONDecoder().decode([SSmallAd].self, from: data!) {
                print(result)
                success(result)
            }
            if error != nil {
                print("Failed to load: \(error!.localizedDescription)")
                failure(error! as NSError)
            }
            
            })
        task.resume()
    }

    
    func getCategoriesWithSuccess(success : @escaping (_ result: [SCategories]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        let task = session.dataTask(with: categoriesUrl, completionHandler: { data, response, error in
            if let result = try? JSONDecoder().decode([SCategories].self, from: data!) {
                success(result)
            }
            
            if error != nil {
                print("Failed to load: \(error!.localizedDescription)")
                failure(error! as NSError)
            }
            //
            
            })
        task.resume()
        
       //
    }
}

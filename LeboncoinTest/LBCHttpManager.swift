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

    func getClassifedIdFromLbc(completion: @escaping (_ result: [[String: Any]]) -> Void) {
        let task = session.dataTask(with: lbcUrl, completionHandler: { data, response, error in

            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                    // try to read out a string array
                    print(json[0])
                    completion(json)
                    
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
            
            })
        task.resume()
    }

    
    func getCategoriesWithSuccess(success : @escaping (_ result: [[String: Any]]) -> Void, failure : @escaping (_ error : NSError) -> Void) {
        let task = session.dataTask(with: categoriesUrl, completionHandler: { data, response, error in

            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                    // try to read out a string array
                    print(json)
                    success(json)
                    
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                failure(error)
            }
            
            })
        task.resume()
        
       //
    }
}

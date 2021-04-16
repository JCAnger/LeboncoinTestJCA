//
//  LBCAd.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import Foundation

class ImageUrl {
    var small: String
    var thumb: String
    init(image:[String:Any]){
        self.small = image["small"] as? String ?? ""
        self.thumb = image["thumb"] as? String ?? ""
    }
}

class Categories {
    var num: NSNumber
    var category: String
    init(cat:[String:Any]) {
        num = cat["id"] as! NSNumber
        category = cat["name"] as! String
    }
    func name() -> String {
        return self.category
    }
    
}

class SmallAd {
    var id: Int
    var numCat: Int
    var cat: String
    var title: String
    var description: String
    var image: ImageUrl
    var price: Double
    var date: Date
    var urgent: Bool
    var siret: String
    
    init(smallAd: [String: Any]) {
        self.id = smallAd["id"] as! Int
        self.numCat = smallAd["category_id"] as! Int
        self.cat = ""
        self.title = smallAd["title"] as! String
        self.description = smallAd["description"] as! String
        self.price = smallAd["price"] as! Double
        self.image = ImageUrl.init(image: smallAd["images_url"] as! [String:Any])
        self.urgent = smallAd["is_urgent"] as? Bool ?? false
        self.siret = smallAd["siret"] as? String ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX" // 2019-11-05T15:56:59+0000
        self.date = dateFormatter.date(from: smallAd["creation_date"] as! String)!
    }
        
}


    
    


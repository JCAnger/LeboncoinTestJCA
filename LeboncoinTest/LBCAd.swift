//
//  LBCAd.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import Foundation

struct SSmallAd : Decodable {
    var id: Int
    var category_id: Int
    var cat: String?
    var title: String
    var description: String
    var images_url: SImageUrl?
    var price: Double
    var creation_date: String
    var is_urgent: Bool
    var siret: String?
}

    
struct SImageUrl : Decodable {
    var small: String?
    var thumb: String?
}
    
struct SCategories : Decodable {
    var id: Int
    var name: String
}

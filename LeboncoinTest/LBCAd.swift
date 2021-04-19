//
//  LBCAd.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import Foundation

struct SSmallAd : Decodable {
    var id: Int
    var categoryId: Int
    var cat: String?
    var title: String
    var description: String
    var imagesUrl: SImageUrl?
    var price: Double
    var creationDate: Date
    var isUrgent: Bool
    var siret: String?
    
    enum CodingKeys : String, CodingKey {
        case id
        case categoryId = "category_id"
        case cat
        case title
        case description
        case imagesUrl = "images_url"
        case price
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case siret
            
    }
}


extension DateFormatter {
  static let yyyyMMdd: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
    return formatter
  }()
}


    
struct SImageUrl : Decodable {
    var small: String?
    var thumb: String?
}
    
struct SCategories : Decodable {
    var num: Int
    var categorie: String
    
    enum CodingKeys : String, CodingKey {
                case num = "id"
                case categorie = "name"
            }
}

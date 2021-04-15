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

}

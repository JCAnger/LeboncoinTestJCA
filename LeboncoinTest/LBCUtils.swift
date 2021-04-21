//
//  LBCUtils.swift
//  LeboncoinTest
//
//  Created by JC on 20/04/2021.
//

import UIKit

class LBCUtils: NSObject {
    
    static func getImageFromPath(path: String) -> UIImage {
        var img = UIImage()
        img = UIImage.init(named: "logoLbc")!
        if path == "" {
            return img
        }
        let url = URL(string: path)!
        
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        
        return img
    }

}

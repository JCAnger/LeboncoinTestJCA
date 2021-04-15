//
//  LBCAdTableViewCell.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import UIKit

class LBCAdTableViewCell: UITableViewCell {

    let leftmarging = 100
    
    let topMarging = 5
    let space = 20
    let height = 15
    let width = 300
    let size = 90
    
    var title = UILabel()
    var category = UILabel()
    var picture = UIImageView()
    var urgent = UIImageView()
    var price = UILabel()
    var date = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        picture.frame = CGRect.init(x: self.topMarging, y: self.topMarging, width: self.size, height: self.size)
        title.frame = CGRect.init(x: self.leftmarging, y: self.topMarging, width: self.width, height: 40)
        title.numberOfLines = 2;
        category.frame = CGRect.init(x: self.leftmarging, y: self.topMarging + 45, width: self.width, height: self.height)
        price.frame = CGRect.init(x: self.leftmarging, y: self.topMarging + 70, width: self.width, height: self.height)
        price.textAlignment = .left
        date.frame = CGRect.init(x: self.leftmarging, y: self.topMarging + 70, width: self.width, height: self.height)
        date.textAlignment = .right
        
        title.font = UIFont.systemFont(ofSize: 16)
        category.font = UIFont.italicSystemFont(ofSize: 13)
        price.font = UIFont.boldSystemFont(ofSize: 16)
        date.font = UIFont.systemFont(ofSize: 14)

        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        picture.backgroundColor = .lightGray
        picture.image = UIImage.init(named: "logoLbc")

        
        self.contentView.addSubview(title)
        self.contentView.addSubview(category)
        self.contentView.addSubview(picture)
        self.contentView.addSubview(urgent)
        self.contentView.addSubview(price)
        self.contentView.addSubview(date)
        
     }
    
    
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }


    override func prepareForReuse() {
       
        //
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func initWithClassified(theSmallAd : SmallAd) {
//        if self.contentView.subviews.count == 0 {
//            prepareForReuse()
//        }
        updateWithClassified(theSmallAd: theSmallAd)
    }

    func updateWithClassified(theSmallAd : SmallAd) {
        self.picture.image = UIImage.init(named: "logoLbc")
        
        getImageFromPath(path: theSmallAd.image.small)
        
        self.title.text = theSmallAd.title
        self.category.text = theSmallAd.cat
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.currencyCode = ""
        self.price.text = formatter.string(from: theSmallAd.price as NSNumber)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"// yyyy-MM-dd'T'HH:mm:ss "
        self.date.text = dateFormatter.string(from: theSmallAd.date)
        
        self.picture.layer.borderWidth = 1;
        self.picture.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.backgroundColor = .clear
        price.textColor = .orange
        if theSmallAd.urgent {
            self.urgent.backgroundColor = .orange
        }
        else {
            self.urgent.backgroundColor = .clear
        }
        
    }
    
    func getImageFromPath(path: String) {
        if path == "" {
            return
        }
        
        let url = URL(string: path)!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.picture.image = image
                    }
                }
            }
        }
    }

}

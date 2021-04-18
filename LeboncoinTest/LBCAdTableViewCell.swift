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

        title.numberOfLines = 2;
        
        urgent.frame = CGRect.init(x: self.topMarging/2, y: self.topMarging/2, width: space, height: space)
        
        title.font = UIFont.systemFont(ofSize: 16)
        category.font = UIFont.italicSystemFont(ofSize: 13)
        price.font = UIFont.boldSystemFont(ofSize: 16)
        date.font = UIFont.systemFont(ofSize: 14)

        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        picture.backgroundColor = .lightGray
        picture.image = UIImage.init(named: "logoLbc")
        picture.alpha = 0.3
        urgent.backgroundColor = .clear
        urgent.layer.cornerRadius = 10
        urgent.clipsToBounds = true
        
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
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func updateWithClassified(theSmallAd : SSmallAd) {
        if let imgPath = theSmallAd.images_url?.small {
            getImageFromPath(path: imgPath)
        }
        self.title.text = theSmallAd.title
        self.category.text = theSmallAd.cat
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.currencyCode = ""
        self.price.text = formatter.string(from: theSmallAd.price as NSNumber)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX" // 2019-11-05T15:56:59+0000
        let dateF = dateFormatter.date(from: theSmallAd.creation_date)!
        
        dateFormatter.dateFormat = "dd/MM/yyyy"// yyyy-MM-dd'T'HH:mm:ss "
        self.date.text = dateFormatter.string(from: dateF)
        
        self.picture.layer.borderWidth = 1;
        self.picture.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.backgroundColor = .clear
        price.textColor = .orange
        if theSmallAd.is_urgent {
            self.urgent.backgroundColor = .orange
        }
        else {
            self.urgent.backgroundColor = .clear
        }
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 as CGFloat).isActive = true
        picture.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 as CGFloat).isActive = true
        picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 as CGFloat).isActive = true
        picture.widthAnchor.constraint(equalTo: picture.heightAnchor, constant: 0).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 as CGFloat).isActive = true
        title.leftAnchor.constraint(equalTo: picture.leftAnchor, constant: 100 as CGFloat).isActive = true
        title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 as CGFloat).isActive = true
        
        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: title.bottomAnchor, constant:  5 as CGFloat).isActive = true
        category.leftAnchor.constraint(equalTo: picture.leftAnchor, constant: 100 as CGFloat).isActive = true
        category.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 as CGFloat).isActive = true

        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -27 as CGFloat).isActive = true
        price.leftAnchor.constraint(equalTo: picture.leftAnchor, constant: 100 as CGFloat).isActive = true
        price.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 as CGFloat).isActive = true

        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -27 as CGFloat).isActive = true
        date.leftAnchor.constraint(equalTo: picture.leftAnchor, constant: 100 as CGFloat).isActive = true
        date.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 as CGFloat).isActive = true
        date.textAlignment = .right
        
    }
    
    func getImageFromPath(path: String) {
        picture.image = UIImage.init(named: "logoLbc")
        picture.alpha = 0.3
        if path == "" {
            
            return
        }
        
        let url = URL(string: path)!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.picture.image = image
                        self?.picture.alpha = 1
                    }
                }
                
            }
            else {
                DispatchQueue.main.async {
                    self?.picture.alpha = 0.3
                }
            }
        }
    }

}

//
//  LBCDetailViewController.swift
//  LeboncoinTest
//
//  Created by JC on 16/04/2021.
//

import UIKit

class LBCDetailViewController: UIViewController {

    var theTitle = UILabel()
    var category = UILabel()
    var picture = UIImageView()
    var price = UILabel()
    var date = UILabel()
    var theDescription = UILabel()
    var isUrgent = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "LeBonCoin"
        prepareViewComponents()
        
    }
    
    func prepareViewComponents() {
        theTitle.numberOfLines = 2;
        
        theDescription.numberOfLines = 15
        theDescription.textAlignment = .justified
        
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        picture.backgroundColor = .lightGray
        picture.image = UIImage.init(named: "logoLbc")
        
        theTitle.font = UIFont.boldSystemFont(ofSize: 20)
        category.font = UIFont.italicSystemFont(ofSize: 16)
        price.font = UIFont.boldSystemFont(ofSize: 20)
        date.font = UIFont.systemFont(ofSize: 16)
        theDescription.font = UIFont.systemFont(ofSize: 16)
        
        isUrgent.backgroundColor = .clear
        isUrgent.layer.cornerRadius = 10
        isUrgent.clipsToBounds = true
        
        self.view.addSubview(theTitle)
        self.view.addSubview(category)
        self.view.addSubview(picture)
        self.view.addSubview(isUrgent)
        self.view.addSubview(price)
        self.view.addSubview(date)
        self.view.addSubview(theDescription)
        self.view.addSubview(date)
        
    }
    
    func updateWithSmallAd(classified theSmallAd : SmallAd) {
        getImageFromPath(path: theSmallAd.image.thumb)
        
        self.theTitle.text = theSmallAd.title
        self.category.text = theSmallAd.cat
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.currencyCode = ""
        self.price.text = formatter.string(from: theSmallAd.price as NSNumber)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"// yyyy-MM-dd'T'HH:mm:ss "
        self.date.text = dateFormatter.string(from: theSmallAd.date)
        
        self.picture.layer.borderWidth = 0.5
        self.view.backgroundColor = .white
        price.textColor = .orange
        
        theDescription.text = theSmallAd.description
        
        if theSmallAd.urgent {
            self.isUrgent.backgroundColor = .orange
        }
        else {
            self.isUrgent.backgroundColor = .clear
        }
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.topAnchor.constraint(equalTo: view.topAnchor, constant: 100 as CGFloat).isActive = true
        picture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 as CGFloat).isActive = true
        picture.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/2 as CGFloat).isActive = true
        picture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        theTitle.translatesAutoresizingMaskIntoConstraints = false
        theTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10 as CGFloat).isActive = true
        theTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100 as CGFloat).isActive = true
        theTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 as CGFloat).isActive = true
        
        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: theTitle.bottomAnchor, constant:  5 as CGFloat).isActive = true
        category.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100 as CGFloat).isActive = true
        category.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 as CGFloat).isActive = true

        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -27 as CGFloat).isActive = true
        price.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100 as CGFloat).isActive = true
        price.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 as CGFloat).isActive = true

        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -27 as CGFloat).isActive = true
        date.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width/2 as CGFloat).isActive = true
        date.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10 as CGFloat).isActive = true
        date.textAlignment = .right
    }

    func getImageFromPath(path: String) {
        self.picture.image = UIImage.init(named: "imageLbc")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

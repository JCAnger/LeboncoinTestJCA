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
    var contentView = UIView()
    
    var topPictV = NSLayoutConstraint()
    var topPictH = NSLayoutConstraint()
    
    var widthPictV = NSLayoutConstraint()
    var widthPictH = NSLayoutConstraint()
    var heightPictV = NSLayoutConstraint()
    var heightPictH = NSLayoutConstraint()
    
    var topDescV = NSLayoutConstraint()
    var leftDescV = NSLayoutConstraint()
    var topDescH = NSLayoutConstraint()
    var leftDescH = NSLayoutConstraint()

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
        picture.alpha =  0.3
        
        theTitle.font = UIFont.boldSystemFont(ofSize: 20)
        category.font = UIFont.italicSystemFont(ofSize: 16)
        price.font = UIFont.boldSystemFont(ofSize: 20)
        price.textAlignment = .right
        date.font = UIFont.systemFont(ofSize: 16)
        date.textAlignment = .right
        theDescription.font = UIFont.systemFont(ofSize: 16)
        
        isUrgent.frame.size = CGSize(width: 20, height: 20)
        isUrgent.backgroundColor = .clear
        isUrgent.layer.cornerRadius = 10
        isUrgent.clipsToBounds = true
        
        self.view.addSubview(picture)
        self.view.addSubview(contentView)
        
        self.contentView.addSubview(theTitle)
        self.contentView.addSubview(category)
    
        self.contentView.addSubview(price)
        self.contentView.addSubview(date)
        self.contentView.addSubview(theDescription)
        self.contentView.addSubview(date)
        self.contentView.addSubview(isUrgent)
        
    }
    
    func updateWithSmallAd(classified theSmallAd : SSmallAd) {
        if let imgPath = theSmallAd.imagesUrl?.thumb {
            DispatchQueue.main.async {
                self.picture.image = LBCUtils.getImageFromPath(path: imgPath)
                self.picture.alpha =  1
            }
            
        }
        
        self.theTitle.text = theSmallAd.title
        self.category.text = theSmallAd.cat
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.currencyCode = ""
        self.price.text = formatter.string(from: theSmallAd.price as NSNumber)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"// yyyy-MM-dd'T'HH:mm:ss "
        self.date.text = dateFormatter.string(from: theSmallAd.creationDate)
        
        
        self.picture.layer.borderWidth = 0.5
        self.view.backgroundColor = .white
        price.textColor = .orange
        
        theDescription.text = theSmallAd.description
        
        if theSmallAd.isUrgent {
            self.isUrgent.backgroundColor = .orange
        }
        else {
            self.isUrgent.backgroundColor = .clear
        }
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        topPictH = picture.topAnchor.constraint(equalTo: view.topAnchor, constant:  50)
        topPictV = picture.topAnchor.constraint(equalTo: view.topAnchor, constant:  110) //***
        picture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 as CGFloat).isActive = true //ok
        heightPictV = picture.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)// ok
        if UIDevice.current.userInterfaceIdiom == .pad {
            heightPictH = picture.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)// ok
        }
        else {
            heightPictH = picture.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)// ok
        }
        widthPictH = picture.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4) // ***
        
        contentView.translatesAutoresizingMaskIntoConstraints =  false
        topDescV = contentView.topAnchor.constraint(equalTo: picture.bottomAnchor, constant:  10) // TODO
        topDescH = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant:  50) // TODO
        leftDescV = contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10 as CGFloat) // TODO
        leftDescH = contentView.leftAnchor.constraint(equalTo: picture.rightAnchor, constant: 10 as CGFloat) // TODO
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true // ok
        
        theTitle.translatesAutoresizingMaskIntoConstraints = false
        theTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 as CGFloat).isActive = true
        theTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 as CGFloat).isActive = true
        theTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20 as CGFloat).isActive = true
        
        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: theTitle.bottomAnchor, constant:  5 as CGFloat).isActive = true
        category.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 as CGFloat).isActive = true
        category.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20 as CGFloat).isActive = true

        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: theTitle.bottomAnchor, constant: 5 as CGFloat).isActive = true
        price.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -150 as CGFloat).isActive = true
        price.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20 as CGFloat).isActive = true
        
        theDescription.translatesAutoresizingMaskIntoConstraints = false
        theDescription.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 20 as CGFloat).isActive = true
        theDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 as CGFloat).isActive = true
        theDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20 as CGFloat).isActive = true

        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: theDescription.bottomAnchor, constant: 20 as CGFloat).isActive = true
        date.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -150 as CGFloat).isActive = true
        date.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20 as CGFloat).isActive = true

        
        isUrgent.translatesAutoresizingMaskIntoConstraints = false
        isUrgent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 as CGFloat).isActive = true
        isUrgent.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0 as CGFloat).isActive = true
        isUrgent.heightAnchor.constraint(equalTo: date.heightAnchor).isActive = true
        isUrgent.widthAnchor.constraint(equalTo: date.heightAnchor).isActive = true
        
        if UIDevice.current.orientation.isLandscape {
            self.updateToLandscape()
        }
        else { // portrait
            self.updateToPortait()
        }
    }


    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            self.updateToLandscape()
           
        }
        else { // portrait
            self.updateToPortait()
        }
    }
    
    func updateToLandscape() {
        topPictV.isActive = false
        topPictH.isActive = true
        widthPictH.isActive = true
        heightPictV.isActive = false
        heightPictH.isActive = true
        topDescV.isActive = false
        topDescH.isActive = true
        leftDescV.isActive = false
        leftDescH.isActive = true
    }
    
    func updateToPortait() {
        topPictH.isActive = false
        topPictV.isActive = true
        widthPictH.isActive = false
        heightPictH.isActive = false
        heightPictV.isActive = true
        topDescH.isActive = false
        topDescV.isActive = true
        leftDescH.isActive = false
        leftDescV.isActive = true
        
    }
}

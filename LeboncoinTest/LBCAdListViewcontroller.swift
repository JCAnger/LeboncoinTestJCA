//
//  LBCAdListViewcontroller.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import UIKit

class LBCAdListViewcontroller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView = UITableView()
    var results = [[String:Any]]()
    var SmallAds = [SmallAd]()
    var allSmallAds = [SmallAd]()
    var categories = [Categories]()
    
    var selectedCat : Int = 0
    
    let manager = LBCHttpManager.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView = UITableView.init(frame: self.view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource =  self
        tableView.contentSize = tableView.frame.size
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.register(LBCAdTableViewCell.self, forCellReuseIdentifier: "LBCAdTableViewCell")
        
        self.title = "leboncoin"
        self.navigationController?.navigationBar.backgroundColor = .orange
        self.navigationController?.navigationBar.barTintColor = .orange
        self.navigationController?.navigationBar.tintColor = .darkGray
        
        //self.navigationItem.rightBarButtonItem =  UIBarButtonItem.init(title: "Filter", style: .plain, target: self, action: #selector(showCategoryList))
        
        self.getCategories()
        
    }
    
    func getDataFromUrl() {
        manager.getClassifedIdFromLbc { (json) in
            self.convertToSmallAdsArray(results: json)
            self.updateData()
        }
    }
    
    func getCategories() {

        manager.getCategoriesWithSuccess(success: { (json : [[String : Any]]) in
            print("success")
            self.convertToCategoriesArray(results: json)
            self.getDataFromUrl()
        }) { (error : NSError) in
            print("error")
        }
    }
    
    
    func convertToSmallAdsArray(results: [[String:Any]]) {
        SmallAds = []
        if results.count > 0 {
            for object: [String: Any] in results {
                let classified = SmallAd.init(smallAd: object)
                classified.cat = categories[classified.numCat - 1].category
                allSmallAds.append(classified)
            }
            SmallAds = allSmallAds
        }
    }
    
    func convertToCategoriesArray(results: [[String:Any]]) {
        categories = []
        if results.count > 0 {
            for object: [String: Any] in results {
                let cat = Categories.init(cat:object)
                categories.append(cat)
            }
    
        }
    }
    
    

    
    func updateData() {
        filterResponseByCategoriesAndDate()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func filterResponseByCategoriesAndDate() {
        let sorted = allSmallAds.sorted(by: {
                $0.date.compare($1.date) == .orderedDescending
            })
 
        SmallAds = sorted;
        DispatchQueue.main.async {
            self.title = "leboncoin"
        }
    }
    

    func filterUrgentFirst() {
        let sortedUrgent = SmallAds.filter {
            $0.urgent == true
        }
        let sortedNotUrgent = SmallAds.filter {
            $0.urgent == false
        }
        
        SmallAds = sortedUrgent + sortedNotUrgent
    }
    
    // MARK: UITableViewDelegate

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SmallAds.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "LBCAdTableViewCell", for: indexPath) as? LBCAdTableViewCell ?? LBCAdTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "LBCAdTableViewCell")
        cell.initWithClassified(theSmallAd: self.SmallAds[indexPath.row])
        
        return cell
    }
    
    

}

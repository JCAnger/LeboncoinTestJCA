//
//  LBCAdListViewcontroller.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import UIKit

protocol MasterDelegate {
    func start(show: SSmallAd)
}

class LBCAdListViewcontroller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView : UITableView = UITableView()
    var results = [[String:Any]]()
    var smallAds = [SSmallAd]()
    var allSmallAds = [SSmallAd]()
    
    var selectedCat : Int = 0
    
    let manager = LBCManager.init()
    
    var delegate : MasterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView = UITableView.init(frame: self.view.frame, style: .plain)
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
        
        self.getSmallAdsFromAPI()
    
    }
    
    
    func getSmallAdsFromAPI() {
        manager.getAdsFromUrl (success: { (result) in
            self.allSmallAds = result
            self.updateData()
        }) { (NSError) in
            print("error")
        }
    }
    

    
    func updateData() {
        filterResponse()
        
        DispatchQueue.main.async {
            self.title = "leboncoin"
            self.tableView.reloadData()
        }
    }
    
    
    func filterResponse() {
        let sorted = allSmallAds.sorted(by: {
                $0.creationDate.compare($1.creationDate) == .orderedDescending
            })
 
        smallAds = sorted;
    }
    

//    func filterUrgentFirst() {
//        let sortedUrgent = smallAds.filter {
//            $0.urgent == true
//        }
//        let sortedNotUrgent = smallAds.filter {
//            $0.urgent == false
//        }
//
//        smallAds = sortedUrgent + sortedNotUrgent
//    }
    
    // MARK: UITableViewDelegate

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.smallAds.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LBCAdTableViewCell", for: indexPath) as? LBCAdTableViewCell
        cell?.updateCellWithAd(theSmallAd: self.smallAds[indexPath.row])
            
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            //
            self.delegate?.start(show: self.smallAds[indexPath.row])
            
        }
        else {
            let detailVC = LBCDetailViewController.init()
            detailVC.updateWithSmallAd(classified: self.smallAds[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
}

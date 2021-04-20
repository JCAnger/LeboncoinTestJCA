//
//  AppDelegate.swift
//  LeboncoinTest
//
//  Created by JC on 15/04/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    let splitViewController = UISplitViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if UIDevice.current.userInterfaceIdiom == .pad {
            //
            let adListVC = LBCAdListViewcontroller()

            adListVC.delegate = self

            splitViewController.preferredDisplayMode = .allVisible
            splitViewController.viewControllers = [
                UINavigationController(rootViewController: adListVC),
                UINavigationController(rootViewController: LBCDetailViewController())
            ]
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = splitViewController
            window?.makeKeyAndVisible()
            
            return true
        }
        else {
            window = UIWindow(frame: UIScreen.main.bounds)

            let homeViewController = LBCDetailViewController()
            let navigationController = UINavigationController.init(rootViewController: homeViewController)
            
            window!.rootViewController = navigationController

            window!.makeKeyAndVisible()
            
            return true
        }
    
    }
    
    

}

extension AppDelegate: MasterDelegate {
    func start(show: SSmallAd) {
        let detailsVC = LBCDetailViewController()
        detailsVC.updateWithSmallAd(classified: show)
        splitViewController.showDetailViewController(detailsVC, sender: self)
    }
}



extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}


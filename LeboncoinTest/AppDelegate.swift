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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = LBCAdListViewcontroller()
        let navigationController = UINavigationController.init(rootViewController: homeViewController)
        
        window!.rootViewController = navigationController
        
        window!.makeKeyAndVisible()
        
        return true
    }



}


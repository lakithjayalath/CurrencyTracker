//
//  AppDelegate.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-29.
//

import UIKit

@available(iOS 14.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOption: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        let ratesVC = RatesViewController()
        let ratesConversionVC = RatesConversionViewController()
        
        let ratesNC = UINavigationController(rootViewController: ratesVC)
        let ratesConversionNC = UINavigationController(rootViewController: ratesConversionVC)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = .systemBlue
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.isTranslucent = false
        tabBarController.viewControllers = [ratesNC, ratesConversionNC]
        
        window?.rootViewController = tabBarController
        
        return true
    }


}


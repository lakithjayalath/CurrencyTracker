//
//  ViewController.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-29.
//

import UIKit

class CurrencyTrackerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        view.backgroundColor = UIColor.white
    }
    
    func setUpNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        navigationController?.navigationBar.isTranslucent = false
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let image = UIImage(named: imageName)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }

}


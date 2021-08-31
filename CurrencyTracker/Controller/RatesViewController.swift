//
//  RatesViewController.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-29.
//

import UIKit

@available(iOS 14.0, *)
class RatesViewController: CurrencyTrackerViewController {
    
    let ratesMainView = RatesMainView()
    
    var rates = [[String]]()
    
    override func loadView() {
        view = ratesMainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    
    }
    
    func setupUI() {
//        view.backgroundColor = .white
        title = "Rates"
        navigationController?.navigationBar.barTintColor = .black
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = attrs
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "exchange", title: "Rates")
    }

}


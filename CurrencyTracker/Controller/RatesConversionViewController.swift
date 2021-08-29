//
//  RatesConversionViewController.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-29.
//

import UIKit

class RatesConversionViewController: CurrencyTrackerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        title = "Convert"
        navigationController?.navigationBar.barTintColor = .black
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = attrs
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "currency", title: "Convert")
    }
}

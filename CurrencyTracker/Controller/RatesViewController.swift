//
//  RatesViewController.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-29.
//

import UIKit
import Alamofire

@available(iOS 14.0, *)
class RatesViewController: CurrencyTrackerViewController {
    
    let ratesMainView = RatesMainView()
    var dataSource: UICollectionViewDiffableDataSource<Section, String>?
    
    var rates = [[String]]()
    
    var countries: [String] = ["AUD", "CAD", "EUR", "GMD", "IDR", "LKR", "MAD", "NZD", "OMR", "QAR", "SAR", "SRD", "TMT", "USD", "VND", "WST", "XAU", "XPF", "YER", "ZWL"]
    
    override func loadView() {
        view = ratesMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        AF.request("https://api.exchangerate.host/latest").response { response in
//            debugPrint("response1234", response)
//        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        title = "Rates"
        
        setupCollectionView()
        populateCollectionView(with: countries)
    }
    
    func setupCollectionView() {
        
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, indexPath, country in

            var content = cell.defaultContentConfiguration()
            content.text = self.countries[indexPath.row]
            cell.contentConfiguration = content
        }

        dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: ratesMainView.collectionView) { collectionView, indexPath, country in
            
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: country)
        }
    }
    
    func populateCollectionView(with countries: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(countries)
        dataSource?.apply(snapshot)
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "rates", title: "Rates")
    }

}

@available(iOS 14.0, *)
extension RatesViewController {
    enum Section {
        case main
    }
}

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
    
    var countries: [String] = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua", "Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia",  "Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre", "Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts", "Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad", "Tobago","Tunisia","Turkey","Turkmenistan","Turks", "Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    
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
        navigationController?.navigationBar.barTintColor = .systemBlue
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = attrs
        
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

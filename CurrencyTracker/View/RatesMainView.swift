//
//  MainView.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-31.
//

import UIKit

@available(iOS 14.0, *)
class RatesMainView: UIView {
    
    lazy var ratesCollectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGroupedBackground
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .blue
        setupSubviews()
    }
    
    func setupSubviews() {
        addSubview(ratesCollectionView)
        
        NSLayoutConstraint.activate([
            ratesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            ratesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ratesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

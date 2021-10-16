//
//  MainView.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-31.
//

import UIKit

@available(iOS 14.0, *)
class RatesMainView: UIView {
    
    lazy var collectionView: UICollectionView = {
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
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        backgroundColor = .white
    }
    
    func setupSubViews() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

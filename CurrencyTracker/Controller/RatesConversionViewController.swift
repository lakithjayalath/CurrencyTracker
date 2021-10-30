//
//  RatesConversionViewController.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-08-29.
//

import UIKit

class RatesConversionViewController: CurrencyTrackerViewController {
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor.systemGray6
        stackView.layer.cornerRadius = 1.0
        return stackView
    }()
    
    let currencyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10.0
        stackView.backgroundColor = UIColor.white
        return stackView
    }()
    
    let selectCurrencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.setTitle("Select", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        let image = UIImage(systemName: "chevron.down.circle.fill")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let firstCurrencyTF: UITextField = {
        let textField = UITextField()
        textField.text = "USD"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        let flagImageView = UIImageView()
        flagImageView.contentMode = .scaleAspectFit
        let flag = UIImage(named: "united-states")
        flagImageView.image = flag
        textField.leftView = flagImageView
        return textField
    }()
    
    let secondCurrencyTF: UITextField = {
        let textField = UITextField()
        textField.text = "LKR"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        let flagImageView = UIImageView()
        flagImageView.contentMode = .scaleAspectFit
        let flag = UIImage(named: "sri-lanka")
        flagImageView.image = flag
        textField.leftView = flagImageView
        return textField
    }()
    
    let amountTF: UITextField = {
        let textField = UITextField()
        textField.text = "$1.00"
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    let rightArrowImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right-arrow")
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        title = "Convert"
        
        setHorizontalStackView()
        setUpButtons()
        setUpTextFields()
        setUpContainerViews()
        setUpImageViews()
        
    }
    
    func setHorizontalStackView() {
        self.view.addSubview(buttonStackView)
        
        self.view.addSubview(currencyStackView)
        
        self.view.addSubview(amountTF)
        
        amountTF.frame = CGRect(x: (self.view.frame.width / 2) - 150, y: (self.view.frame.height / 2) - 100, width: 300, height: 50)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        [selectCurrencyButton, arrowButton].forEach { buttonStackView.addArrangedSubview($0) }
        
        currencyStackView.translatesAutoresizingMaskIntoConstraints = false
        currencyStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currencyStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
        [firstCurrencyTF, secondCurrencyTF].forEach { currencyStackView.addArrangedSubview($0) }
        
    }
    
    func setUpButtons() {
        selectCurrencyButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        selectCurrencyButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        arrowButton.heightAnchor.constraint(equalToConstant: 60.5).isActive = true
        arrowButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    func setUpTextFields() {
        firstCurrencyTF.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        secondCurrencyTF.widthAnchor.constraint(equalToConstant: 140.0).isActive = true
        
    }
    
    func setUpContainerViews() {
        rightArrowImageContainerView.addSubview(rightArrowImageView)
        
        rightArrowImageContainerView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    func setUpImageViews() {
        rightArrowImageView.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        rightArrowImageView.widthAnchor.constraint(equalToConstant: 35.0).isActive = true
        rightArrowImageView.centerXAnchor.constraint(equalTo: rightArrowImageContainerView.centerXAnchor).isActive = true
        rightArrowImageView.centerYAnchor.constraint(equalTo: rightArrowImageContainerView.centerYAnchor).isActive = true
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "convert", title: "Convert")
    }
}

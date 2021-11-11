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
        stackView.spacing = 15.0
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
        textField.text = "EUR"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        let flagImageView = UIImageView()
        flagImageView.contentMode = .scaleAspectFit
        let flag = UIImage(named: "european-union")
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
    
    let firstCurrencyView: UIView = {
        let uiView = UIView()
        return uiView
    }()
    
    let amountTF: UITextField = {
        let textField = UITextField()
        textField.text = "€1.00"
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
    
    let convertingAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "1.00 EUR" + " ="
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .black)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let convertedAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "233.96931 LKR"
        label.font = UIFont.systemFont(ofSize: 34.0, weight: .black)
        return label
    }()
    
    var currencyPickerView: UIPickerView!
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = (UIScreen.main.bounds.height / 2) - 140
    var selectedFirstRow = 0
    var selectedSecondRow = 0
    var currencies: KeyValuePairs = [
        "AUD" : "1.537906",
        "NZD" : "1.612609",
        "QAR" : "4.208506",
        "USD" : "1.156389",
        "LKR" : "233.545603"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        title = "Convert"
        self.hideKeyboardWhenTappedAround()
        
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
        
        self.view.addSubview(convertingAmountLabel)
        
        self.view.addSubview(convertedAmountLabel)
        
        convertingAmountLabel.frame = CGRect(x: (self.view.frame.width) * 0.05, y: (self.view.frame.height / 2), width: 150, height: 30)
        
        convertedAmountLabel.frame = CGRect(x: (self.view.frame.width) * 0.05, y: (self.view.frame.height / 2) + 30, width: 300, height: 40)
        
        amountTF.frame = CGRect(x: (self.view.frame.width / 2) - 150, y: (self.view.frame.height / 2) - 120, width: 300, height: 50)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -140).isActive = true
        [selectCurrencyButton, arrowButton].forEach { buttonStackView.addArrangedSubview($0) }
        
        currencyStackView.translatesAutoresizingMaskIntoConstraints = false
        currencyStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currencyStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -520).isActive = true
        [firstCurrencyTF, secondCurrencyTF].forEach { currencyStackView.addArrangedSubview($0) }
        
    }
    
    func setUpButtons() {
        selectCurrencyButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        selectCurrencyButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        selectCurrencyButton.addTarget(self, action: #selector(popUpPicker), for: .touchUpInside)
        
        arrowButton.heightAnchor.constraint(equalToConstant: 60.5).isActive = true
        arrowButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        arrowButton.addTarget(self, action: #selector(popUpPicker), for: .touchUpInside)
    }
    
    func setUpTextFields() {
        firstCurrencyTF.widthAnchor.constraint(equalToConstant: 170.0).isActive = true
        firstCurrencyTF.delegate = self
        firstCurrencyTF.addTarget(self, action: #selector(popUpPicker), for: .touchDown)
        
        secondCurrencyTF.widthAnchor.constraint(equalToConstant: 170.0).isActive = true
        secondCurrencyTF.delegate = self
        secondCurrencyTF.addTarget(self, action: #selector(popUpPicker), for: .touchDown)
        
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
    
    
    @objc func popUpPicker(sender: UIButton!) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        lazy var pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(selectedFirstRow, inComponent: 0, animated: false)
        pickerView.selectRow(selectedSecondRow, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerView)
        
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select Currencies", message: nil, preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = selectCurrencyButton
        alert.popoverPresentationController?.sourceRect = selectCurrencyButton.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
            self.selectedFirstRow = pickerView.selectedRow(inComponent: 0)
            self.selectedSecondRow = pickerView.selectedRow(inComponent: 1)
            
            let selectedFirst = Array(self.currencies)[self.selectedFirstRow]
            let selectedSecond = Array(self.currencies)[self.selectedSecondRow]
            let firstCurrency = selectedFirst.key
            let secondCurrency = selectedSecond.key
            
            self.firstCurrencyTF.text = firstCurrency
            self.secondCurrencyTF.text = secondCurrency
        }))
        
//        firstCurrencyTF.inputView = pickerView
//        secondCurrencyTF.inputView = pickerView
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setUpCurrencyPopUpView() {
        
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "convert", title: "Convert")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension RatesConversionViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
}

extension RatesConversionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = Array(currencies)[row].key
        label.sizeToFit()
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
}

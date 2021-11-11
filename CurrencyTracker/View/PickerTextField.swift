//
//  PickerTextField.swift
//  CurrencyTracker
//
//  Created by Lakith Jayalath on 2021-11-05.
//

import UIKit

typealias PickerTextFieldDisplayNameHandler = ((Any) -> String)
typealias PickerTextFieldItemSelectionHandler = ((Int, Any) -> Void)

class PickerTextField: UITextField {

    private let pickerView = UIPickerView(frame: .zero)
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = (UIScreen.main.bounds.height / 2) - 100
    var selectedFirstRow = 0
    var selectedSecondRow = 0
    var VC = UIViewController()
    
    public var pickerData = [:] as KeyValuePairs<String, String>
    public var displayNameHandler: PickerTextFieldDisplayNameHandler?
    public var itemSelectionHandler: PickerTextFieldItemSelectionHandler?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView(viewController: VC)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView(viewController: VC)
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    private func configureView(viewController: UIViewController) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        lazy var pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        self.inputView = pickerView
        
        pickerView.selectRow(selectedFirstRow, inComponent: 0, animated: false)
        pickerView.selectRow(selectedSecondRow, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerView)
        
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select Currencies", message: nil, preferredStyle: .actionSheet)
        
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
            self.selectedFirstRow = pickerView.selectedRow(inComponent: 0)
            self.selectedSecondRow = pickerView.selectedRow(inComponent: 1)
            
            let selectedFirst = Array(self.pickerData)[self.selectedFirstRow]
            let selectedSecond = Array(self.pickerData)[self.selectedSecondRow]
            let firstCurrency = selectedFirst.key
            let secondCurrency = selectedSecond.key
            
            self.text = firstCurrency
            self.text = secondCurrency
        }))
        
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.endEditing(true)
//    }
    
    
}

extension PickerTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = Array(pickerData)[row].key
        label.sizeToFit()
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
}

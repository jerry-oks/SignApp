//
//  FullnameViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class FullnameViewController: UIViewController {
    @IBOutlet private var textFields: [UITextField]!
    @IBOutlet private var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields.forEach { textfield in
            textfield.delegate = self
        }
        textFields.first?.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func tfChanged(_ sender: UITextField) {
        sender.backgroundColor = UIColor.clear
        nextButton.isEnabled = shouldEnableButton()
    }
    
    @IBAction func tfDidEndEditing(_ sender: UITextField) {
        let color = isValid(sender)
        ? UIColor.clear.cgColor
        : CGColor(
            red: 1,
            green: 0.8,
            blue: 0.75,
            alpha: 1
        )
        
        sender.backgroundColor = UIColor(cgColor: color)
        nextButton.isEnabled = shouldEnableButton()
    }
    
}

extension FullnameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFields.first {
            return textFields.last?.becomeFirstResponder() ?? true
        }
        return textField.resignFirstResponder()
    }
}

private extension FullnameViewController {
    func isValid(_ textFields: [UITextField]) -> Bool {
        var check = true
        
        textFields.forEach { textfield in
            if textfield.text?.count ?? 0 >= 2 {
                return
            }
            
            check = false
            return
        }
        
        return check
    }
    
    func isValid(_ textfields: UITextField...) -> Bool {
        isValid(textfields)
    }
    
    func shouldEnableButton() -> Bool {
        isValid(textFields)
    }
}



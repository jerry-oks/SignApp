//
//  PhoneViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class PhoneViewController: UIViewController {
    
    @IBOutlet private var numberBlockTFs: [UITextField]!
    @IBOutlet private var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberBlockTFs.first?.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction private func numberBlockTFChanged(_ sender: UITextField) {
        if isValid(sender) {
            guard let indexOfTF = numberBlockTFs.firstIndex(of: sender) else { return }
            
            if numberBlockTFs.last == sender {
                sender.resignFirstResponder()
            } else {
                numberBlockTFs[indexOfTF + 1].becomeFirstResponder()
            }
        }
        
        sender.backgroundColor = UIColor.clear
        nextButton.isEnabled = shouldEnableButton()
    }
    
    @IBAction private func numberBlockTFDidEndEditing(_ sender: UITextField) {
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

// MARK: - Checking Methods
private extension PhoneViewController {
    func isValid(_ textFields: [UITextField]) -> Bool {
        var check = true
        let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        textFields.forEach { textField in
            let digitsCount = numberBlockTFs.firstIndex(of: textField) ?? 0 > 1 ? 2 : 3
            
            if textField.text?.count == digitsCount {
                textField.text?.forEach { char in
                    if !numbers.contains(char) {
                        check = false
                        return
                    }
                }
                return
            }
            
            check = false
            return
        }
        
        return check
    }
    
    func isValid(_ textFields: UITextField...) -> Bool {
        isValid(textFields)
    }
    
    func shouldEnableButton() -> Bool {
        isValid(numberBlockTFs)
    }
}

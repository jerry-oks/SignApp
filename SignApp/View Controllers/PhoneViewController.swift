//
//  PhoneViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class PhoneViewController: UIViewController {
    
    @IBOutlet private var numberBlocks: [UITextField]!
    @IBOutlet private var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberBlocks.first?.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func numberBlockTFChanged(_ sender: UITextField) {
        if isValid(sender) {
            guard let indexOfTF = numberBlocks.firstIndex(of: sender) else { return }
            
            if numberBlocks.last == sender {
                sender.resignFirstResponder()
                return
            }
            
            numberBlocks[indexOfTF + 1].becomeFirstResponder()
        }
        
        nextButton.isEnabled = shouldEnableButton()
    }
    
    @IBAction func numberBlockTFEdited(_ sender: UITextField) {
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
    func isValid(_ textfields: [UITextField]) -> Bool {
        var check = true
        let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        textfields.forEach { textfield in
            let digitsCount = numberBlocks.firstIndex(of: textfield) ?? 0 > 1 ? 2 : 3
            
            if textfield.text?.count == digitsCount {
                textfield.text?.forEach { char in
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
    
    func isValid(_ textfields: UITextField...) -> Bool {
        isValid(textfields)
    }
    
    func shouldEnableButton() -> Bool {
        isValid(numberBlocks)
    }
}

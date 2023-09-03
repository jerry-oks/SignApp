//
//  SMSCodeViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class SMSCodeViewController: UIViewController {
    @IBOutlet private var digitBlocks: [UITextField]!
    @IBOutlet private var nextButton: UIButton!
    @IBOutlet private var codeLabel: UILabel!
    
    private let code = Int.random(in: 100000...999999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel.text = "📩 Ваш код: \(code)"
        codeLabel.alpha = 0
        digitBlocks.first?.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 2,
            options: [.allowUserInteraction],
            animations: { self.codeLabel.alpha = 1 },
            completion: nil
        )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction private func digitBlockChanged(_ sender: UITextField) {
        if isValid(sender) {
            guard let indexOfTF = digitBlocks.firstIndex(of: sender) else { return }
            
            if digitBlocks.last == sender {
                sender.resignFirstResponder()
            } else {
                digitBlocks[indexOfTF + 1].becomeFirstResponder()
            }
        }
        
        nextButton.isEnabled = shouldEnableButton()
    }
}

// MARK: - Checking Methods
private extension SMSCodeViewController {
    func isValid(_ textfields: [UITextField]) -> Bool {
        var check = true
        let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        textfields.forEach { textfield in
            if textfield.text?.count ?? 0 > 1 {
                let lastChar = String(textfield.text?.last ?? " ")
                textfield.text = lastChar == " " ? "" : lastChar
            }
            
            if textfield.text?.count == 1 {
                textfield.text?.forEach { char in
                    if !numbers.contains(char) {
                        textfield.text = ""
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
        isValid(digitBlocks)
    }
}

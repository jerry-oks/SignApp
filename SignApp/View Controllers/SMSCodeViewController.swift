//
//  SMSCodeViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class SMSCodeViewController: UIViewController {
    @IBOutlet private var digitBlockTFs: [UITextField]!
    @IBOutlet private var nextButton: UIButton!
    @IBOutlet private var codeLabel: UILabel!
    
    unowned var delegate: SMSCodeViewControllerDelegate!
    
    private let code = Int.random(in: 100000...999999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel.text = "📩 Ваш код: \(code)"
        codeLabel.alpha = 0
        digitBlockTFs.first?.becomeFirstResponder()
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
            guard let indexOfTF = digitBlockTFs.firstIndex(of: sender) else { return }
            
            if digitBlockTFs.last == sender {
                sender.resignFirstResponder()
            } else {
                digitBlockTFs[indexOfTF + 1].becomeFirstResponder()
            }
        }
        
        nextButton.isEnabled = shouldEnableButton(ifTFsAreValid: digitBlockTFs)
    }
    @IBAction func nextButtonTapped() {
        var enteredCode = ""
        digitBlockTFs.forEach { digitBlockTF in
            enteredCode.append(digitBlockTF.text ?? "")
        }
        print(enteredCode)
        print(code)
        if Int(enteredCode) == code {
            dismiss(animated: true)
            delegate?.setValidityStatus(true)
            delegate?.goNext()
            
        } else {
            let alert = UIAlertController(
                title: "Неверный код",
                message: "Проверьте, что код введен верно, и повторите попытку",
                preferredStyle: .alert
            )
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default
                ) { _ in
                    self.digitBlockTFs.forEach { digitBlock in
                        digitBlock.text = ""
                    }
                }
            )
            
            present(alert, animated: true)
        }
    }
    @IBAction func skipButtonTapped() {
        dismiss(animated: true)
        delegate?.setValidityStatus(false)
        delegate?.goNext()
    }
}

// MARK: - Checking Methods
private extension SMSCodeViewController {
    func isValid(_ textFields: [UITextField]) -> Bool {
        var check = true
        let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        textFields.forEach { textField in
            if textField.text?.count ?? 0 > 1 {
                let lastChar = String(textField.text?.last ?? " ")
                textField.text = lastChar == " " ? "" : lastChar
            }
            
            if textField.text?.count == 1 {
                textField.text?.forEach { char in
                    if !numbers.contains(char) {
                        textField.text = ""
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
    
    func shouldEnableButton(ifTFsAreValid textFields: [UITextField]) -> Bool {
        isValid(textFields)
    }
}

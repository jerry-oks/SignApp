//
//  PhoneViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

protocol SMSCodeViewControllerDelegate: AnyObject {
    func setValidityStatus(_ isValidated: Bool)
    func goNext()
}

final class PhoneViewController: UIViewController {
    
    @IBOutlet private var numberBlockTFs: [UITextField]!
    @IBOutlet private var nextButton: UIButton!
    
    @IBOutlet var stackView: UIStackView!
    
    var user = User()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        numberBlockTFs.first?.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let smsCodeVC = segue.destination as? SMSCodeViewController {
            smsCodeVC.delegate = self
        } else if let fullnameVC = segue.destination as? FullnameViewController {
            fullnameVC.user = user
        }
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
    
    @IBAction func nextButtonTapped() {
        user.phone.firstBlock = numberBlockTFs[0].text ?? ""
        user.phone.secondBlock = numberBlockTFs[1].text ?? ""
        user.phone.thirdBlock = numberBlockTFs[2].text ?? ""
        user.phone.fourthBlock = numberBlockTFs[3].text ?? ""
        print(user)
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

extension PhoneViewController: SMSCodeViewControllerDelegate {
    func setValidityStatus(_ isValidated: Bool) {
        user.isValidated = isValidated
    }
    
    func goNext() {
        performSegue(withIdentifier: "openFullnameVC", sender: nil)
    }
}

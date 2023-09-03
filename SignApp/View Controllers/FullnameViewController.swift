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
    
    var user = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFields.forEach { textField in
            textField.delegate = self
        }
        textFields.first?.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dobVC = segue.destination as? DOBViewController else { return }
        dobVC.user = user
    }
    
    @IBAction private func tfChanged(_ sender: UITextField) {
        sender.backgroundColor = UIColor.clear
        nextButton.isEnabled = shouldEnableButton()
    }
    
    @IBAction private func tfDidEndEditing(_ sender: UITextField) {
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
        user.name = textFields.first?.text ?? ""
        user.surname = textFields.last?.text ?? ""
        print(user)
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
        
        textFields.forEach { textField in
            if textField.text?.count ?? 0 >= 2 {
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
        isValid(textFields)
    }
}



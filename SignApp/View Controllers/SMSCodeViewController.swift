//
//  SMSCodeViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class SMSCodeViewController: UIViewController {

    @IBOutlet var codeTF: UITextField!
    
    var phoneNumber: String!
    var code = ""
    
    unowned var delegate: SMSCodeViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        code = sendCode(to: phoneNumber)
    }
    
    @IBAction func doneButtonPressed() {
        if isVerified() {
            delegate?.verify()
            dismiss(animated: true)
        } else {
            print("Bad Input")
        }
    }

    private func isVerified() -> Bool {
        code == codeTF.text ? true : false
    }
    
    private func sendCode(to _: String) -> String {
        "123456"
    }
}

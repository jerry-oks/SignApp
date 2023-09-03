//
//  PhoneViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

protocol SMSCodeViewControllerDelegate: AnyObject {
    func verify()
}

final class PhoneViewController: UIViewController {
    
    @IBOutlet var phoneNumberTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let smscodeVC = segue.destination as? SMSCodeViewController else { return }
        smscodeVC.delegate = self
        smscodeVC.phoneNumber = phoneNumberTF.text
    }
    
}

// MARK: - SMSCodeViewControllerDelegate
extension PhoneViewController: SMSCodeViewControllerDelegate {
    func verify() {
        DataStore.shared.user.phone = phoneNumberTF.text ?? ""
        performSegue(withIdentifier: "fullnameVC", sender: self)
    }
}

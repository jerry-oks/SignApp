//
//  ProfileEditViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class ProfileEditViewController: UIViewController {
    @IBOutlet private var nameTF: UITextField!
    @IBOutlet private var surnameTF: UITextField!
    @IBOutlet private var phoneNumberTF: UITextField!
    @IBOutlet private var dobDP: UIDatePicker!
        
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.text = user.name
        surnameTF.text = user.surname
        phoneNumberTF.text = user.phone.formatted()
        dobDP.date = user.dateOfBirth
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBarController = segue.destination as? TabBarController {
            tabBarController.viewControllers?.forEach { vc in
                if let profileVC = vc as? ProfileViewController {
                    profileVC.user = user
                }
                if let settingsNC = vc as? SettingsNavigationController {
                    guard let settingsVC = settingsNC.topViewController as? SettingsViewController else { return }
                    settingsVC.user = user
                }
            }
        }
    }
    

    
    @IBAction private func saveButtonTapped(_ sender: Any) {
        user.name = nameTF.text ?? ""
        user.surname = surnameTF.text ?? ""
        user.dateOfBirth = dobDP.date
        performSegue(withIdentifier: "openTabBarVC", sender: nil)
    }
    
    
}

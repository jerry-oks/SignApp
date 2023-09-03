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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profilePicVC = segue.destination as? ProfilePicViewController {
            profilePicVC.user = user
            profilePicVC.isModal = true
        } else if let profileVC = segue.destination as? ProfileViewController {
            profileVC.user = user
        }
    }
    

    
}

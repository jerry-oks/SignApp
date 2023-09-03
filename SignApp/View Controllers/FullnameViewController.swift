//
//  FullnameViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

class FullnameViewController: UIViewController {
    
    @IBOutlet var UserName: UITextField!
    @IBOutlet var UserSurname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserName.text = User().name
        UserSurname.text = User().surname
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let profileVC = segue.destination as? ProfileViewController
      profileVC?.profileUserFullName = (UserName.text ?? "") + (UserSurname.text ?? "")
    }
    
}



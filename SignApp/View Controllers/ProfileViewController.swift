//
//  ProfileViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var userFullName: UILabel!
    @IBOutlet var userDateOfBirth: UILabel!
    
    var profileUserFullName: String?
    var profileDateOfBirth: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userFullName.text = profileUserFullName
        userFullName.text = profileDateOfBirth

       
    }
    
}

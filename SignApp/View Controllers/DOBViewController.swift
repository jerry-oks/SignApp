//
//  DOBViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

class DOBViewController: UIViewController {
    
    @IBOutlet var dateOfBirth: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateOfBirth.date = User().dateOfBirth
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let profileVC = segue.destination as? ProfileViewController
        profileVC?.profileDateOfBirth = dateOfBirth.description
    }
    

}

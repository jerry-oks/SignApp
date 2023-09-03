//
//  DOBViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class DOBViewController: UIViewController {
    @IBOutlet var dobDP: UIDatePicker!
    
    var user = User()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profilePicVC = segue.destination as? ProfilePicViewController else { return }
        profilePicVC.user = user
    }
    
    @IBAction func nextButtonTapped() {
        user.dateOfBirth = dobDP.date
        print(user)
    }
}

//
//  SettingsViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    var user = User()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileEditVC = segue.destination as? ProfileEditViewController {
            profileEditVC.user = user
        } else if true {
            
        }
    }
}

//
//  ProfilePicViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class ProfilePicViewController: UIViewController {
    @IBOutlet var profilePicIV: UIImageView!
    @IBOutlet var bgColorView: UIView!
    
    @IBOutlet var picButtons: [UIButton]!
    @IBOutlet var bgColorButtons: [UIButton]!
    
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    var user = User()
    var isModal = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picButtons.enumerated().forEach { index, button in
            button.setImage(
                UIImage(
                    systemName: DataStore.shared.images[index]
                ),
                for: .normal
            )
        }
        
        bgColorButtons.enumerated().forEach { index, button in
            let colorName = DataStore.shared.colors[index]
            button.tintColor = getColor(fromName: colorName)
        }
        
        if isModal {
            doneButton.isHidden = true
            saveButton.isHidden = false
            cancelButton.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bgColorView.layer.cornerRadius = bgColorView.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBarController = segue.destination as? TabBarController {
            tabBarController.viewControllers?.forEach { vc in
                if let profileVC = vc as? ProfileViewController {
                    profileVC.user = user
                }
            }
        } else if let profileEditVC = segue.destination as? ProfileEditViewController {
            return
        }
    }
    
    @IBAction func profilePicButtonPressed(_ sender: UIButton) {
        let index = picButtons.firstIndex(of: sender) ?? 0
        user.profilePic = DataStore.shared.images[index]
        
        profilePicIV.image = sender.imageView?.image

    }
    @IBAction func bgColorButtonPressed(_ sender: UIButton) {
        let index = bgColorButtons.firstIndex(of: sender) ?? 0
        user.profilePicColor = DataStore.shared.colors[index]
        
        bgColorView.backgroundColor = sender.tintColor
    }
    
    @IBAction func bottomButtonPressed(_ sender: UIButton) {
        switch sender {
        case doneButton:
            print(user)
        case saveButton:
            fallthrough
        default:
            dismiss(animated: true)
        }
    }
}

private extension ProfilePicViewController {
    func getColor(fromName name: String) -> UIColor {
        var color = UIColor.clear
        
        switch name {
        case "red":
            color = UIColor.systemRed
        case "yellow":
            color = UIColor.systemYellow
        case "orange":
            color = UIColor.systemOrange
        case "green":
            color = UIColor.systemGreen
        case "blue":
            color = UIColor.systemBlue
        default:
            color = UIColor.systemPurple
        }
        
        return color
    }
}

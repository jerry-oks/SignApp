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
  
    unowned var delegate: ProfilePicViewControllerDelegate!
    
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
        
        profilePicIV.image = UIImage(systemName: user.profilePic)
        bgColorView.backgroundColor = getColor(fromName: user.profilePicColor)
        
        if isModal {
            doneButton.isHidden = true
            saveButton.isHidden = false
            cancelButton.isHidden = false
            cancelButton.tintColor = .systemRed
        }
    }
    
    override func viewWillLayoutSubviews() {
        bgColorView.layer.cornerRadius = 8
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
    
    
    
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped() {
        
    }
}

private extension ProfilePicViewController {
    func getColor(fromName name: String) -> UIColor {
        var color = UIColor.separator
        
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
        case "purple":
            color = UIColor.systemPurple
        default:
            color = UIColor.separator
        }
        
        return color
    }
}

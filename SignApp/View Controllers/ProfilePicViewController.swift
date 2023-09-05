//
//  ProfilePicViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class ProfilePicViewController: UIViewController {
    @IBOutlet private var profilePicIV: UIImageView!
    @IBOutlet private var bgColorView: UIView!
    
    @IBOutlet private var picButtons: [UIButton]!
    @IBOutlet private var bgColorButtons: [UIButton]!
    
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private var saveButton: UIButton!
    @IBOutlet private var doneButton: UIButton!
  
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
    
    @IBAction private func profilePicButtonPressed(_ sender: UIButton) {
        let index = picButtons.firstIndex(of: sender) ?? 0
        user.profilePic = DataStore.shared.images[index]
        
        profilePicIV.image = sender.imageView?.image

    }
    @IBAction private func bgColorButtonPressed(_ sender: UIButton) {
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

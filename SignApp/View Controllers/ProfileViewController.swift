//
//  ProfileViewController.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 31.08.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumberStatusLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var profilePicIV: UIImageView!
    @IBOutlet var bgColorView: UIView!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUserData()
        print(user)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bgColorView.layer.cornerRadius = bgColorView.frame.height / 2
    }
    
    @IBAction private func unwind(for segue: UIStoryboardSegue) {}
}

private extension ProfileViewController {
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
    
    func showUserData() {
        fullNameLabel.text = user.fullname
        phoneNumberLabel.text = user.phone.formatted()
        dobLabel.text = user.dateOfBirth.formatted(date: .long, time: .omitted)
        profilePicIV.image = UIImage(systemName: user.profilePic)
        bgColorView.backgroundColor = getColor(fromName: user.profilePicColor)
        if user.isValidated {
            phoneNumberStatusLabel.text = "✓ Номер подтвержден"
            phoneNumberStatusLabel.textColor = .systemGreen
        } else {
            phoneNumberStatusLabel.text = "✕ Номер не подтвержден"
            phoneNumberStatusLabel.textColor = .systemRed
        }
    }
}

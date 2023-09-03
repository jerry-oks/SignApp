//
//  User.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 01.09.2023.
//

import Foundation

struct User {
    var phone = ""
    var name = ""
    var surname = ""
    var dateOfBirth = Date()
    var profilePic = ""
    var profilePicColor = ""
    
    var fullname: String {
        "\(name) \(surname)"
    }
}

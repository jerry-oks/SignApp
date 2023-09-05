//
//  User.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 01.09.2023.
//

import Foundation

struct User {
    var phone = PhoneNumber()
    var isValidated = false
    var name = ""
    var surname = ""
    var dateOfBirth = Date()
    var profilePic = "person.fill"
    var profilePicColor = ""
    
    var fullname: String {
        "\(name) \(surname)"
    }
}

struct PhoneNumber {
    var firstBlock = ""
    var secondBlock = ""
    var thirdBlock = ""
    var fourthBlock = ""

    func formatted() -> String {
        "+7 (\(firstBlock)) \(secondBlock)-\(thirdBlock)-\(fourthBlock)"
    }
}


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
    var profilePic = ""
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
    
    var full: String {
        var formatted: String {
            "+7 (\(firstBlock)) \(secondBlock)-\(thirdBlock)-\(fourthBlock)"
        }
        
        return firstBlock + secondBlock + thirdBlock + fourthBlock
    }
    
    func formatted() -> String {
        "+7 (\(firstBlock)) \(secondBlock)-\(thirdBlock)-\(fourthBlock)"
    }
}


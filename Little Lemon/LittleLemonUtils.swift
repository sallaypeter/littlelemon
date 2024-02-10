//
//  LittleLemonConstants.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

let kIsLoggedIn:String = "keyIsLoggedIn"
let kFirstName:String = "keyFirstName"
let kLastName:String = "keyLastName"
let kEmail:String = "keyEmail"
let kPhoneNumber:String = "keyPhoneNumber"
let kOrderStatuses:String = "keyOrderStatuses"
let kPasswordChanges:String = "keyPasswordChanges"
let kSpecialOffers:String = "keySpecialOffers"
let kNewsletter:String = "keyNewsletter"

func validateEmail(email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func validatePassword(_ password: String) -> Bool {
    let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}

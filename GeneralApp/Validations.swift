//
//  Validations.swift
//  GeneralApp
//
//  Created by abdallah mansour on 15/11/2023.
//

import Foundation


class Validations {
    static let shared = Validations() 
     func PhoneNumberValidation(phone: String?) throws -> String{
        guard let phone = phone , !phone.isEmpty else {
            throw ValidationErrorCases.emptyPhone
        }
        guard phone.count > 9 else {
            throw ValidationErrorCases.PhoneIsToohort
        }
        return phone
    }
     func PasswordNumberValidation(Password: String?) throws -> String{
        guard let Password = Password , !Password.isEmpty else {
            throw ValidationErrorCases.emptyPassword
        }
        guard Password.count > 5 else {
            throw ValidationErrorCases.PasswordIsWeak
        }
        return Password
    }
     func CountryCodeValidation(code:String?)throws -> String{
        guard let code = code , !code.isEmpty else {
            throw ValidationErrorCases.emptyCode
        }
        return code
    }
        
}

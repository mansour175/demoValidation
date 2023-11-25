//
//  ErrorCases.swift
//  GeneralApp
//
//  Created by abdallah mansour on 15/11/2023.
//

import Foundation


enum ValidationErrorCases:Error {
    case emptyPhone
    case PhoneIsToohort
    case emptyPassword
    case PasswordIsWeak
    case emptyCode
}
extension ValidationErrorCases:LocalizedError{
    var errorDescription: String?{
        switch self{
            
        case .emptyPhone:
            return "please enter phone number"
        case .PhoneIsToohort:
            return "phone number is too short"
        case .emptyPassword:
            return "please enter password"
        case .PasswordIsWeak:
            return "password is weak"
        case .emptyCode:
            return "please enter code "
        }
    }
    
}

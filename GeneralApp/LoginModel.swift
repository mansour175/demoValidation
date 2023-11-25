//
//  LoginModel.swift
//  GeneralApp
//
//  Created by abdallah mansour on 15/11/2023.
//

import Foundation

// MARK: - logInDataModel
struct logInDataModel: Codable {
    var key, msg: String?
    var data: LoginData?
}

// MARK: - LoginData
struct LoginData: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var countryCode, phone, fullPhone: String?
    var image: String?
    var gender, dateOfBirth, lang: String?
    var code: String?
    var address, lat, lng: String?
    var isNotify: Bool?
    var token: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case countryCode = "country_code"
        case phone
        case fullPhone = "full_phone"
        case image, gender
        case dateOfBirth = "date_of_birth"
        case lang, code, address, lat, lng
        case isNotify = "is_notify"
        case token
    }
}

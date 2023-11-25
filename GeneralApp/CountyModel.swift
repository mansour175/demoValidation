//
//  CountyModel.swift
//  GeneralApp
//
//  Created by abdallah mansour on 15/11/2023.
//

import Foundation

// MARK: - Welcome
struct countryCodeModel: Codable {
    var key, msg: String?
    var data: [countryModel]?
}

// MARK: - countryModel
struct countryModel: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var key: String?
}



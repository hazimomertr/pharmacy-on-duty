//
//  PharmacyModel.swift
//  
//
//  Created by hazem omer on 17.05.2024.
//

import Foundation

struct Pharmacy: Codable {
    let pharmacyID: Int
    let pharmacyName: String
    let address: String
    let city: String
    let district: String
    let town: String?
    let directions: String?
    let phone: String
    let phone2: String?
    let pharmacyDutyStart: String
    let pharmacyDutyEnd: String
    let latitude: Double
    let longitude: Double
}

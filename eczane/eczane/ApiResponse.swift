//
//  ApiResponse.swift
//  
//
//  Created by hazem omer on 17.05.2024.
//

import Foundation

struct PharmacyResponse: Codable {
    let status: String
    let message: String
    let messageTR: String
    let systemTime: Int
    let endpoint: String
    let rowCount: Int
    let creditUsed: Int
    let data: [Pharmacy]
}

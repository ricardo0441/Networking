//
//  User.swift
//  Networking
//
//  Created by Ricardo Rodriguez on 10/11/23.
//

import Foundation

struct UserResponse: Decodable {
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case gender
        case status
//        case createAT = "create_at"
//        case updateAT = "update_at"
        
    }
}


/*
{
    "id": 628217,
    "name": "Pran Dwivedi",
    "email": "pran_dwivedi@kihn-renner.org",
    "gender": "female",
    "status": "active"
}
*/

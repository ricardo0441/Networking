//
//  newUser.swift
//  Networking
//
//  Created by Ricardo Rodriguez on 10/12/23.
//

import Foundation

struct NewUser: Encodable {
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
}

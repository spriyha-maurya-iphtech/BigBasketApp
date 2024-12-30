//
//  User.swift
//  LoginLogout
//
//  Created by iPHTech34 on 20/11/24.
//

import Foundation
struct User: Codable {
    let uid: String
    let email: String
    let fullName: String
}


// Cart item model
struct CartItem {
    let name: String
    let price: Double
    let imageID: String
    var quantity: Int
}



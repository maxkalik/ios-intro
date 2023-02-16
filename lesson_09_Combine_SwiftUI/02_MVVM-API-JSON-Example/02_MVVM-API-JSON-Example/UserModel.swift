//
//  UserModel.swift
//  02_MVVM-API-JSON-Example
//
//  Created by Maksim Kalik on 2/16/23.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Codable {
    let name: String
}

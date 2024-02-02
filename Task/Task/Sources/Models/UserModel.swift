//
//  UserModel.swift
//  Task
//
//  Created by Mohanraj T on 01/02/24.
//

import Foundation

struct Users: Codable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}

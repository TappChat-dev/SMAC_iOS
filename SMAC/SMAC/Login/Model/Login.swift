//
//  Login.swift
//  SMAC
//
//  Created by MAC on 03/08/21.
//

import Foundation

typealias Logins = [Login]


// MARK: - login
struct Login: Codable {
    let userName: String
    let password: String
    let loginType: String

    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case password = "password"
        case loginType = "loginType"
    }
}

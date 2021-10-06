//
//  Login.swift
//  SMAC
//
//  Created by MAC on 03/08/21.
//

import Foundation

//typealias Logins = [Login]
//
//
//// MARK: - login
//struct Login: Codable {
//    let userName: String
//    let password: String
//    let loginType: String
//
//    enum CodingKeys: String, CodingKey {
//        case userName = "userName"
//        case password = "password"
//        case loginType = "loginType"
//    }
//}


typealias Logins = [LoginElement]

// MARK: - LoginElement
struct LoginElement: Codable {
    let firstname, lastname, gender: String
    let officialEMAIL: JSONNull?
    let personalEMAIL, panNO, desig, adhaarNO: String
    let org: String
    let techID: JSONNull?
    let mobileNO: Int
    let panno, city, state: JSONNull?
    let isACTIVE: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case firstname, lastname, gender
        case officialEMAIL = "official_EMAIL"
        case personalEMAIL = "personal_EMAIL"
        case panNO = "pan_NO"
        case desig
        case adhaarNO = "adhaar_NO"
        case org
        case techID = "tech_ID"
        case mobileNO = "mobile_NO"
        case panno, city, state
        case isACTIVE = "is_ACTIVE"
        case message
    }
}
// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

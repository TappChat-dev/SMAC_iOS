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


//typealias Logins = [LoginElement]
typealias Logins = LoginElement

// MARK: - LoginElement
struct LoginElement:Codable{
let result: [ResultLogin]
let pResult, msg: String

enum CodingKeys: String, CodingKey {
    case result
    case pResult = "P_RESULT"
    case msg
}
}
struct ResultLogin: Codable {
    let pid, pno, firstname: String
    let lastname: JSONNull?
    let unitName, unit, station, rank: String
    let mobilenumber, officialemail, personalemail, panno: JSONNull?
    let adhaarno, desig: JSONNull?
    let isActive, org, userName: String

    enum CodingKeys: String, CodingKey {
        case pid = "PID"
        case pno = "PNO"
        case firstname = "FIRSTNAME"
        case lastname = "LASTNAME"
        case unitName = "UNIT_NAME"
        case unit = "UNIT"
        case station = "STATION"
        case rank = "RANK"
        case mobilenumber = "MOBILENUMBER"
        case officialemail = "OFFICIALEMAIL"
        case personalemail = "PERSONALEMAIL"
        case panno = "PANNO"
        case adhaarno = "ADHAARNO"
        case desig = "DESIG"
        case isActive = "IS_ACTIVE"
        case org = "ORG"
        case userName = "USER_NAME"
    }
}
/*
struct LoginElement: Codable {
    let profile: JSONNull?
    let message: String
    let station, role, pID, pNO: JSONNull?
    let rank: JSONNull?
    let username: String
    let unit: JSONNull?
    let firstname, lastname: String
    let gender: JSONNull?
    let mobileNO: Int
    let officialEMAIL, personalEMAIL, panNO, desig: String
    let adhaarNO, org, techID: String
    let city, state: JSONNull?
    let isACTIVE: Int

    enum CodingKeys: String, CodingKey {
        case profile, message, station, role, pID, pNO, rank, username, unit, firstname, lastname, gender
        case mobileNO = "mobile_NO"
        case officialEMAIL = "official_EMAIL"
        case personalEMAIL = "personal_EMAIL"
        case panNO = "pan_NO"
        case desig
        case adhaarNO = "adhaar_NO"
        case org
        case techID = "tech_ID"
        case city, state
        case isACTIVE = "is_ACTIVE"
    }
}*/
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


struct RoleResponsiblity: Codable {
    let error: Bool
    let message: String
    let users: [UserRole]

    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case message = "Message"
        case users = "Users"
    }
}

// MARK: - User
struct UserRole: Codable {
    let rID, descr: String

    enum CodingKeys: String, CodingKey {
        case rID = "R_ID"
        case descr = "DESCR"
    }
}

typealias responsiblity = RoleResponsiblity

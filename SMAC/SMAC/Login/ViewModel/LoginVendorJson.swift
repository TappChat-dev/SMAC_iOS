//
//  LoginVendorJson.swift
//  SMAC
//
//  Created by MAC on 09/12/21.
//

import Foundation

struct LoginVendorJson:Codable{
    let result: [VenderResult]
    let pResult, status, msg, uimsg: String

    enum CodingKeys: String, CodingKey {
        case result
        case pResult = "P_RESULT"
        case status = "STATUS"
        case msg, uimsg
    }
}

struct VenderResult: Codable {
    let pid, pno: JSONNull?
    let techID, firstname: String
    let lastname, unitName, unit, station: JSONNull?
    let rank: JSONNull?
    let mobilenumber: Int
    let officialemail: String
    let personalemail, panno, adhaarno, desig: JSONNull?
    let isActive: JSONNull?
    let org, userName: String

    enum CodingKeys: String, CodingKey {
        case pid = "PID"
        case pno = "PNO"
        case techID = "TECH_ID"
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

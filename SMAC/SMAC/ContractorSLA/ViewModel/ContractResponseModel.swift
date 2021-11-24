//
//  ContractModel.swift
//  SMAC
//
//  Created by MAC on 10/11/21.
//

import Foundation

struct ContractResponseModel: Codable {
    let error: Bool
    let message: String
    let users: [UserContract]

    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case message = "Message"
        case users = "Users"
    }
}


// MARK: - User
struct UserContract: Codable {
    let contractID, vendorID: String
    let isActive: Int
    let contractDt, contractNo, contractAuth, contractName: String
    let smacDt, contractDescr: String
    let contractDocs, slaDocs: String?
    let unit, station: String
    let duration: Int
    let fmDt, endDt, contractType, pid: String

    enum CodingKeys: String, CodingKey {
        case contractID = "CONTRACT_ID"
        case vendorID = "VENDOR_ID"
        case isActive = "IS_ACTIVE"
        case contractDt = "CONTRACT_DT"
        case contractNo = "CONTRACT_NO"
        case contractAuth = "CONTRACT_AUTH"
        case contractName = "CONTRACT_NAME"
        case smacDt = "SMAC_DT"
        case contractDescr = "CONTRACT_DESCR"
        case contractDocs = "CONTRACT_DOCS"
        case slaDocs = "SLA_DOCS"
        case unit = "UNIT"
        case station = "STATION"
        case duration = "DURATION"
        case fmDt = "FM_DT"
        case endDt = "END_DT"
        case contractType = "CONTRACT_TYPE"
        case pid = "PID"
    }
}

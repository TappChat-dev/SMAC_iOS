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


//MARK: Modify second time
struct RedefineAllContract:Codable {
    let result: [RedefineResult]
    let status, msg: String

    enum CodingKeys: String, CodingKey {
        case result
        case status = "STATUS"
        case msg
    }
}

struct RedefineResult: Codable {
    let contractID, vendorID: String
    let vendorName: String?
    let contractDt, contractNo, contractName, contractDescr: String
    let contractDocs: String?
    let slaDocs, unitContractCreator, contractCreatedBy, stationContractCreator: String
    let stationName: String
    let duration: Int
    let fmDt, endDt, contractType: String
    let contractTypeName: String?
    let pid, contractStatus: String

    enum CodingKeys: String, CodingKey {
        case contractID = "CONTRACT_ID"
        case vendorID = "VENDOR_ID"
        case vendorName = "VENDOR_NAME"
        case contractDt = "CONTRACT_DT"
        case contractNo = "CONTRACT_NO"
        case contractName = "CONTRACT_NAME"
        case contractDescr = "CONTRACT_DESCR"
        case contractDocs = "CONTRACT_DOCS"
        case slaDocs = "SLA_DOCS"
        case unitContractCreator = "UNIT_CONTRACT_CREATOR"
        case contractCreatedBy = "CONTRACT_CREATED_BY"
        case stationContractCreator = "STATION_CONTRACT_CREATOR"
        case stationName = "STATION_NAME"
        case duration = "DURATION"
        case fmDt = "FM_DT"
        case endDt = "END_DT"
        case contractType = "CONTRACT_TYPE"
        case contractTypeName = "CONTRACT_TYPE_NAME"
        case pid = "PID"
        case contractStatus = "CONTRACT_STATUS"
    }
}


enum ContractCreatedBy: String, Codable {
    case dteInformationTechnology = "Dte. Information Technology"
    case icgsDelhi = "ICGS Delhi"
}

enum ContractDocs: String, Codable {
    case sample = "SAMPLE"
    case smaple = "smaple"
}

enum ContractStatus: String, Codable {
    case contractCreated = "CONTRACT CREATED"
    case equipmentNotMapped = "EQUIPMENT NOT MAPPED"
    case slaNotConfigured = "SLA NOT CONFIGURED"
}

enum ContractTypeName: String, Codable {
    case allInclusiveAnnualMaintenanceContractAIAMC = "All Inclusive Annual Maintenance Contract (AIAMC)"
    case annualMaintenanceContractAMC = "Annual Maintenance Contract (AMC)"
    case spareRCServiceRC = "Spare RC + Service RC"
}

enum StationName: String, Codable {
    case delhi = "Delhi"
}

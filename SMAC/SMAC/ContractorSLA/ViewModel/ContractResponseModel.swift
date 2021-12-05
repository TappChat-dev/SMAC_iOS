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
    let vendorName: VendorName?
    let contractDt: ContractDt?
    let contractNo: String?
    let contractName: String
    let contractDescr: ContractDescr?
    let contractDocs: ContractDocs?
    let slaDocs: SlaDocs?
    let unitContractCreator: String
    let contractCreatedBy: ContractCreatedBy
    let stationContractCreator: String
    let stationName: StationName
    let duration: Int?
    let fmDt: FmDt?
    let endDt: EndDt?
    let contractType: String
    let contractTypeName: String?
    let pid: String
    let contractStatus: ContractStatus

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
}

enum ContractDescr: String, Codable {
    case hello = "hello"
    case icgsSAMARMaintiananceContract = "ICGS SAMAR Maintianance contract"
    case the3YearsOfContractOfSDOTTeam = "3 Years of contract of SDOT Team"
}

enum ContractDocs: String, Codable {
    case sample = "SAMPLE"
}

enum ContractDt: String, Codable {
    case the20211031T183000000Z = "2021-10-31T18:30:00.000Z"
    case the20211101T070720000Z = "2021-11-01T07:07:20.000Z"
    case the20211114T183000000Z = "2021-11-14T18:30:00.000Z"
}

enum ContractStatus: String, Codable {
    case contractApproved = "CONTRACT APPROVED"
    case equipmentNotMapped = "EQUIPMENT NOT MAPPED"
}

enum EndDt: String, Codable {
    case the20211229T183000000Z = "2021-12-29T18:30:00.000Z"
    case the20211230T070748000Z = "2021-12-30T07:07:48.000Z"
    case the20221114T183000000Z = "2022-11-14T18:30:00.000Z"
}

enum FmDt: String, Codable {
    case the20211031T183000000Z = "2021-10-31T18:30:00.000Z"
    case the20211115T183000000Z = "2021-11-15T18:30:00.000Z"
}

enum SlaDocs: String, Codable {
    case sla00215112021 = "SLA-00215112021"
}

enum StationName: String, Codable {
    case delhi = "Delhi"
}
enum VendorName: String, Codable {
    case mSKongsbergMaritimeMumbai = "M/s Kongsberg Maritime, Mumbai"
}

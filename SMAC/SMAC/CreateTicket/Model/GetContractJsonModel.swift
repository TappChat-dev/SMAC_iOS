//
//  GetContractJsonModel.swift
//  SMAC
//
//  Created by MAC on 25/10/21.
//

import Foundation



//struct GetContractJsonModel: Codable {
//    let contractID, vendorID, isActive, contractRef: String
//    let contractDt, fileNo, contractAuth: String
//    let contractDoc: JSONNull?
//    let contractEXT: Int
//    let contractName: String
//    let contractShort: JSONNull?
//    let smacDt: String
//
//    enum CodingKeys: String, CodingKey {
//        case contractID = "contractId"
//        case vendorID = "vendorId"
//        case isActive, contractRef, contractDt, fileNo, contractAuth, contractDoc
//        case contractEXT = "contractExt"
//        case contractName, contractShort, smacDt
//    }
//}

struct GetContractJsonModel:Codable {
    let contractID, vendorID: String
    let isActive: Int
    let contractDt, contractNo, contractAuth, contractName: String
    let smacDt, contractDescr: String
    let contractDoc, slaDocs: String?
    let station: String
    let duration: Int
    let fmDate, endDate, contractType, unit: String

    enum CodingKeys: String, CodingKey {
        case contractID = "contractId"
        case vendorID = "vendorId"
        case isActive, contractDt, contractNo, contractAuth, contractName, smacDt, contractDescr, contractDoc, slaDocs, station, duration, fmDate, endDate, contractType, unit
    }
}

typealias getContractJson = [GetContractJsonModel]


class JSONNulls: Codable, Hashable {
    
    public static func == (lhs: JSONNulls, rhs: JSONNulls) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNulls.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

struct GetContractJsonModelTicket: Codable {
    let result: [ContractCreateTicket]
    let status, msg: String

    enum CodingKeys: String, CodingKey {
        case result
        case status = "STATUS"
        case msg
    }
}
// MARK: - Result
/*
struct ContractCreateTicket: Codable {
    let contractID, vendorID, vendorName, contractDt: String
    let contractNo, contractAuthName, contractName, contractDescr: String
    let contractDocs, slaDocs: JSONNull?
    let unit, unitName, station, stationName: String
    let duration: Int
    let fmDt, endDt, contractType, contractTypeName: String
    let pid: String
    let isSlaActive: Int

    enum CodingKeys: String, CodingKey {
        case contractID = "CONTRACT_ID"
        case vendorID = "VENDOR_ID"
        case vendorName = "VENDOR_NAME"
        case contractDt = "CONTRACT_DT"
        case contractNo = "CONTRACT_NO"
        case contractAuthName = "CONTRACT_AUTH_NAME"
        case contractName = "CONTRACT_NAME"
        case contractDescr = "CONTRACT_DESCR"
        case contractDocs = "CONTRACT_DOCS"
        case slaDocs = "SLA_DOCS"
        case unit = "UNIT"
        case unitName = "UNIT_NAME"
        case station = "STATION"
        case stationName = "STATION_NAME"
        case duration = "DURATION"
        case fmDt = "FM_DT"
        case endDt = "END_DT"
        case contractType = "CONTRACT_TYPE"
        case contractTypeName = "CONTRACT_TYPE_NAME"
        case pid = "PID"
        case isSlaActive = "IS_SLA_ACTIVE"
    }
}
*/
struct ContractCreateTicket: Codable{
    let contractID, vendorID: String
    let vendorName: JSONNull?
    let contractDt: String
    let contractNo: JSONNull?
    let contractAuthName, contractName: String
    let contractDescr, contractDocs, slaDocs: JSONNull?
    let unitContractCreator, unitName, stationContractCreator, stationName: String
    let duration: Int
    let fmDt, endDt, contractType, contractTypeName: String
    let pid: String

    enum CodingKeys: String, CodingKey {
        case contractID = "CONTRACT_ID"
        case vendorID = "VENDOR_ID"
        case vendorName = "VENDOR_NAME"
        case contractDt = "CONTRACT_DT"
        case contractNo = "CONTRACT_NO"
        case contractAuthName = "CONTRACT_AUTH_NAME"
        case contractName = "CONTRACT_NAME"
        case contractDescr = "CONTRACT_DESCR"
        case contractDocs = "CONTRACT_DOCS"
        case slaDocs = "SLA_DOCS"
        case unitContractCreator = "UNIT_CONTRACT_CREATOR"
        case unitName = "UNIT_NAME"
        case stationContractCreator = "STATION_CONTRACT_CREATOR"
        case stationName = "STATION_NAME"
        case duration = "DURATION"
        case fmDt = "FM_DT"
        case endDt = "END_DT"
        case contractType = "CONTRACT_TYPE"
        case contractTypeName = "CONTRACT_TYPE_NAME"
        case pid = "PID"
    }
}

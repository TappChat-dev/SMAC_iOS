//
//  GetContractJsonModel.swift
//  SMAC
//
//  Created by MAC on 25/10/21.
//

import Foundation



struct GetContractJsonModel: Codable {
    let contractID, vendorID, isActive, contractRef: String
    let contractDt, fileNo, contractAuth: String
    let contractDoc: JSONNull?
    let contractEXT: Int
    let contractName: String
    let contractShort: JSONNull?
    let smacDt: String

    enum CodingKeys: String, CodingKey {
        case contractID = "contractId"
        case vendorID = "vendorId"
        case isActive, contractRef, contractDt, fileNo, contractAuth, contractDoc
        case contractEXT = "contractExt"
        case contractName, contractShort, smacDt
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

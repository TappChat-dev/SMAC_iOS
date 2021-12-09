//
//  ContractResponseJson.swift
//  SMAC
//
//  Created by MAC on 08/12/21.
//

import Foundation
struct ContractResponseJson : Codable {
    let result : [ContractJsonResult]?
    let sTATUS : String?
    let msg : String?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case sTATUS = "STATUS"
        case msg = "msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent([ContractJsonResult].self, forKey: .result)
        sTATUS = try values.decodeIfPresent(String.self, forKey: .sTATUS)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }

}

struct ContractJsonResult : Codable {
    let cONTRACT_ID : String?
    let vENDOR_ID : String?
    let vENDOR_NAME : String?
    let cONTRACT_DT : String?
    let cONTRACT_NO : String?
    let cONTRACT_NAME : String?
    let cONTRACT_DESCR : String?
    let cONTRACT_DOCS : String?
    let sLA_DOCS : String?
    let uNIT_CONTRACT_CREATOR : String?
    let cONTRACT_CREATED_BY : String?
    let sTATION_CONTRACT_CREATOR : String?
    let sTATION_NAME : String?
    let dURATION : Int?
    let fM_DT : String?
    let eND_DT : String?
    let cONTRACT_TYPE : String?
    let cONTRACT_TYPE_NAME : String?
    let pID : String?
    let cONTRACT_STATUS : String?

    enum CodingKeys: String, CodingKey {

        case cONTRACT_ID = "CONTRACT_ID"
        case vENDOR_ID = "VENDOR_ID"
        case vENDOR_NAME = "VENDOR_NAME"
        case cONTRACT_DT = "CONTRACT_DT"
        case cONTRACT_NO = "CONTRACT_NO"
        case cONTRACT_NAME = "CONTRACT_NAME"
        case cONTRACT_DESCR = "CONTRACT_DESCR"
        case cONTRACT_DOCS = "CONTRACT_DOCS"
        case sLA_DOCS = "SLA_DOCS"
        case uNIT_CONTRACT_CREATOR = "UNIT_CONTRACT_CREATOR"
        case cONTRACT_CREATED_BY = "CONTRACT_CREATED_BY"
        case sTATION_CONTRACT_CREATOR = "STATION_CONTRACT_CREATOR"
        case sTATION_NAME = "STATION_NAME"
        case dURATION = "DURATION"
        case fM_DT = "FM_DT"
        case eND_DT = "END_DT"
        case cONTRACT_TYPE = "CONTRACT_TYPE"
        case cONTRACT_TYPE_NAME = "CONTRACT_TYPE_NAME"
        case pID = "PID"
        case cONTRACT_STATUS = "CONTRACT_STATUS"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cONTRACT_ID = try values.decodeIfPresent(String.self, forKey: .cONTRACT_ID)
        vENDOR_ID = try values.decodeIfPresent(String.self, forKey: .vENDOR_ID)
        vENDOR_NAME = try values.decodeIfPresent(String.self, forKey: .vENDOR_NAME)
        cONTRACT_DT = try values.decodeIfPresent(String.self, forKey: .cONTRACT_DT)
        cONTRACT_NO = try values.decodeIfPresent(String.self, forKey: .cONTRACT_NO)
        cONTRACT_NAME = try values.decodeIfPresent(String.self, forKey: .cONTRACT_NAME)
        cONTRACT_DESCR = try values.decodeIfPresent(String.self, forKey: .cONTRACT_DESCR)
        cONTRACT_DOCS = try values.decodeIfPresent(String.self, forKey: .cONTRACT_DOCS)
        sLA_DOCS = try values.decodeIfPresent(String.self, forKey: .sLA_DOCS)
        uNIT_CONTRACT_CREATOR = try values.decodeIfPresent(String.self, forKey: .uNIT_CONTRACT_CREATOR)
        cONTRACT_CREATED_BY = try values.decodeIfPresent(String.self, forKey: .cONTRACT_CREATED_BY)
        sTATION_CONTRACT_CREATOR = try values.decodeIfPresent(String.self, forKey: .sTATION_CONTRACT_CREATOR)
        sTATION_NAME = try values.decodeIfPresent(String.self, forKey: .sTATION_NAME)
        dURATION = try values.decodeIfPresent(Int.self, forKey: .dURATION)
        fM_DT = try values.decodeIfPresent(String.self, forKey: .fM_DT)
        eND_DT = try values.decodeIfPresent(String.self, forKey: .eND_DT)
        cONTRACT_TYPE = try values.decodeIfPresent(String.self, forKey: .cONTRACT_TYPE)
        cONTRACT_TYPE_NAME = try values.decodeIfPresent(String.self, forKey: .cONTRACT_TYPE_NAME)
        pID = try values.decodeIfPresent(String.self, forKey: .pID)
        cONTRACT_STATUS = try values.decodeIfPresent(String.self, forKey: .cONTRACT_STATUS)
    }

}

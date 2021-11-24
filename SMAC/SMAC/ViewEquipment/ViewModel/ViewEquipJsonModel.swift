//
//  ViewEquipJsonModel.swift
//  SMAC
//
//  Created by MAC on 03/11/21.
//

import Foundation

struct ViewEquipJsonModel: Codable{
let result: [ResultEquipment]
let msg: String
}

// MARK: - Result
struct ResultEquipment: Codable {
    let eqptID: String
    let name, eqptDescr, eqptType: String?


    enum CodingKeys: String, CodingKey {
        case eqptID = "EQPT_ID"
        case name = "NAME"
        case eqptDescr = "EQPT_DESCR"
        case eqptType = "EQPT_TYPE"
    }
}

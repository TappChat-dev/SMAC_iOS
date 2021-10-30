//
//  EquipmentSubTypeJsonModel.swift
//  SMAC
//
//  Created by MAC on 20/10/21.
//

import Foundation
struct EquipmentSubTypeJsonModel : Codable {
    let eqptType, eqptSubType, short, name: String

    enum CodingKeys: String, CodingKey {
        case eqptType = "eqpt_Type"
        case eqptSubType = "eqpt_SubType"
        case short, name
    }
}

typealias equipmentSubType = [EquipmentSubTypeJsonModel]

//
//  EquipmentRoleJsonModel.swift
//  SMAC
//
//  Created by MAC on 20/10/21.
//

import Foundation
struct EquipmentRoleJsonModel : Codable {
    let descr, rID, short: String

    enum CodingKeys: String, CodingKey {
        case descr
        case rID = "r_Id"
        case short
    }
}

typealias equipmentRole = [EquipmentRoleJsonModel]

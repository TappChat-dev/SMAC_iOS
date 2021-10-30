//
//  EquipmentPriorityJsonModel.swift
//  SMAC
//
//  Created by MAC on 20/10/21.
//

import Foundation
struct EquipmentPriorityJsonModel : Codable {
    let descr, tpID, sdescr: String

    enum CodingKeys: String, CodingKey {
        case descr
        case tpID = "tp_Id"
        case sdescr
    }
}

typealias equipmentPriority = [EquipmentPriorityJsonModel]

//
//  EquipmentProjectJsonModel.swift
//  SMAC
//
//  Created by MAC on 20/10/21.
//

import Foundation
struct EquipmentProjectJsonModel : Codable {
    let project, short, name: String
}

typealias equipmentProject = [EquipmentProjectJsonModel]

//
//  EquipmentTypeJsonModel.swift
//  SMAC
//
//  Created by MAC on 20/10/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct EquipmentTypeJsonModel: Codable {
    let eqptType, short, name: String

    enum CodingKeys: String, CodingKey {
        case eqptType = "eqpt_Type"
        case short, name
    }
}

typealias EquipmentType = [EquipmentTypeJsonModel]

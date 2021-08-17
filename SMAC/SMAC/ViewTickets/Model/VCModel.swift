//
//  VCModel.swift
//  SMAC
//
//  Created by MAC on 17/08/21.
//

import Foundation

typealias tickets = [AllTicket]

// MARK: - Employee
struct AllTicket: Codable {
    let id: String
    let unitName: String
    let status: String
    let date: String

    enum CodingKeys: String, CodingKey {
        case id
        case unitName = "unitName"
        case status = "status"
        case date = "date"
    }
}

//
//  UpdateTicketModel.swift
//  SMAC
//
//  Created by MAC on 25/11/21.
//

import Foundation
// MARK: - Welcome
struct UpdateTicketModel: Codable {
    let result: [UpdateResult]
    let status, msg: String

    enum CodingKeys: String, CodingKey {
        case result
        case status = "STATUS"
        case msg
    }
}

// MARK: - Result
struct UpdateResult: Codable {
    let ticketStatus, descr: String

    enum CodingKeys: String, CodingKey {
        case ticketStatus = "TICKET_STATUS"
        case descr = "DESCR"
    }
}

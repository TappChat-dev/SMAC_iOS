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

struct ViewAllTicket:Codable {
    let eqptid, eqptType, eqptSubtype, createdDT: String
    let closedDT: JSONNull?
    let isActive: Int
    let ticketStatus, userID, subject, unit: String
    let serviceType: String
    let docPath, contractID: String?
    let descr, ticketID: String

    enum CodingKeys: String, CodingKey {
        case eqptid
        case eqptType = "eqpt_Type"
        case eqptSubtype = "eqpt_Subtype"
        case createdDT = "created_DT"
        case closedDT = "closed_DT"
        case isActive = "is_Active"
        case ticketStatus = "ticket_Status"
        case userID = "user_Id"
        case subject, unit
        case serviceType = "service_Type"
        case docPath = "doc_Path"
        case contractID = "contract_Id"
        case descr
        case ticketID = "ticket_ID"
    }
}

typealias viewAllTickets = [ViewAllTicket]

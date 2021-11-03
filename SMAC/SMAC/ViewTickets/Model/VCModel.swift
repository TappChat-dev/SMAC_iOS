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
/*
 
 
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
 */

struct ViewAllTicket:Codable {
//    let result: [ResultTickets]
//    let pOutMessage, msg: String
//
//    enum CodingKeys: String, CodingKey {
//        case result
//        case pOutMessage = "P_Out_Message"
//        case msg
//    }
    
        let result: [[String: String?]]
        let pOutMessage, msg: String

        enum CodingKeys: String, CodingKey {
            case result
            case pOutMessage = "P_Out_Message"
            case msg
        }
}

// MARK: - Result
struct ResultTickets: Codable {
    let ticketID: String
    let contractID, contractName: String?
    let eqptID, equipmentName, eqptType: String

    enum CodingKeys: String, CodingKey {
        case ticketID = "TICKET_ID"
        case contractID = "CONTRACT_ID"
        case contractName = "CONTRACT_NAME"
        case eqptID = "EQPT_ID"
        case equipmentName = "EQUIPMENT_NAME"
        case eqptType = "EQPT_TYPE"
    }
}
typealias viewAllTickets = ViewAllTicket
/*
             "CONTRACT_ID": "CT0007",
             "SUBJECT": "ASHA Application not working",
             "DESCR": "ASHA Application not working",
             "CONTRACT_NAME": "ASHA Healthcare- AMC\r",
             "EQPT_ID": "E00005",
             "UNIT": "000227",
             "UNIT_NAME": "Dte. Information Technology",
             "SERVICE_TYPE": "remote",
             "EQUIPMENT_NAME": "ASHA Application maintaince",
             "EQPT_TYPE": "SD",
             "TICKET_STATUS": "PD",
             "TICKET_STATUS_NAME": "PENDING"
 */

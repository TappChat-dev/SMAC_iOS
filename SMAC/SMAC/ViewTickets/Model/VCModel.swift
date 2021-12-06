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
    let result: [ResultTickets]
//      let message, msg, status: String
    let status, msg: String

      enum CodingKeys: String, CodingKey {
          case result
          case status = "STATUS"
          case msg
      }
    
//        let result: [[String: String?]]
//        let pOutMessage, msg: String
//
//        enum CodingKeys: String, CodingKey {
//            case result
//            case pOutMessage = "P_Out_Message"
//            case msg
//        }
}

// MARK: - Result
struct ResultTickets: Codable {
    let ticketID, contractID, createdDt, subject: String
    let descr, contractName, eqptID, ticketForUnit: String
    let unitName, serviceType: String
    let equipmentName: String?
    let ticketStatus, ticketStatusName: String
    let isPaneltyActive: Int
    let nacRequestedDt: String
    let isNac, responseTime: Int
    let eqptUsername: String?
    let contactNo: Int?
    let eqptSerialNo, eqptLocation: String

    enum CodingKeys: String, CodingKey {
        case ticketID = "TICKET_ID"
        case contractID = "CONTRACT_ID"
        case createdDt = "CREATED_DT"
        case subject = "SUBJECT"
        case descr = "DESCR"
        case contractName = "CONTRACT_NAME"
        case eqptID = "EQPT_ID"
        case ticketForUnit = "TICKET_FOR_UNIT"
        case unitName = "UNIT_NAME"
        case serviceType = "SERVICE_TYPE"
        case equipmentName = "EQUIPMENT_NAME"
        case ticketStatus = "TICKET_STATUS"
        case ticketStatusName = "TICKET_STATUS_NAME"
        case isPaneltyActive = "IS_PANELTY_ACTIVE"
        case nacRequestedDt = "NAC_REQUESTED_DT"
        case isNac = "IS_NAC"
        case responseTime = "RESPONSE_TIME"
        case eqptUsername = "EQPT_USERNAME"
        case contactNo = "CONTACT_NO"
        case eqptSerialNo = "EQPT_SERIAL_NO"
        case eqptLocation = "EQPT_LOCATION"
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



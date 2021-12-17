//
//  PenaltyResponse.swift
//  SMAC
//
//  Created by MAC on 17/12/21.
//

import Foundation
import UIKit

typealias penaltyTicket = PenaltyResponse


struct PenaltyResponse: Codable {
    let result: [PeynaltyResult]
    let status, msg: String

    enum CodingKeys: String, CodingKey {
        case result
        case status = "STATUS"
        case msg
    }
}

// MARK: - Result
struct PeynaltyResult: Codable {
    let ticketID: String
    let contractID: ContractID
    let createdDt, subject, descr: String
    let contractName: ContractName
    let eqptID, ticketForUnit: String
    let unitName: UnitName
    let serviceType: ServiceType
    let equipmentName: EquipmentName?
    let ticketStatus, ticketStatusName: String
    let isPaneltyActive, isNac, responseTime: Int
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
        case isNac = "IS_NAC"
        case responseTime = "RESPONSE_TIME"
        case eqptUsername = "EQPT_USERNAME"
        case contactNo = "CONTACT_NO"
        case eqptSerialNo = "EQPT_SERIAL_NO"
        case eqptLocation = "EQPT_LOCATION"
    }
}

enum ContractID: String, Codable {
    case ct0001 = "CT0001"
}

enum ContractName: String, Codable {
    case abc = "ABC"
}

enum EquipmentName: String, Codable {
    case cctvCamera = "CCTV Camera"
    case heater = "Heater"
    case sensor2 = "SENSOR2"
}

enum ServiceType: String, Codable {
    case onsite = "onsite"
    case remote = "REMOTE"
    case serviceTYPERemote = "Remote"
}

enum UnitName: String, Codable {
    case dteInformationTechnology = "Dte. Information Technology"
    case icgsDelhi = "ICGS Delhi"
}


struct OtherData: Codable {
    let result: [OtherResult]
    let status, msg: String

    enum CodingKeys: String, CodingKey {
        case result
        case status = "STATUS"
        case msg
    }
}

// MARK: - Result
struct OtherResult: Codable {
    let contractName, contractType, contractCost, contractGst: String
    let customDuty: Int
    let totalContractCost, ticketID, ticketGeneratedDate, ticketStatus: String
    let equipmentName, assignedTo, lastUpdate: String
    let lastRemark: JSONNull?
    let nonOpsDays: Int
    let totalPaneltyDays: JSONNull?
    let serviceType, serviceSubType: String
    let quaterlyUnitCost: Int
    let basicUnitCost, spareCost: Int?
    let totalDelay: Int
    let ldRate: Double?
    let maximumLd: Int?
    let payablePenalty: Double
    let daysInQuarter, unitCost: Int

    enum CodingKeys: String, CodingKey {
        case contractName = "CONTRACT_NAME"
        case contractType = "CONTRACT_TYPE"
        case contractCost = "CONTRACT_COST"
        case contractGst = "CONTRACT_GST"
        case customDuty = "CUSTOM_DUTY"
        case totalContractCost = "TOTAL_CONTRACT_COST"
        case ticketID = "TICKET_ID"
        case ticketGeneratedDate = "TICKET_GENERATED_DATE"
        case ticketStatus = "TICKET_STATUS"
        case equipmentName = "EQUIPMENT_NAME"
        case assignedTo = "ASSIGNED_TO"
        case lastUpdate = "LAST_UPDATE"
        case lastRemark = "LAST_REMARK"
        case nonOpsDays = "NON_OPS_DAYS"
        case totalPaneltyDays = "TOTAL_PANELTY_DAYS"
        case serviceType = "SERVICE_TYPE"
        case serviceSubType = "SERVICE_SUB_TYPE"
        case quaterlyUnitCost = "QUATERLY_UNIT_COST"
        case basicUnitCost = "BASIC_UNIT_COST"
        case spareCost = "SPARE_COST"
        case totalDelay = "TOTAL_DELAY"
        case ldRate = "LD_RATE"
        case maximumLd = "MAXIMUM_LD"
        case payablePenalty = "PAYABLE_PENALTY"
        case daysInQuarter = "DAYS_IN_QUARTER"
        case unitCost = "UNIT_COST"
    }
}

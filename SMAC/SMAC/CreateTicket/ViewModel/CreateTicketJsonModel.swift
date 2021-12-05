//
//  CreateTicketJsonModel.swift
//  SMAC
//
//  Created by MAC on 14/10/21.
//

import Foundation

struct CreateTicketJsonModel {
    
    var description: String
    var subject: String
//    var unit:String
    var equipmentID: String
    var ticketForUnit: String
    var serviceType: String
    var docPath: String
    var ContractID: String
    var responseTime: String
    var creatorID:String
    var eqpt_username:String
    var contactNO:String
    var eqptSerialNo:String
    var eqptLocation:String
    
    init() {
        description = ""
        subject = ""
//        unit = ""
        equipmentID = ""
        ticketForUnit = ""
        serviceType = ""
        docPath = ""
        ContractID = ""
        responseTime = ""
        creatorID = ""
        eqpt_username = ""
        contactNO = ""
        eqptSerialNo = ""
        eqptLocation = ""
        
        
    }
    
    init(description: String, subject: String,equip_ID: String,ticketUnit: String,servicetype:String,docpath:String, contractsID:String,response_Time: String,creator_ID:String,equpt_Username:String,contact_NO:String,eqpt_SerialNo:String,eqpt_Location:String) {
        self.description = description
        self.subject = subject
        self.equipmentID = equip_ID
        self.ticketForUnit = ticketUnit
        self.serviceType = servicetype
        self.docPath = docpath
        self.ContractID = contractsID
        self.responseTime = response_Time
        self.creatorID = creator_ID
        self.eqpt_username = equpt_Username
        self.contactNO = contact_NO
        self.eqptSerialNo = eqpt_SerialNo
        self.eqptLocation = eqpt_Location
    }
    
    static func encode(object: CreateTicketJsonModel) -> Any {
        var user = [String: Any]()
        
        user["P_DESCR"] = object.description
        user["P_SUBJECT"] = object.subject
        user["P_EQPT_ID"] = object.equipmentID
        user["P_TICKET_FOR_UNIT"] = object.ticketForUnit
        user["P_SERVICE_TYPE"] = object.serviceType
        user["P_DOC_PATH"] = object.docPath
        user["P_CONTRACT_ID"] = object.ContractID
        user["P_RESPONSE_TIME"] = object.responseTime
        user["P_CREATOR_ID"] = object.creatorID
        user["P_EQPT_USERNAME"] = object.eqpt_username
        user["P_CONTACT_NO"] = object.contactNO
        user["P_EQPT_SERIAL_NO"] = object.eqptSerialNo
        user["P_EQPT_LOCATION"] = object.eqptLocation

        return user
    }
}


struct jsonDictionary{
    var p_ID: String
    var p_TYPE: String
    
    init() {
        p_ID = ""
        p_TYPE = ""
        
    }
    init(id:String,type:String) {
        self.p_ID = id
        self.p_TYPE = type
    }
    static func encode(object: jsonDictionary) -> Any {
        var user = [String: Any]()
        
        user["p_ID"] = object.p_ID
        user["p_TYPE"] = object.p_TYPE
        return user
    }
}

struct jsonDictionaryForGetContract{
    var contracts_ID: String
    
    init() {
        contracts_ID = ""
        
    }
    init(id:String) {
        self.contracts_ID = id
    }
    static func encode(object: jsonDictionaryForGetContract) -> Any {
        var user = [String: Any]()
        user["contracts_ID"] = object.contracts_ID
        return user
    }
}

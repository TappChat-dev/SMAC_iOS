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
    var unit:String
    var equipmentID: String
    var equipmentType: String
    var serviceType: String
    var ContractID: String
    var userName: String
    var docPath: String
    
    init() {
        description = ""
        subject = ""
        unit = ""
        equipmentID = ""
        equipmentType = ""
        serviceType = ""
        ContractID = ""
        userName = ""
        docPath = ""
    }
    
    init(description: String, subject: String,equip_ID: String,equip_Type: String, units: String,servicetype:String,contractsID:String,username: String, docpath:String) {
        self.description = description
        self.subject = subject
        self.equipmentID = equip_ID
        self.equipmentType = equip_Type
        self.unit = units
        self.serviceType = servicetype
        self.ContractID = contractsID
        self.userName = username
        self.docPath = docpath
    }
    
    static func encode(object: CreateTicketJsonModel) -> Any {
        var user = [String: Any]()
        
        user["P_DESCR"] = object.description
        user["P_SUBJECT"] = object.subject
        user["P_EQPT_ID"] = object.equipmentID
        user["P_EQPT_TYPE"] = object.equipmentType
        user["P_UNIT"] = object.unit
        user["P_SERVICE_TYPE"] = object.serviceType
        user["P_DOC_PATH"] = object.docPath
        user["P_CONTRACT_ID"] = object.ContractID
        user["P_USERNAME"] = object.userName
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

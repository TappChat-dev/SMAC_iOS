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
    var equipmentID: String
    var equipmentType: String
    var equipment_SubType: String
    var username: String
    
    init() {
        description = ""
        subject = ""
        equipmentID = ""
        equipmentType = ""
        equipment_SubType = ""
        username = ""
    }
    
    init(description: String, subject: String,equip_ID: String,equip_Type: String, equip_SubType: String,username: String) {
        self.username = username
        self.description = description
        self.subject = subject
        self.equipmentID = equip_ID
        self.equipmentType = equip_Type
        self.equipment_SubType = equip_SubType
    }
    
    static func encode(object: CreateTicketJsonModel) -> Any {
        var user = [String: Any]()
        
        user["descr"] = object.description
        user["subject"] = object.subject
        user["eqpt_ID"] = object.equipmentID
        user["eqpt_TYPE"] = object.equipmentType
        user["eqpt_SUBTYPE"] = object.equipment_SubType
        user["user_NAME"] = object.username
        return user
    }
}

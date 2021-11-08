//
//  ViewEquipmentModel.swift
//  SMAC
//
//  Created by MAC on 05/11/21.
//

import Foundation

struct ViewEquipmentRequestModel {
    var E_TICKET_ID: String
    var E_UNIT_ID:String
    init() {
        E_TICKET_ID = ""
        E_UNIT_ID = ""
    }
    
    init(id:String,unitID:String) {
        self.E_TICKET_ID = id
        self.E_UNIT_ID = unitID
    }
    
    static func encode(object: ViewEquipmentRequestModel) -> Any {
        var user = [String: Any]()
        
        user["P_TICKET_ID"] = object.E_TICKET_ID
        user["P_UNIT_ID"] = object.E_UNIT_ID
        return user
    }
}

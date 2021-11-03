//
//  ViewTicketJsonModel.swift
//  SMAC
//
//  Created by MAC on 22/10/21.
//

import Foundation

struct ViewTicketJsonModel {
    var P_TICKET_ID: String
    var P_UNIT_ID:String
    init() {
        P_TICKET_ID = ""
        P_UNIT_ID = ""
    }
    
    init(id:String,unitID:String) {
        self.P_TICKET_ID = id
        self.P_UNIT_ID = unitID
    }
    
    static func encode(object: ViewTicketJsonModel) -> Any {
        var user = [String: Any]()
        
        user["P_TICKET_ID"] = object.P_TICKET_ID
        user["P_UNIT_ID"] = object.P_UNIT_ID
        return user
    }
}

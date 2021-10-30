//
//  ViewTicketJsonModel.swift
//  SMAC
//
//  Created by MAC on 22/10/21.
//

import Foundation

struct ViewTicketJsonModel {
    var ticket_ID: String
    
    init() {
    ticket_ID = ""
    }
    
    init(id:String) {
        self.ticket_ID = id
    }
    
    static func encode(object: ViewTicketJsonModel) -> Any {
        var user = [String: Any]()
        
        user["ticket_ID"] = object.ticket_ID
        return user
    }
}

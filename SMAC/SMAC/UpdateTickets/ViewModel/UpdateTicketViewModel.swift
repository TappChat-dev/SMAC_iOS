//
//  UpdateTicketViewModel.swift
//  SMAC
//
//  Created by MAC on 25/11/21.
//

import Foundation

struct UpdateTicketJsonModel {
    
    /*
     "P_USER_ID":"TE001",
       "P_R_ID":"SE",
       "P_NAC_STATUS":1,
       "P_TICKET_ID":"T0001",
       "P_ASSIGNED_BY":"036A",
       "P_TICKET_STATUS":"HD",
       "P_REMARK":"Remarks Test",
       "P_NAC_HANDOVER_DOC":"TEST-DOC",
       "P_NAC_RESPONSE_TIME":7,
       "P_SPARE_SUPPLY":1

     */
    
    var userID: String
    var rID: String
    var nacStatus: Int
    var ticketID: String
    var AssignBy: String
    var ticketStatus: String
    var remark: String
    var NACHandoverDOC: String
    var nacResponseTime:Int
    var spareSupply:String
    
    
    init() {
        userID = ""
        rID = ""
        nacStatus = 0
        ticketID = ""
        AssignBy = ""
        ticketStatus = ""
        remark = ""
        NACHandoverDOC = ""
        nacResponseTime = 0
        spareSupply = ""
       
        
        
    }
    
    init(user_ID: String, r_ID: String,nac_Status: Int,ticket_ID: String,assign_By:String,ticket_Status:String, remarks:String,nac_HandoverDOC: String,nac_ResponseTime:Int,spare_Supply:String) {
        self.userID = user_ID
        self.rID = r_ID
        self.nacStatus = nac_Status
        self.ticketID = ticket_ID
        self.AssignBy = assign_By
        self.ticketStatus = ticket_Status
        self.remark = remarks
        self.NACHandoverDOC = nac_HandoverDOC
        self.nacResponseTime = nac_ResponseTime
        self.spareSupply = spare_Supply
    }
    
    static func encode(object: UpdateTicketJsonModel) -> Any {
        var user = [String: Any]()
        
        user["P_USER_ID"] = object.userID
        user["P_R_ID"] = object.rID
        user["P_NAC_STATUS"] = object.nacStatus
        user["P_TICKET_ID"] = object.ticketID
        user["P_ASSIGNED_BY"] = object.AssignBy
        user["P_TICKET_STATUS"] = object.ticketStatus
        user["P_REMARK"] = object.remark
        user["P_NAC_HANDOVER_DOC"] = object.NACHandoverDOC
        user["P_NAC_RESPONSE_TIME"] = object.nacResponseTime
        user["P_SPARE_SUPPLY"] = object.spareSupply
        

        return user
    }
}

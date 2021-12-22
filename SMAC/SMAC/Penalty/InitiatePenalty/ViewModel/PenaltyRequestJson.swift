//
//  PenaltyRequestJson.swift
//  SMAC
//
//  Created by MAC on 20/12/21.
//

import Foundation
import UIKit

struct PenaltyRequestJson{
    
    /*
     "P_TICKET_ID":"",
       "P_SERVICE_TYPE":"",
       "P_SERVICE_SUB_TYPE":,
       "P_QUATERLY_UNIT_COST":"",
       "P_BASIC_UNIT_COST":"",
       "P_SPARE_COST":"",
       "P_TOTAL_DELAY":"",
       "P_MAXIMUM_LD":"",
       "P_LD_RATE":"",
       "P_PAYABLE_PENALTY":""
     "P_DAYS_IN_QUARTER":""
"P_UNIT_COST":""
     */
    var ticketID: String
    var serviceType: String
    var serviceSubType: String
    var quaterlyUnitCost: String
    var basicUnitCost: String
    var spareCost: String
    var totalDelay: String
    var maxLD: String
    var ldRate:String
    var payblePenalty:String
    var dayInQuarter:String
    var unitCost:String

    
    init() {
        ticketID = ""

        serviceType = ""
        serviceSubType = ""
        quaterlyUnitCost = ""
        basicUnitCost = ""
        spareCost = ""
        totalDelay = ""
        maxLD = ""
        ldRate = ""
        payblePenalty = ""
        dayInQuarter = ""
        unitCost = ""
       
        
        
    }
    
    init(ticket_ID: String,service_Type: String, service_SubType: String,quaterly_Unit_Cost: String,basic_UnitCost:String,spare_Cost:String, total_Delay:String,max_LD: String,ld_Rate:String,payble_Penalty:String,dayIn_Quarter:String,unit_Cost:String) {
        
        self.ticketID = ticket_ID
        self.serviceType = service_Type
        self.serviceSubType = service_SubType
        self.quaterlyUnitCost = quaterly_Unit_Cost
        self.basicUnitCost = basic_UnitCost
        self.spareCost = spare_Cost
        self.totalDelay = total_Delay
        self.maxLD = max_LD
        self.ldRate = ld_Rate
        self.payblePenalty = payble_Penalty
        self.dayInQuarter = dayIn_Quarter
        self.unitCost = unit_Cost
    }
    
    static func encode(object: PenaltyRequestJson) -> Any {
        var user = [String: Any]()
        
        user["P_TICKET_ID"] = object.ticketID
        user["P_SERVICE_TYPE"] = object.serviceType
        user["P_SERVICE_SUB_TYPE"] = object.serviceSubType
        user["P_QUATERLY_UNIT_COST"] = object.quaterlyUnitCost
        user["P_BASIC_UNIT_COST"] = object.basicUnitCost
        user["P_SPARE_COST"] = object.spareCost
        user["P_TOTAL_DELAY"] = object.totalDelay
        user["P_MAXIMUM_LD"] = object.maxLD
        user["P_LD_RATE"] = object.ldRate
        user["P_PAYABLE_PENALTY"] = object.payblePenalty
        user["P_DAYS_IN_QUARTER"] = object.dayInQuarter
        user["P_UNIT_COST"] = object.unitCost
        

        return user
    }
}

//
//  ViewEquipmentModel.swift
//  SMAC
//
//  Created by MAC on 05/11/21.
//

import Foundation

struct ViewEquipmentRequestModel {
    var P_Type: String
    var COM_Id:String
    init() {
        P_Type = ""
        COM_Id = ""
    }
    
    init(id:String,type:String) {
        self.P_Type = type
        self.COM_Id = id
    }
    
    static func encode(object: ViewEquipmentRequestModel) -> Any {
        var user = [String: Any]()
        
        user["P_Type"] = object.P_Type
        user["COM_Id"] = object.COM_Id
        return user
    }
}

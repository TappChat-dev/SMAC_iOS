//
//  DashboardCellViewModel.swift
//  SMAC
//
//  Created by MAC on 06/08/21.
//

import Foundation

struct DashboardCellViewModel {
    var count: String
    var name: String
    
}

struct DashboardJsonDictionary{
    var p_ID: String
    
    init() {
        p_ID = ""
        
    }
    init(id:String) {
        self.p_ID = id
    }
    static func encode(object: DashboardJsonDictionary) -> Any {
        var user = [String: Any]()
        
        user["P_Id"] = object.p_ID
        return user
    }
}

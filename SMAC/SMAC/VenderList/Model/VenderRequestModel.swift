//
//  VenderRequestModel.swift
//  SMAC
//
//  Created by MAC on 12/11/21.
//

import Foundation
struct ViewVendorRequestModel {
    var vendorID: String
    init() {
        vendorID = ""
    }
    
    init(id:String) {
        self.vendorID = id
    }
    
    static func encode(object: ViewVendorRequestModel) -> Any {
        var user = [String: Any]()
        
        user["vendorID"] = object.vendorID
        return user
    }
}

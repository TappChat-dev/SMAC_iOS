//
//  ViewEquipmentModel.swift
//  SMAC
//
//  Created by MAC on 03/11/21.
//

import Foundation

class ViewEquipmentModel:NSObject{
//https://icg.net.in/smacapi/Eqpt/view-eqptdetails
    private let apiManager = NetworkManager()
    let serviceURL = BaseUrl.baseURLWithIP + "Eqpt/view-eqptdetails"
    
    func API_getEquipmentList(json:[String:Any]){
//        apiManager.apiPost(serviceName: <#T##String#>, parameters: <#T##[String : Any]#>, completionHandler: <#T##(Data?, Error?) -> ()##(Data?, Error?) -> ()##(_ result: Data?, _ error: Error?) -> ()#>)
    }
}

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
//    let serviceURL = BaseUrl.baseURLWithIP + "Eqpt/view-eqptdetails"
    let serviceURL = BaseUrl.baseURL  + "getcomboData"
    func API_getEquipmentList(json:ViewEquipmentRequestModel, dataValue: @escaping (_ result: ViewEquipJsonModel?) -> ()){
        let jsons =  ViewEquipmentRequestModel.encode(object: json)
        print("json for Combo according to ID",jsons)
        apiManager.apiPost(serviceName: serviceURL, parameters: jsons as! [String : Any], completionHandler: {
            [weak self] (responseData,error)  in
            if let responseData = responseData {
                print(responseData)
                let details = try? newJSONDecoder().decode(ViewEquipJsonModel.self, from: responseData)
//                print(details?.result)
                dataValue(details)
            }
            
        })
    }
    
    func API_getUNIT(json:ViewEquipmentRequestModel, dataValue: @escaping (_ result: ViewUnitJsonModel?) -> ()){
        let jsons =  ViewEquipmentRequestModel.encode(object: json)
        print("json for Combo according to ID",jsons)
        apiManager.apiPost(serviceName: serviceURL, parameters: jsons as! [String : Any], completionHandler: {
            [weak self] (responseData,error)  in
            if let responseData = responseData {
                print(responseData)
                let details = try? newJSONDecoder().decode(ViewUnitJsonModel.self, from: responseData)
//                print(details?.result)
                dataValue(details)
            }
            
        })
    }
}

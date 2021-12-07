//
//  UpdateTicketsJsonModel.swift
//  SMAC
//
//  Created by MAC on 25/11/21.
//

import Foundation
import UIKit

//UpdateTicketsJsonModel
class UpdateTicketsJsonModel: NSObject {
    private let apiManager = NetworkManager()

    let serviceUrlCombo = BaseUrl.baseURL + "getcomboData"
    let serviceUrlUPDATE = BaseUrl.baseURL + "getcomboData"
    
    func API_getViewStatusWithCombo(json:RoleJsonDictionary, data:@escaping (_ result:UpdateTicketModel?,_ resultBool: Bool) -> ()){
        let jsons =  RoleJsonDictionary.encode(object: json)
        print("View ticket request",jsons)
        print("View ticket url",serviceUrlCombo)
        apiManager.apiPostViewTickets(serviceName: serviceUrlCombo, parameters: jsons as! [String : Any], completionHandler: {
            (response, error) in
            if let response = response {
                print(response)
                let details = try? newJSONDecoder().decode(UpdateTicketModel.self, from: response)
                print(details?.result as Any)
                data(details, true)
            }else{
//                data([], false)
            }
        })
    }
    
    func API_postUpdateTicketSE(json:UpdateTicketJsonModel,data: @escaping(_ result:Data?) -> ()){
        let jsons =  UpdateTicketJsonModel.encode(object: json)

        apiManager.apiPost(serviceName: serviceUrlUPDATE, parameters: jsons as! [String : Any], completionHandler: {result,error in
            print(result)
        })
    }
    
    func API_postUpdateTickets(json:UpdateTicketJsonModel,data: @escaping(_ result:Data?) -> ()){
        let jsons =  UpdateTicketJsonModel.encode(object: json)

        apiManager.apiPost(serviceName: serviceUrlUPDATE, parameters: jsons as! [String : Any], completionHandler: {result,error in
            print(result)
        })
    }
}

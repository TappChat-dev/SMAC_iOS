//
//  PenaltyViewModel.swift
//  SMAC
//
//  Created by MAC on 15/12/21.
//

import Foundation
import UIKit

class PenaltyViewModel:NSObject {
    private let apiManager = NetworkManager()
//    let serviceUrlCombo = BaseUrl.baseURL + "getcomboData"
    let serviceUrlCombo =  "https://icg.net.in/smacapi/getcomboData"
    func API_Get_PenaltyWithCombo(json:RoleJsonDictionary, data:@escaping (_ result:PenaltyResponse?,_ resultBool: Bool) -> ()){
        let jsons =  RoleJsonDictionary.encode(object: json)
        print("View ticket request",jsons)
        print("View ticket url",serviceUrlCombo)
        apiManager.apiPostViewTickets(serviceName: serviceUrlCombo, parameters: jsons as! [String : Any], completionHandler: {
            (response, error) in
            if let response = response {
                print(response)
                let details = try? newJSONDecoder().decode(PenaltyResponse.self, from: response)
                print(details?.result as Any)
//                self?.fetchData(model: details!)
                data(details, true)
            }else{
//                data([], false)
            }
        })
    }
    
    func API_Get_OtherPenaltyWithCombo(json:RoleJsonDictionary, data:@escaping (_ result:OtherData?,_ resultBool: Bool) -> ()){
        let jsons =  RoleJsonDictionary.encode(object: json)
        print("View ticket request",jsons)
        print("View ticket url",serviceUrlCombo)
        apiManager.apiPostViewTickets(serviceName: serviceUrlCombo, parameters: jsons as! [String : Any], completionHandler: {
            (response, error) in
            if let response = response {
                print(response)
                let details = try? newJSONDecoder().decode(OtherData.self, from: response)
                print(details?.result as Any)
//                self?.fetchData(model: details!)
                data(details, true)
            }else{
//                data([], false)
            }
        })
    }
}

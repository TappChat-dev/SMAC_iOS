//
//  AssignViewModel.swift
//  SMAC
//
//  Created by MAC on 22/12/21.
//

import UIKit

class AssignViewModel: NSObject {
    private let apiManager = NetworkManager()
    let serviceUrlCombo = BaseUrl.baseURL + "getcomboData"
    
    func API_getServiceEngineerWithComboContractID(json:RoleJsonDictionary, data:@escaping (_ result:Data?,_ resultBool: Bool) -> ()){
        let jsons =  RoleJsonDictionary.encode(object: json)
        print("View ticket request",jsons)
        print("View ticket url",serviceUrlCombo)
        apiManager.apiPostViewTickets(serviceName: serviceUrlCombo, parameters: jsons as! [String : Any], completionHandler: {
            (response, error) in
            if let response = response {
                print(response)
//                let details = try? newJSONDecoder().decode(RedefineAllContract.self, from: response)
//                print(details?.result as Any)
                data(response, true)
            }else{
                data(nil, true)
            }
        })
    }
}

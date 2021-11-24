//
//  ContractModel.swift
//  SMAC
//
//  Created by MAC on 10/11/21.
//

import Foundation
import UIKit

class ContractModel: NSObject{
    private let apiManager = NetworkManager()
    let serviceURL = BaseUrl.baseURL + "getContractDetails"
    let serviceUrlCombo = BaseUrl.baseURL + "getcomboData"

    func get_APIContract(json:jsonDictionaryForGetContract, data: @escaping (_ result: ContractResponseModel?) -> ()){
        
        let jsonData:Any = jsonDictionaryForGetContract.encode(object:json)
        print("getContractDetails Request",jsonData)
        apiManager.apiPostCreateType(serviceName: serviceURL, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(ContractResponseModel.self, from: response)
//                        print(details!)
                        data(details)
                    }else{
                        print("error",error)
//                        data([])
                    }
            
        })
    }
    
    func API_getViewAllTicketsWithComboContract(json:RoleJsonDictionary, data:@escaping (_ result:viewAllTickets?,_ resultBool: Bool) -> ()){
        let jsons =  RoleJsonDictionary.encode(object: json)
        print("View ticket request",jsons)
        print("View ticket url",serviceUrlCombo)
        apiManager.apiPostViewTickets(serviceName: serviceUrlCombo, parameters: jsons as! [String : Any], completionHandler: {
            (response, error) in
            if let response = response {
                print(response)
                let details = try? newJSONDecoder().decode(viewAllTickets.self, from: response)
                print(details?.result as Any)
//                self?.fetchData(model: details!)
                data(details, true)
            }else{
//                data([], false)
            }
        })
    }
}

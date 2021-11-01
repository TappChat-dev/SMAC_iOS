//
//  CreateTicketViewModel.swift
//  SMAC
//
//  Created by MAC on 14/10/21.
//

import Foundation
import UIKit

class CreateTicketViewModel: NSObject {
    private let apiManager = NetworkManager()
    let serviceUrl = BaseUrl.baseURLWithIP + "Combo/ConfigureData"
    let urlCreateTicket = BaseUrl.baseURLWithIP + "Ticket/Create-ticket"
    let urlGetContract = BaseUrl.baseURLWithIP + "Contract/GetContract"
//    var employeeLogin = Logins()
    
//    func getLoginResponse(user: LoginViewCredentialModel, data: @escaping (_ result : Logins , Bool) -> ()){
//
//    }
    
    func getEqpt_Type(json:jsonDictionary, data: @escaping (_ result: EquipmentType) -> ()){
        
        let jsonData:Any = jsonDictionary.encode(object:json)
        apiManager.apiPostCreateType(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(EquipmentType.self, from: response)
                        print(details!)
                        data(details ?? [] )
                    }else{
                        print(error)
                        data([])
                    }
            
        })
    }
    
    func getEqpt_SubType(json:jsonDictionary, data: @escaping (_ result: equipmentSubType) -> ()){
        
        let jsonData:Any = jsonDictionary.encode(object:json)
        apiManager.apiPostCreateType(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(equipmentSubType.self, from: response)
//                        print(details!)
                        data(details ?? [] )
                    }else{
                        print(error)
                        data([])
                    }
            
        })
    }
    
    func getEqpt_Projects(json:jsonDictionary, data: @escaping (_ result: equipmentProject) -> ()){
        
        let jsonData:Any = jsonDictionary.encode(object:json)
        apiManager.apiPostCreateType(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(equipmentProject.self, from: response)
                        print(details!)
                        data(details ?? [] )
                    }else{
                        print(error)
                        data([])
                    }
            
        })
    }
    
    func getEqpt_Smac_Role(json:jsonDictionary, data: @escaping (_ result: equipmentRole) -> ()){
        
        let jsonData:Any = jsonDictionary.encode(object:json)
        apiManager.apiPostCreateType(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(equipmentRole.self, from: response)
                        print(details!)
                        data(details ?? [] )
                    }else{
                        print(error)
                        data([])
                    }
            
        })
    }
    
    func getEqpt_Priority(json:jsonDictionary, data: @escaping (_ result: equipmentPriority) -> ()){
        
        let jsonData:Any = jsonDictionary.encode(object:json)
        apiManager.apiPostCreateType(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(equipmentPriority.self, from: response)
                        print(details!)
                        data(details ?? [] )
                    }else{
                        print(error)
                        data([])
                    }
            
        })
    }
    
    func getContract_API(json:jsonDictionaryForGetContract, data: @escaping (_ result: getContractJson) -> ()){
        
        let jsonData:Any = jsonDictionaryForGetContract.encode(object:json)
        apiManager.apiPostCreateType(serviceName: urlGetContract, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                           let details = try? newJSONDecoder().decode(getContractJson.self, from: response)
//                        print(details!)
                        data(details ?? [] )
                    }else{
                        print(error)
                        data([])
                    }
            
        })
    }
    
    
    func API_createTicket(json:CreateTicketJsonModel,data: @escaping (_ result: [String:Any]) -> ()){
        let jsonData:Any = CreateTicketJsonModel.encode(object:json)
        apiManager.apiPostCreateTicket(serviceName: urlCreateTicket, parameters: jsonData as! [String : Any], completionHandler: {
            
            [weak self] (response, error) in
                guard let weakSelf = self else { return }
                if let response = response {
                    print(response)
                  
                    data(response ?? [:] )
                }else{
                    print(error)
                    data([:])
                }
        
    })
    }
    
}

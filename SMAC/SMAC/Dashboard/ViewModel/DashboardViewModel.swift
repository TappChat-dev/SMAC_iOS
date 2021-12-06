//
//  DashboardViewModel.swift
//  SMAC
//
//  Created by MAC on 05/08/21.
//

import UIKit
import Alamofire

class DashboardViewModel: NSObject {

    private let apiManager = NetworkManager()

    let serviceUrl = BaseUrl.baseURL + "getDashbaord"
    
    
    func getDashboard_Count(json:DashboardJsonDictionary, data: @escaping (_ result: [String:Any]) -> ()){
        
        let jsonData:Any = DashboardJsonDictionary.encode(object:json)
        apiManager.apiPost(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            
                [weak self] (response, error) in
                    guard let weakSelf = self else { return }
            if let response = response {
                print(response)
                do{
                    let json = try JSONSerialization.jsonObject(with: response, options: []) as? [String : Any]
//                    let status = json?["STATUS"] as? String
//                    let msg = json?["msg"] as? String

                    data(json ?? [:])
                }catch{ print("erroMsg")
                    data([:])
                }
            }else{
                        print(error as Any)
                data([:])
                    }
            
        })
    }
}

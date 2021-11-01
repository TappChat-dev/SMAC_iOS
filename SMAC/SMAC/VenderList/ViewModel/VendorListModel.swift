//
//  VendorListModel.swift
//  SMAC
//
//  Created by MAC on 01/11/21.
//

import Foundation
import UIKit

class VendorListModel: NSObject{
    private let apiManager = NetworkManager()
    let serviceURL = BaseUrl.baseURL + "getVendorDeatils"
    
    
    func getVendorList(json:[String:Any], dataValue: @escaping (_ result: VendorListJsonModel) -> ()){
        
        NetworkManager.apiGet(serviceName: serviceURL, parameters: [:], completionHandler: {
            
            [weak self] (response, data,error)  in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
                        _ = response["Users"] as? Array<Any>
                        let message = response["Message"] as? String
                        let eError = response["Error"] as? Bool
                        print(message ?? [])
//                        print(user)
                        if eError == false{
                            if let datas = data {
                               let details = try? newJSONDecoder().decode(VendorListJsonModel.self, from: datas)
    //                            print(details)
    //                            print(details?.users)
                                print(usersList())
                                dataValue(details!)
                            }
                        }
                    }else{
                        print(error as Any)
//                        data([any])
                    }
            
        })
    }
}

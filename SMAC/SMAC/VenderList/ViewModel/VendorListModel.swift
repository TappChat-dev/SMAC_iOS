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
    
    
    func getVendorList(json:ViewVendorRequestModel, dataValue: @escaping (_ result: VendorListJsonModel?) -> ()){
        print("getVendorDeatils",serviceURL)
        let jsons =  ViewVendorRequestModel.encode(object: json)

        apiManager.apiPost(serviceName: serviceURL, parameters: jsons as! [String : Any], completionHandler: {
            
            [weak self] (response,error)  in
                    guard let weakSelf = self else { return }
                    if let response = response {
                        print(response)
//                        _ = response["Users"] as? Array<Any>
//                        let message = response["Message"] as? String
//                        let eError = response["Error"] as? Bool
//                        print(message ?? [])
//                        print(user)
//                        if error == false{
//                            if let datas = response {
                               let details = try? newJSONDecoder().decode(VendorListJsonModel.self, from: response)
    //                            print(details)
    //                            print(details?.users)
                                print("usersList apiGet",usersList())
                                dataValue(details)
//                            }
//                        }
                    }else{
                        print(error as Any)
                       
                    }
            
        })
    }
}

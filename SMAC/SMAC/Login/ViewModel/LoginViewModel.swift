//
//  LoginViewModel.swift
//  SMAC
//
//  Created by MAC on 03/08/21.
//

import UIKit

class LoginViewModel: NSObject {

    private let apiManager = NetworkManager()
    var employeeLogin = Logins()
    
    var reloadTableView: (() -> Void)?
    
    var employeeViewModels = [LoginViewCredentialModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func getLoginResponse(user: LoginViewCredentialModel, data: @escaping (_ result : Logins , Bool) -> ()){
        let serviceUrl = BaseUrl.baseURL + "login"
        let jsonData:Any = LoginViewCredentialModel.encode(object:user )
        print("Dic=",jsonData)
        var boolResponse :Bool = false
        apiManager.apiPostLogin(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            [weak self] (response, error) in
                guard let weakSelf = self else { return }
                if let response = response {
//                    print(response)
                    boolResponse = true
                       let loginDetails = try? newJSONDecoder().decode(Logins.self, from: response)
//                    print(loginDetails!)
                    data(loginDetails ?? [], true)
//                    return
                }else{
                    boolResponse = false
                    data([], false)
//                    return
                }
        })
//        if boolResponse {
//            return true
//        }else{
//        return false
//        }
    }
}


func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

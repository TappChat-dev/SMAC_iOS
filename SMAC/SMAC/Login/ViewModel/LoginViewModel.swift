//
//  LoginViewModel.swift
//  SMAC
//
//  Created by MAC on 03/08/21.
//

import UIKit

class LoginViewModel: NSObject {

    private let apiManager = NetworkManager()
//    var employeeLogin = Logins()
    
    var reloadTableView: (() -> Void)?
    
    var employeeViewModels = [LoginViewCredentialModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func getLoginResponse(user: LoginViewCredentialModel, data: @escaping (_ result : LoginElement , Bool) -> ()){
//        let serviceUrl = BaseUrl.baseURLWithIP + "login"
        let serviceUrl = BaseUrl.baseURL + "getAuth"

        let jsonData:Any = LoginViewCredentialModel.encode(object:user )
        print("Dic=",jsonData)
        apiManager.apiPostLogin(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            [weak self] (response, error) in
                guard let weakSelf = self else { return }
                if let response = response {
                    print(response)
                    let loginDetails = try? newJSONDecoder().decode(LoginElement.self, from: response)
//                    print(loginDetails!)
                    data(loginDetails!, true)
                }else{
//                    data("", false)
                }
        })
    }
    
    func getRoles(user:RoleJsonDictionary,data:@escaping(_ result: RoleResponsiblity) ->()){
        let serviceUrl = BaseUrl.baseURL + "getUserRoles"
        let jsonData:Any = RoleJsonDictionary.encode(object:user )
        apiManager.apiPost(serviceName: serviceUrl, parameters: jsonData as! [String : Any], completionHandler: {
            [weak self](response, error) in
            print(response)
            if let response = response {
            let roleDetails = try? newJSONDecoder().decode(RoleResponsiblity.self, from: response)
                print(roleDetails?.users.count)
                if roleDetails?.users.count ?? 0  > 0 {
                    data(roleDetails!)
                }
            }
        })
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

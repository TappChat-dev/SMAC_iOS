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
    
    func getLoginResponse(user: LoginViewCredentialModel) -> Bool{
//        let serviceUrl = BaseUrl.baseURL + kGroupProfileDelete + kSlash + kUserDelete + kSlash + subscriberId
        let jsonData:Any = LoginViewCredentialModel.encode(object:user )
        print("Dic=",jsonData)
        apiManager.apiPostLogin(serviceName: "", parameters: [:], completionHandler: {
            [weak self] (response, error) in
                guard let weakSelf = self else { return }
                if let response = response {
                    print(response)
                   
                }
        })
        return true
    }
}

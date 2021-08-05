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
    
    func getLoginResponse() -> Bool{
//        let serviceUrl = BaseUrl.baseURL + kGroupProfileDelete + kSlash + kUserDelete + kSlash + subscriberId
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

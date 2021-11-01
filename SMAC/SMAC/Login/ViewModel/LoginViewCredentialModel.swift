//
//  LoginViewModel.swift
//  SMAC
//
//  Created by MAC on 03/08/21.
//

import Foundation
import UIKit


struct LoginViewCredentialModel {

    var username: String
    var password: String
    var userType: String
    
    init() {
        username = ""
        password = ""
        userType = ""
    }
    
    init(username: String, password: String,type: String) {
        self.username = username
        self.password = password
        self.userType = type
    }
    
    static func encode(object: LoginViewCredentialModel) -> Any {
        var user = [String: Any]()
        
        user["userid"] = object.username
        user["password"] = object.password
        user["usertype"] = object.userType
        return user
    }
}

extension LoginViewCredentialModel {

    private mutating func setPassword(pass: String) -> String {
        password = pass
        return pass
    }

    private mutating func setUsername(username: String) -> String {
        self.username = username
        return username
    }

    private mutating func setUsertype(type: String) -> String {
        userType = type
        return type
    }

}


struct RoleJsonDictionary {
    var pid: String
    var userType: String
    
    init() {
        userType = ""
        pid = ""
        
    }
    init(id:String,type:String) {
        self.pid = id
        self.userType = type
    }
    static func encode(object: RoleJsonDictionary) -> Any {
        var user = [String: Any]()
        
        user["pid"] = object.pid
        user["userType"] = object.userType
        return user
    }
}

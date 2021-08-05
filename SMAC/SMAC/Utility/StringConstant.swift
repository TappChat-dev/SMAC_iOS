//
//  StringConstant.swift
//  TappChat
//
//  Created by intek on 12/08/20.
//  Copyright © 2020 intek. All rights reserved.
//

import Foundation
import UIKit


struct StringConstant {
    static let emptyUsername = "Please enter valid Username"
    static let emptyPassword = "Please enter valid Password"
    static let emptyPin = "Please enter Pin"
    static let fourDigitPin = "Please enter 4 digits Pin"
    static let search = "Search"
    static let emptyMessage = "Type Message"
}

struct Storyboard {
    static let main = "MainTappChat"
    static let home = "Home"
//    static let profile = "Profile"
//    static let chat = "Chat"
//    static let call = "Call"
}

struct ControllerIdentifier {
    static let loginVC = "LoginVC"
    static let logoutVC = "LogoutVC"
    static let homeVC = "HomeVC"
  
}

struct CellIdentifier {
    
    static let profileImageTableCell = "ProfileImageTableCell"
    static let profileTableCell = "ProfileTableCell"
    
}


struct ColorCode {
   static let greenColor = UIColor(red: 35.0/255.0, green: 175.0/255.0, blue: 58.0/255.0, alpha: 1)
    static let greenCircleColor = UIColor(rgb: 0x23AF3A, a: 1.0)
   static let skyBlueColor = UIColor(red: 44.0/255.0, green: 155.0/255.0, blue: 224.0/255.0, alpha: 1)
}

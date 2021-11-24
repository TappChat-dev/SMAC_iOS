//
//  VendorListJsonModel.swift
//  SMAC
//
//  Created by MAC on 01/11/21.
//

import Foundation

struct VendorListJsonModel: Codable {
    let error: Bool
    let message: String
    let users: [User]

    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case message = "Message"
        case users = "Users"
    }
}

// MARK: - User
struct User: Codable {
    let vendorID, name: String
    let contactNo, officialEmail, address1, address2: JSONNull?
    let city: String
    let state, pin: JSONNull?
    let isActive: Int
    let gstNo, panNo: JSONNull?
    let userID: UserID
    let createdDt, updatedDt: String

    enum CodingKeys: String, CodingKey {
        case vendorID = "VENDOR_ID"
        case name = "NAME"
        case contactNo = "CONTACT_NO"
        case officialEmail = "OFFICIAL_EMAIL"
        case address1 = "ADDRESS1"
        case address2 = "ADDRESS2"
        case city = "CITY"
        case state = "STATE"
        case pin = "PIN"
        case isActive = "IS_ACTIVE"
        case gstNo = "GST_NO"
        case panNo = "PAN_NO"
        case userID = "USER_ID"
        case createdDt = "CREATED_DT"
        case updatedDt = "UPDATED_DT"
    }
}

enum UserID: String, Codable {
    case the01E1 = "01E1"
}

typealias vendorList = VendorListJsonModel
typealias usersList = [User]

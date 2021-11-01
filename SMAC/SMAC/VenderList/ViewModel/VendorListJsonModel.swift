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
    let vendorID, name, contactNo, officialEmail: String
    let address1: String
    let address2: String?
    let city: String
    let state: String?
    let pin: Int?
    let isActive: Int
    let gstNo, panNo: String?
    let userID, createdDt, updatedDt: JSONNull?

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
typealias vendorList = VendorListJsonModel
typealias usersList = [User]

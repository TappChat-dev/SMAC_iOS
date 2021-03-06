//
//  Json.swift
//  SMAC
//
//  Created by MAC on 08/07/21.
//

import Foundation

enum Json {
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    static let decoder = JSONDecoder()
}

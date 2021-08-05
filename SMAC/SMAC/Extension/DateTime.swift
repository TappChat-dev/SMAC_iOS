//
//  DateTime.swift
//  TappChat
//
//  Created by intek on 21/08/20.
//  Copyright © 2020 intek. All rights reserved.
//

import Foundation

extension Date {
    var inDigits: UInt64 {
        return UInt64((self.timeIntervalSince1970))
    }
    
    var millisecondsSince1970:Int64 {
          return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
      }

      init(milliseconds:Int64) {
          self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
      }
}

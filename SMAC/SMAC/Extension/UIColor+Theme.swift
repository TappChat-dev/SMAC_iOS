//
//  UIColor+Theme.swift
//  SMAC
//
//  Created by MAC on 07/07/21.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: Private
    
    // MARK: Private
    fileprivate static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    fileprivate static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return rgba(r, g, b, 1.0)
    }
    
    // MARK: Public
    
    static let borderColor = rgb(254, 250, 236)
    static let backgroundColor = rgb(67, 73, 110)
    static let scoreColor = rgb(255, 193, 45)
    static let textColor = UIColor.white
    static let playerBackgroundColor = rgb(84, 77, 126)
    static let brightPlayerBackgroundColor = rgba(101, 88, 156, 0.5)
    
    class func themeColor() -> UIColor {
        return UIColor(red: 35/255, green: 175/255, blue: 58/255, alpha: 1)
    }
}

enum Constants {
    static let mainColor = UIColor(red: 0x71 / 0xFF, green: 0xBC / 0xFF, blue: 0xBD / 0xFF, alpha: 1)
}

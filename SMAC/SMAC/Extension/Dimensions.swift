//
//  Dimensions.swift
//  SMAC
//
//  Created by MAC on 07/07/21.
//

import Foundation
import UIKit

struct Dimensions {
    static let screenWidth: CGFloat
        = UIScreen.main.bounds.width
    static let screenHeight: CGFloat
        = UIScreen.main.bounds.height
    
    static let photosItemSize
        = CGSize(width: Dimensions.screenWidth * 0.45,
                 height: Dimensions.screenWidth * 0.45)
}

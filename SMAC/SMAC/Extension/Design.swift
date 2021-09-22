//
//  Design.swift
//  SMAC
//
//  Created by MAC on 20/07/21.
//

import UIKit
import  CoreGraphics

 @IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}


extension UIImage {

    func maskWithColor(color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }

        color.setFill()

        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)

        context.setBlendMode(.colorBurn)

        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.draw(cgImage, in: rect)

        context.setBlendMode(.sourceIn)
        context.addRect(rect)
        context.drawPath(using: .fill)

        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return coloredImage;
    }
    
}

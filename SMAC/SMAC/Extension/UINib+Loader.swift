//
//  UINib+Loader.swift
//  SMAC
//
//  Created by MAC on 07/07/21.
//

import Foundation
import UIKit

fileprivate extension UINib {
    
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}


// MARK: App Views

extension UINib {
    class func loadMoveEditorView(_ owner: AnyObject) -> UIView {
        return loadSingleView("MoveEditorView", owner: owner)
    }
}

//
//  SpareLD.swift
//  SMAC
//
//  Created by MAC on 14/12/21.
//

import Foundation
import UIKit


class SpareLD: UIView{
    @IBOutlet weak var spareCostTtxt:UITextField!
    @IBOutlet weak var totalDelayTxt:UITextField!
    @IBOutlet weak var ldRateTxt:UITextField!
    @IBOutlet weak var maximumLDTxt:UITextField!
    @IBOutlet weak var payablePaynltyTxt:UITextField!
    @IBOutlet weak var btnCalculate:UIButton!
    @IBOutlet weak var btnSave:UIButton!

    @IBOutlet weak var viewOtps:UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }

    func commonInit(){
        
    }
}

extension SpareLD:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        if textField.tag == 1001 {
//            let cost = 0.10 * Double(spareCostTtxt.text!)!
//            maximumLDTxt.text = String(cost)
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("spare textField ShouldBegin Editing")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("spare clear method called")
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("spare textField Should EndEditing")
        if textField.tag == 1001 {
            let cost = 0.10 * (self.spareCostTtxt.text?.toDouble())!
            maximumLDTxt.text = String(cost)
        }
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Wspare this method gets called")
       
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("spare return method called")
        textField.resignFirstResponder();
        return true;
    }
}


extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

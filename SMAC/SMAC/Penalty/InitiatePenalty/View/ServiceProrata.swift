//
//  ServiceProrata.swift
//  SMAC
//
//  Created by MAC on 14/12/21.
//

import Foundation
import UIKit

class ServiceProrata: UIView{
    @IBOutlet weak var qualityUnitTtxt:UITextField!
    @IBOutlet weak var dayQuarterTxt:UITextField!
    @IBOutlet weak var unitCostTxt:UITextField!
    @IBOutlet weak var totalDelayTxt:UITextField!
    @IBOutlet weak var payablePaynltyTxt:UITextField!

    @IBOutlet weak var viewOtps:UIView!
    @IBOutlet weak var btnVariefy:UIButton!
    @IBOutlet weak var btnApproved:UIButton!
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
    
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
}

extension ServiceProrata:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        if textField.tag == 1011 {

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
        if textField.tag == 1011 {
            let cost =  Int((self.qualityUnitTtxt.text?.toDouble())!) / Int((self.dayQuarterTxt.text?.toDouble())!)
            unitCostTxt.text = String(cost)
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
//
//  InitiatePenaltyVC.swift
//  SMAC
//
//  Created by MAC on 17/09/21.
//

import UIKit

class InitiatePenaltyVC: UIViewController {
    @IBOutlet weak var formView:UIView!
    @IBOutlet weak var ticketNoTxt:UITextField!
    @IBOutlet weak var statusTxt:UITextField!
    @IBOutlet weak var maxNACDayTxt:UITextField!
    @IBOutlet weak var reportDateTxt:UITextField!
    @IBOutlet weak var lastUpdateDTtxt:UITextField!
    @IBOutlet weak var nacDatetxt:UITextField!
    @IBOutlet weak var lastRemarkTxt:UITextView!
    @IBOutlet weak var contractorNameTxt:UITextField!
    @IBOutlet weak var contractorTypeTxt:UITextField!
    @IBOutlet weak var costTxt:UITextField!
    @IBOutlet weak var GSTtxt:UITextField!
    @IBOutlet weak var customDutyTxt:UITextField!
    @IBOutlet weak var totalCoastTxt:UITextField!
    @IBOutlet weak var EquipmetTxt:UITextField!
    @IBOutlet weak var serviceTypeTxt:UITextField!
    @IBOutlet weak var typeTxt:UITextField!
    
    @IBOutlet weak var ViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var btnDate:UIButton!
    @IBOutlet weak var btnSave:UIButton!
    @IBOutlet weak var btnReset:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewHeightConstraint.constant = 0
        let service = ["Select", "Service","Spare"]
        let type = ["Select", "LD","Prorata"]
        let dropDownBtn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn1.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        ticketNoTxt.rightViewMode = UITextField.ViewMode.always
        ticketNoTxt.rightView = dropDownBtn1
        
        let dropDownBtn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn2.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        typeTxt.rightViewMode = UITextField.ViewMode.always
        typeTxt.rightView = dropDownBtn2
        
        let dropDownBtn5 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn5.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        serviceTypeTxt.rightViewMode = UITextField.ViewMode.always
        serviceTypeTxt.rightView = dropDownBtn5
        serviceTypeTxt.loadDropdownData(data: service)
        typeTxt.loadDropdownData(data: type)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    
    // MARK: - Save data

    @IBAction func tapToSave(_ sender:Any){
        
    }
   
    @IBAction func tapToReset(_ sender: Any){
//        contractorNametxt.text = ""
//        organizationNametxt.text = ""
//        productNametxt.text = ""
//        ticketIDtxt.text = ""
//        penaltyAmounttxt.text = ""
    }

    func SelectServiceType(type:String){
        
    }
    
}

extension InitiatePenaltyVC:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
        if (textField.tag == 112){
            
            SelectServiceType(type: textField.text!)
        }
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    
    
}

//
//  CreateContractViewController.swift
//  SMAC
//
//  Created by MAC on 19/08/21.
//

import UIKit

class CreateContractViewController: UIViewController {
    @IBOutlet weak var btnUploadDoc:UIButton!
    @IBOutlet weak var btnDatePicker:UIButton!
    @IBOutlet weak var btnReset:UIButton!
    @IBOutlet weak var btnUpdate:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    @IBOutlet weak var formView:UIView!
    @IBOutlet weak var venderNametxt:UITextField!
    @IBOutlet weak var projectNameTxt:UITextField!
    @IBOutlet weak var contractIDTxt:UITextField!
    @IBOutlet weak var contractNameTxt:UITextField!
    @IBOutlet weak var contractorNameTxt:UITextField!
    @IBOutlet weak var serviceTypeTxt:UITextField!
    @IBOutlet weak var uploadSLATxt:UITextField!
    @IBOutlet weak var uploadDocumentTxt:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addArrowBtnToTextField()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    // MARK: - Navigation

    fileprivate func addArrowBtnToTextField() {
        
        let dropDownBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
          dropDownBtn.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal) //  downArrow_black arrowtriangle.down.fill, IQButtonBarArrowDown
          serviceTypeTxt.rightViewMode = UITextField.ViewMode.always
          serviceTypeTxt.rightView = dropDownBtn
          let dropDownBtn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
          dropDownBtn1.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        projectNameTxt.rightViewMode = UITextField.ViewMode.always
        projectNameTxt.rightView = dropDownBtn1
          let dropDownBtn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
          dropDownBtn2.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        venderNametxt.rightViewMode = UITextField.ViewMode.always
        venderNametxt.rightView = dropDownBtn2
          let dropDownBtn3 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
          dropDownBtn3.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        contractNameTxt.rightViewMode = UITextField.ViewMode.always
        contractNameTxt.rightView = dropDownBtn3
          let dropDownBtn4 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
          dropDownBtn4.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        contractIDTxt.rightViewMode = UITextField.ViewMode.always
        contractIDTxt.rightView = dropDownBtn4
          let dropDownBtn5 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
          dropDownBtn5.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        contractorNameTxt.rightViewMode = UITextField.ViewMode.always
        contractorNameTxt.rightView = dropDownBtn5

    }
}

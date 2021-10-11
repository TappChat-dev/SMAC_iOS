//
//  TicketCreateViewController.swift
//  SMAC
//
//  Created by MAC on 07/10/21.
//

import UIKit
import Foundation
import MaterialComponents
import MaterialComponents.MaterialTextFields
import MaterialComponents.MDCTextInputControllerOutlinedTextArea
import MaterialComponents.MDCTextInputControllerFilled
//import MaterialComponents.MaterialTextFields_Theming

//import MaterialComponents.MDCMultilineTextField
//import MaterialComponents.MaterialTextFields
//import MaterialComponents.MaterialTextControls_FilledTextAreas
//import MaterialComponents.MaterialTextControls_FilledTextFields
//import MaterialComponents.MaterialTextControls_OutlinedTextAreas
//import MaterialComponents.MaterialTextControls_OutlinedTextFields

class TicketCreateViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleTxt: MDCTextField!
    @IBOutlet weak var contractNameTxt: MDCTextField!
    @IBOutlet weak var serviceTypeTxt: MDCTextField!
    @IBOutlet weak var unitTxt: MDCTextField!
    @IBOutlet weak var equipmentNameTxt: MDCTextField!
    @IBOutlet weak var equipmentTypeTxt: MDCTextField!
    @IBOutlet weak var dateTxt: MDCTextField!
    @IBOutlet weak var uploadSLATxt: MDCTextField!
    @IBOutlet weak var descriptionTxtView: MDCTextField!
    @IBOutlet weak var descriptionView: UIView!
    
    var titleController: MDCTextInputControllerOutlined?
    var contractNameController: MDCTextInputControllerOutlined?
    var serviceTypeController: MDCTextInputControllerOutlined?
    var unitController: MDCTextInputControllerOutlined?
    var equipmentNameController: MDCTextInputControllerOutlined?
    var equipmentTypeController: MDCTextInputControllerOutlined?
    var dateController: MDCTextInputControllerOutlined?
    var uploadSLAController: MDCTextInputControllerOutlined?
    var descriptionController: MDCTextInputControllerOutlined?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        titleController = MDCTextInputControllerOutlined(textInput: titleTxt)
        contractNameController = MDCTextInputControllerOutlined(textInput: contractNameTxt)
        serviceTypeController = MDCTextInputControllerOutlined(textInput: serviceTypeTxt)
        unitController = MDCTextInputControllerOutlined(textInput: unitTxt)
        equipmentNameController = MDCTextInputControllerOutlined(textInput: equipmentNameTxt)
        equipmentTypeController = MDCTextInputControllerOutlined(textInput: equipmentTypeTxt)
        dateController = MDCTextInputControllerOutlined(textInput: dateTxt)
        uploadSLAController = MDCTextInputControllerOutlined(textInput: uploadSLATxt)
//        descriptionController = MDCTextInputControllerOutlined(textInput: descriptionTxtView)
        viewDesc()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    
    
    //MARK:- Description
    /*
   func descriptionView() {
    let estimatedFrame = CGRect(x: 5, y: 5, width: 330, height: 110)
//    let textArea = MDCFilledTextArea(frame: estimatedFrame)
//    textArea.label.text = "Label"
//    textArea.textView.text = "This is a filled text area with enough text to span two lines."
//    textArea.leadingAssistiveLabel.text = "This is helper text"
//    textArea.sizeToFit()
//    descriptionView.addSubview(textArea)
    
    let textFieldDefaultCharMax = MDCMultilineTextField()
    descriptionView.addSubview(textFieldDefaultCharMax)

    textFieldDefaultCharMax.placeholder = "Enter up to 50 characters"
    textFieldDefaultCharMax.textView?.delegate = self
    textFieldDefaultCharMax.textView?.text = "This is a filled text area with enough text to span two lines."
    // Second the controller is created to manage the text field
//    descriptionController = MDCTextInputControllerUnderline(textInput: descriptionTxtView) // Hold on as a property
    descriptionController?.characterCountMax = 50
    descriptionController?.isFloatingEnabled = false
    }
    */
    // MARK: - Navigation

    func viewDesc()  {
        print("check")
        let estimatedFrame = CGRect(x: 5, y: 5, width: 330, height: 110)
        
        let textFieldDefaultCharMax = MDCMultilineTextField()
        textFieldDefaultCharMax.frame = estimatedFrame
        descriptionView.addSubview(textFieldDefaultCharMax)

        textFieldDefaultCharMax.placeholder = "Enter up to 50 characters"
        textFieldDefaultCharMax.textView?.delegate = self
//        textFieldDefaultCharMax.textView?.text = "This is a filled text area with enough text to span two lines."
        // Second the controller is created to manage the text field
    //    descriptionController = MDCTextInputControllerUnderline(textInput: descriptionTxtView) // Hold on as a property
//        descriptionController = MDCTextInputControllerOutlined(textInput: textFieldDefaultCharMax) // Hold on as a property

        descriptionController?.characterCountMax = 50
        descriptionController?.isFloatingEnabled = false
    }

    func multilineTextFieldShouldClear(_ textField: (UIView & MDCTextInput)!) -> Bool {
        return true
    }
}

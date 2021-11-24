//
//  TicketCreateViewController.swift
//  SMAC
//
//  Created by MAC on 07/10/21.
//

import UIKit
import Foundation
import MobileCoreServices
import UniformTypeIdentifiers
import IQKeyboardManagerSwift
//import MaterialComponents
//import MaterialComponents.MaterialTextFields
//import MaterialComponents.MDCTextInputControllerOutlinedTextArea
//import MaterialComponents.MDCTextInputControllerFilled
//import MaterialComponents.MaterialTextFields_Theming

//import MaterialComponents.MDCMultilineTextField
//import MaterialComponents.MaterialTextFields
//import MaterialComponents.MaterialTextControls_FilledTextAreas
//import MaterialComponents.MaterialTextControls_FilledTextFields
//import MaterialComponents.MaterialTextControls_OutlinedTextAreas
//import MaterialComponents.MaterialTextControls_OutlinedTextFields

/*
class TicketCreateViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {

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
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var titleController: MDCTextInputControllerOutlined?
    var contractNameController: MDCTextInputControllerOutlined?
    var serviceTypeController: MDCTextInputControllerOutlined?
    var unitController: MDCTextInputControllerOutlined?
    var equipmentNameController: MDCTextInputControllerOutlined?
    var equipmentTypeController: MDCTextInputControllerOutlined?
    var dateController: MDCTextInputControllerOutlined?
    var uploadSLAController: MDCTextInputControllerOutlined?
    var descriptionController: MDCTextInputControllerOutlined?
    let textFieldDefaultCharMax = MDCMultilineTextField()

    
    var datePicker = UIDatePicker()
    var toolbar = UIToolbar()
    let imagePicker = UIImagePickerController()
    let pickerView = UIPickerView()
    
    var selectedDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        descriptionTextView.delegate = self
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
//        viewDesc()
        addArrowBtnToTextFields()
        descriptionTextView.placeholder = "Description"
        let salutations = ["Select", "Chandan", "Deewan", "Ashish"]
        titleTxt?.loadDropdownData(data: salutations)
        
        let Data = ["Select", "Data1.", "Data1.", "Data1."]
        equipmentTypeTxt?.loadDropdownData(data: Data)
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    
    
    fileprivate func addArrowBtnToTextFields() {
        
        let dropDownBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal) //  downArrow_black arrowtriangle.down.fill, IQButtonBarArrowDown
        serviceTypeTxt.rightViewMode = UITextField.ViewMode.always
        serviceTypeTxt.rightView = dropDownBtn
        let dropDownBtn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn1.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        contractNameTxt.rightViewMode = UITextField.ViewMode.always
        contractNameTxt.rightView = dropDownBtn1
        let dropDownBtn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn2.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        unitTxt.rightViewMode = UITextField.ViewMode.always
        unitTxt.rightView = dropDownBtn2
        let dropDownBtn3 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn3.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        titleTxt.rightViewMode = UITextField.ViewMode.always
        titleTxt.rightView = dropDownBtn3
        let dropDownBtn4 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn4.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        equipmentNameTxt.rightViewMode = UITextField.ViewMode.always
        equipmentNameTxt.rightView = dropDownBtn4
        let dropDownBtn5 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn5.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        equipmentTypeTxt.rightViewMode = UITextField.ViewMode.always
        equipmentTypeTxt.rightView = dropDownBtn5
        
    }
    
    
    // MARK: - Date Picker
    @IBAction func tapToDatePickers(_ sender:Any){
        datePicker = UIDatePicker.init()
        datePicker.backgroundColor = UIColor.white
        
        datePicker.autoresizingMask = .flexibleWidth
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle  = .wheels
            datePicker.backgroundColor = .white
        } else {
        }
        
        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(datePicker)
        
        toolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolbar.barStyle = .blackTranslucent
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        toolbar.sizeToFit()
        self.view.addSubview(toolbar)
    }
    
    
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        selectedDate = dateFormatter.string(from: datePicker.date)
        if let date = sender?.date {
            print("Picked the date \(dateFormatter.string(from: date))")
            selectedDate = dateFormatter.string(from: date)
        }
    }
    
    @objc func onDoneButtonClick() {
        if selectedDate == "" {
            self.dateTxt.text = Date.getCurrentDate()
        }else{
            self.dateTxt.text = selectedDate
        }
        toolbar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    
    // MARK: - Action Sheet Picker
    func actionSheetOption(){
        let actionSheet = UIAlertController(title: "Choose Option", message: nil, preferredStyle: .actionSheet)
        let actionSelectCamera = UIAlertAction(title: "Camera", style: .default, handler: {
            UIAlertAction in
            self.openCamera()
        })
        let actionSelectGallery = UIAlertAction(title: "Gallery", style: .default, handler: {
            UIAlertAction in
            self.openGallary()
        })
        let actionSelectDocument = UIAlertAction(title: "Document", style: .default, handler: {
            UIAlertAction in
            self.clickDocumentFunction()
        })
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(actionCancel)
        actionSheet.addAction(actionSelectCamera)
        actionSheet.addAction(actionSelectGallery)
        actionSheet.addAction(actionSelectDocument)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: - UploadDoc
    @IBAction func tapToUploadDoc_Image(_ sender:Any){
        self.actionSheetOption()
    }
    
    // MARK: - Camera
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            Utility().addAlertView("Warning!", "You don't have camera", "OK", self)
        }
    }
    
    // MARK: - Gallary
    func openGallary(){
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .overFullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - Document
    func clickDocumentFunction(){
       
        let types: [String] = [
            kUTTypeJPEG as String,
            kUTTypePNG as String,
            "com.microsoft.word.doc",
            "org.openxmlformats.wordprocessingml.document",
            kUTTypeRTF as String,
            "com.microsoft.powerpoint.​ppt",
            "org.openxmlformats.presentationml.presentation",
            kUTTypePlainText as String,
            "com.microsoft.excel.xls",
            "org.openxmlformats.spreadsheetml.sheet",
            "com.apple.iwork.pages.pages",
            "com.apple.iwork.numbers.numbers",
            "com.apple.iwork.keynote.key",
            "public.image",
            "public.text",
            "public.zip-archive",
            "com.pkware.zip-archive",
            "public.data",
            kUTTypePDF as String,
            kUTTypeMP3 as String,
            kUTTypeSpreadsheet as String,
            kUTTypePresentation as String,
            kUTTypeDatabase as String,
            String(kUTTypeContent)
        ]
        //        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [kUTTypeItem,], asCopy: true)
        let documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
        
        documentPicker.allowsMultipleSelection = false
        if #available(iOS 13.0, *) {
            documentPicker.shouldShowFileExtensions = true
        } else {
            // Fallback on earlier versions
        }
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .fullScreen
        present(documentPicker, animated: true, completion: nil)
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
        
        if (textFieldDefaultCharMax.textView?.text.count)! <= 50 {
            return true
        }
        return false
    }
    
    // MARK: UITextFieldDelegate methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       let text = textField.text
        let range = Range(range, in: text!)
//    if (textFieldDefaultCharMax.textView?.text.count)! <= 50 {
//                return true
//            }
        if (descriptionTextView?.text.count)! <= 50 {
                    return true
        }

//      let finishedString = text.replacingCharacters(in: range, with: string)
        let finishedString = text?.replacingCharacters(in: range!, with: string)
        if finishedString?.rangeOfCharacter(from: CharacterSet.letters) != nil {
            descriptionController?.setErrorText("Error: maxmimum  word is 50 charcter.", errorAccessibilityValue: nil)
      } else {
        descriptionController?.setErrorText(nil, errorAccessibilityValue: nil)
      }

      return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();

        // TextField
        if (textField == textFieldDefaultCharMax) {
          let textFieldCharacterCount = textField.text?.count ?? 0
          if (textFieldCharacterCount < 8) {
            descriptionController?.setErrorText("Password is too short",
                                                     errorAccessibilityValue: nil)
          } else {
            descriptionController?.setErrorText(nil, errorAccessibilityValue: nil)
          }
        }

        return false
      }
    
    let maxLength = 20
       
       func textViewDidChange(_ textView: UITextView) {
           descriptionTextView.text = "\(maxLength - textView.text.count)"
       }
       
       func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           return textView.text.count + (text.count - range.length) <= maxLength
       }
}


extension TicketCreateViewController:UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if (info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage) != nil {
            //            imageRetrieved.contentMode = .ScaleAspectFill
            //            imageRetrieved.image = pickedImage
        }
        var selectedImage: UIImage!
        if let image = info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage {
            selectedImage = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
            selectedImage = image
        }
        //           self.profileImageView.image = selectedImage
        
        if (picker.sourceType == UIImagePickerController.SourceType.camera) {
            
            let imgName = UUID().uuidString
            let documentDirectory = NSTemporaryDirectory()
            let localPath = documentDirectory.appending(imgName)
            
            let data = selectedImage.jpegData(compressionQuality: 0.3)! as NSData
            data.write(toFile: localPath, atomically: true)
            let photoURL = URL.init(fileURLWithPath: localPath)
            print("Camera Url",photoURL)
            
        }
        if let imgUrl = info[UIImagePickerController.InfoKey.imageURL.rawValue] as? URL{
            let imgName = imgUrl.lastPathComponent
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            let localPath = documentDirectory?.appending(imgName)
            
            let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
            let data = image.pngData()! as NSData
            data.write(toFile: localPath!, atomically: true)
            //let imageData = NSData(contentsOfFile: localPath!)!
            let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
            print("Gallery Url",photoURL)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension TicketCreateViewController:UIDocumentPickerDelegate{
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
}

*/

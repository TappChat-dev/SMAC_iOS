//
//  TicketUpdateViewController.swift
//  SMAC
//
//  Created by MAC on 12/10/21.
//

import UIKit
import IQKeyboardManagerSwift
import MobileCoreServices
import UniformTypeIdentifiers
import Foundation
//import MaterialComponents
//import MaterialComponents.MaterialTextFields
//import MaterialComponents.MDCTextInputControllerOutlinedTextArea
//import MaterialComponents.MDCTextInputControllerFilled
/*
class TicketUpdateViewController: UIViewController,UITextViewDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var serviceRequesterTxt: MDCTextField!
    @IBOutlet weak var titleTxt: MDCTextField!
    @IBOutlet weak var contractNameTxt: MDCTextField!
    @IBOutlet weak var serviceTypeTxt: MDCTextField!
    @IBOutlet weak var unitTxt: MDCTextField!
    @IBOutlet weak var equipmentNameTxt: MDCTextField!
    @IBOutlet weak var equipmentTypeTxt: MDCTextField!
    @IBOutlet weak var dateTxt: MDCTextField!
    @IBOutlet weak var uploadSLATxt: MDCTextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var descriptionView: UIView!
    
    var serviceRequesterController: MDCTextInputControllerOutlined?
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

    var selectedDate = ""
    var datePicker = UIDatePicker()
    var toolbar = UIToolbar()
    let imagePicker = UIImagePickerController()
    let pickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.delegate = self
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        serviceRequesterController = MDCTextInputControllerOutlined(textInput: serviceRequesterTxt)

        titleController = MDCTextInputControllerOutlined(textInput: titleTxt)
        contractNameController = MDCTextInputControllerOutlined(textInput: contractNameTxt)
        serviceTypeController = MDCTextInputControllerOutlined(textInput: serviceTypeTxt)
        unitController = MDCTextInputControllerOutlined(textInput: unitTxt)
        equipmentNameController = MDCTextInputControllerOutlined(textInput: equipmentNameTxt)
        equipmentTypeController = MDCTextInputControllerOutlined(textInput: equipmentTypeTxt)
        dateController = MDCTextInputControllerOutlined(textInput: dateTxt)
        uploadSLAController = MDCTextInputControllerOutlined(textInput: uploadSLATxt)
        // Do any additional setup after loading the view.
        descriptionTextView.placeholder = "Description"
        addArrowBtnToTextField()
        let salutations = ["Select", "Chandan", "Deewan", "Ashish"]
        titleTxt?.loadDropdownData(data: salutations)
        
        let Data = ["Select", "Data1", "Data2", "Data3"]
        equipmentTypeTxt?.loadDropdownData(data: Data)
    }
    
    
    fileprivate func addArrowBtnToTextField() {
        
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let maxLength = 20
       
       func textViewDidChange(_ textView: UITextView) {
           descriptionTextView.text = "\(maxLength - textView.text.count)"
       }
       
       func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
           return textView.text.count + (text.count - range.length) <= maxLength
       }
    
    // MARK: - Navigation
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
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
}

extension TicketUpdateViewController:UIImagePickerControllerDelegate{
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

extension TicketUpdateViewController:UIDocumentPickerDelegate{
    
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

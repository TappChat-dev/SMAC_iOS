//
//  CreateTicketViewController.swift
//  SMAC
//
//  Created by MAC on 10/08/21.
//

import UIKit
import IQKeyboardManagerSwift
import MobileCoreServices
import UniformTypeIdentifiers


class CreateTicketsViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var contractNameTxt: UITextField!
    @IBOutlet weak var serviceTypeTxt: UITextField!
    @IBOutlet weak var unitTxt: UITextField!
    @IBOutlet weak var equipmentNameTxt: UITextField!
    @IBOutlet weak var equipmentTypeTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var uploadSLATxt: UITextField!
    @IBOutlet weak var descriptionTxtView: UITextView!
    
    @IBOutlet weak var btnUploadDoc:UIButton!
    @IBOutlet weak var btnDatePicker:UIButton!
    @IBOutlet weak var btnReset:UIButton!
    @IBOutlet weak var btnSave:UIButton!
    @IBOutlet weak var formView:UIView!
    
    var datePicker = UIDatePicker()
    var toolbar = UIToolbar()
    let imagePicker = UIImagePickerController()
    let pickerView = UIPickerView()
    
    var selectedDate = ""
    
    lazy var viewModelType = {
        CreateTicketViewModel()
    }()
    var arrEquipType = [String]()
    var arrEquip_SubType = [String]()
    var arrEquip_ProjectName = [String]()
    var arrEquip_ProjectID = [String]()
    var arrEquip_RoleID = [String]()
    var arrEquip_PriorityID = [String]()
    var arrEquip_PriorityDecr = [String]()
    var arrEquip_ContractorID = [String]()
    var arrEquip_ContractorName = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addArrowBtnToTextFields()
        getContract()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
               //call any function
            self.apiCalling()
        }
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)

//        let salutations = ["Select", "Mr.", "Ms.", "Mrs."]
        let service = ["Select", "Remote", "Telephone", "Onsite"]
//        titleTxt?.loadDropdownData(data: salutations)
        serviceTypeTxt.loadDropdownData(data: service)
        equipmentTypeTxt.loadDropdownData(data: arrEquipType)
        equipmentNameTxt.loadDropdownData(data: arrEquip_SubType)
        self.contractNameTxt.loadDropdownData(data: self.arrEquip_ContractorName)

        print(titleTxt)
        let unit = UserDefaults.standard.string(forKey: "unit")
//        if unit!.count > 0 {
//            self.unitTxt.text = unit
//        }else{
//            self.unitTxt.text = ""
//        }
        
        //        titleTxt = nil
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
//        unitTxt.rightViewMode = UITextField.ViewMode.always
//        unitTxt.rightView = dropDownBtn2
        let dropDownBtn3 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn3.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
//        titleTxt.rightViewMode = UITextField.ViewMode.always
//        titleTxt.rightView = dropDownBtn3
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
        //        let supportedTypes = [UTType.image, UTType.text, UTType.plainText, UTType.utf8PlainText,    UTType.utf16ExternalPlainText, UTType.utf16PlainText,    UTType.delimitedText, UTType.commaSeparatedText,    UTType.tabSeparatedText, UTType.utf8TabSeparatedText, UTType.rtf,    UTType.pdf, UTType.webArchive, UTType.image, UTType.jpeg,    UTType.tiff, UTType.gif, UTType.png, UTType.bmp, UTType.ico,    UTType.rawImage, UTType.svg, UTType.livePhoto, UTType.movie,    UTType.video, UTType.audio, UTType.quickTimeMovie, UTType.mpeg,    UTType.mpeg2Video, UTType.mpeg2TransportStream, UTType.mp3,    UTType.mpeg4Movie, UTType.mpeg4Audio, UTType.avi, UTType.aiff,    UTType.wav, UTType.midi, UTType.archive, UTType.gzip, UTType.bz2,    UTType.zip, UTType.appleArchive, UTType.spreadsheet, UTType.epub]
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
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    
    @IBAction func tapToSubmit(_ sender:Any){
        Loader.showLoader("Creating Ticket...", target: self)
        viewModelType.API_createTicket(json: CreateTicketJsonModel.init(description: descriptionTxtView.text, subject: "Ticket APi Demo", equip_ID: "001", equip_Type: self.equipmentTypeTxt.text!, equip_SubType: "0005", username: "vipin.gangwar"), data: {
            response  in
            Loader.hideLoader(self)
                print("Response APi")
            print(response)
            
        })
    }
    @IBAction func tapToReset(_ sender:Any){
        
    }
    
    //MARK:- API Call
    func getContract(){
        viewModelType.getContract_API(json: jsonDictionaryForGetContract.init(id: ""), data: {
            response in
            print("6th APi")
            DispatchQueue.main.async {
                var firstitem: Bool = false
                if  response.count > 0{
                    //                Loader.hideLoader(self)
                    for id in response {
                        if firstitem == false {
                            firstitem = true
                            self.arrEquip_ContractorID.append("Select")
                            self.arrEquip_ContractorName.append("Select")
                            self.arrEquip_ContractorID.append(id.contractID )
                            self.arrEquip_ContractorName.append(id.contractName)
                        }else{
                            self.arrEquip_ContractorID.append(id.contractID )
                            self.arrEquip_ContractorName.append(id.contractName)
                        }
                    }
                    self.contractNameTxt.loadDropdownData(data: self.arrEquip_ContractorName)
                }else{
                    //                Loader.hideLoader(self)
                    Utility().addAlertView("Alert!", "Something is wrong", "OK", self)
                }
            }
        })
    }
    
    func apiCalling(){
        let dispatchGroup = DispatchGroup()
        Loader.showLoader("Downloading Details...", target: self)
        dispatchGroup.enter()
        viewModelType.getEqpt_Type(json: jsonDictionary.init(id: "", type: "EQPT_TYPE"), data: {
            response  in
//            print(response)
            print("1st APi")
            DispatchQueue.main.async { [self] in
            if  response.count > 0{
                var firstitem: Bool = false
                for id in response {
                    if firstitem == false {
                        firstitem = true
                        arrEquipType.append("Select")
                        arrEquipType.append(id.eqptType)
                    }else{
                    arrEquipType.append(id.eqptType)
                    }
                }
                equipmentTypeTxt.loadDropdownData(data: arrEquipType)
//                Loader.hideLoader(self)
                
            }else{
//                Loader.hideLoader(self)
//                Utility().addAlertView("Alert!", "Please Check Your Selected Option!", "OK", self)
            }
                dispatchGroup.leave()
            }
        })
        //2nd APi
        dispatchGroup.enter()
        viewModelType.getEqpt_SubType(json: jsonDictionary.init(id: "", type: "EQPT_SUBTYPE"), data: {
            response  in
//            print(response)
            print("2nd APi")
            DispatchQueue.main.async { [self] in
            if  response.count > 0{
                var firstitem: Bool = false
                for id in response {
                    if firstitem == false {
                        firstitem = true
                        arrEquip_SubType.append("Select")
                        arrEquip_SubType.append(id.name)
                    }else{
                    arrEquip_SubType.append(id.name)
                    }
                }
                equipmentNameTxt.loadDropdownData(data: arrEquip_SubType)

//                Loader.hideLoader(self)
                
            }else{
//                Loader.hideLoader(self)
//                Utility().addAlertView("Alert!", "Something is wrong", "OK", self)
            }
                dispatchGroup.leave()
            }
        })
        //3rd APi
        dispatchGroup.enter()
        viewModelType.getEqpt_Projects(json: jsonDictionary.init(id: "", type: "PROJECTS"), data: {
            response  in
//            print(response)
            print("3rd APi")
            DispatchQueue.main.async {
            if  response.count > 0{
                var firstitem: Bool = false

                for id in response {
                    if firstitem == false {
                        firstitem = true
                        self.arrEquip_ProjectName.append("Select")
                        self.arrEquip_ProjectID.append("Select")
                        self.arrEquip_ProjectName.append(id.name)
                        self.arrEquip_ProjectID.append(id.project)
                    }else{
                    self.arrEquip_ProjectID.append(id.project)
                    self.arrEquip_ProjectName.append(id.name)
                    }
                }
//                Loader.hideLoader(self)
                
            }else{
//                Loader.hideLoader(self)
                Utility().addAlertView("Alert!", "Something is wrong", "OK", self)
            }
                dispatchGroup.leave()
            }
        })
        //4th APi
        dispatchGroup.enter()
        viewModelType.getEqpt_Smac_Role(json: jsonDictionary.init(id: "", type: "SMAC_ROLE"), data: {
            response  in
//            print(response)
            print("4th APi")
            DispatchQueue.main.async {
                var firstitem: Bool = false
            if  response.count > 0{
                for id in response {
                    if firstitem == false {
                        firstitem = true
                        self.arrEquip_RoleID.append("Select")
                        self.arrEquip_RoleID.append(id.short)
                    }else{
                    self.arrEquip_RoleID.append(id.short)
                    }
                }
//                Loader.hideLoader(self)
                
            }else{
//                Loader.hideLoader(self)
                
                Utility().addAlertView("Alert!", "Something is wrong", "OK", self)
            }
                dispatchGroup.leave()
            }
        })
        
        //5th APi
        dispatchGroup.enter()
        viewModelType.getEqpt_Priority(json: jsonDictionary.init(id: "", type: "PRIORITY"), data: {
            response  in
//            print(response)
            print("5th APi")
            DispatchQueue.main.async {
            if  response.count > 0{
//                Loader.hideLoader(self)
                for id in response {
                    self.arrEquip_PriorityID.append(id.tpID)
                    self.arrEquip_PriorityDecr.append(id.descr)
                }
                
            }else{
//                Loader.hideLoader(self)
                Utility().addAlertView("Alert!", "Something is wrong", "OK", self)
            }
                dispatchGroup.leave()
            }
        })
        
        dispatchGroup.notify(queue: .main) {
               // whatever you want to do when both are done
            Loader.hideLoader(self)
            print("All services completed")
           }
    }
    
    func apiSubmit_CreateTask(){
    }
}

extension CreateTicketsViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
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

extension CreateTicketsViewController:UITextViewDelegate{
    
}

extension CreateTicketsViewController:UIImagePickerControllerDelegate{
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

extension CreateTicketsViewController:UIDocumentPickerDelegate{
    
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



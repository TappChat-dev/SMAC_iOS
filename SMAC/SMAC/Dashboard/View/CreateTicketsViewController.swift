//
//  CreateTicketViewController.swift
//  SMAC
//
//  Created by MAC on 10/08/21.
//

import UIKit
import IQKeyboardManagerSwift

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

    var selectedDate = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Date Picker
    @IBAction func tapToDatePickers(_ sender:Any){
//        showDatePicker()
        datePicker = UIDatePicker.init()
            datePicker.backgroundColor = UIColor.white
                    
            datePicker.autoresizingMask = .flexibleWidth
            datePicker.datePickerMode = .date
                    
            datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
//        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .allTouchEvents)
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
        self.dateTxt.text = selectedDate
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
//            self.openGallery(picker: imgPicker)
        })
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(actionCancel)
        actionSheet.addAction(actionSelectCamera)
        actionSheet.addAction(actionSelectGallery)
        actionSheet.addAction(actionSelectDocument)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func tapToUploadDoc_Image(_ sender:Any){
        self.actionSheetOption()
    }
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            Utility().addAlertView("Warning!", "You don't have camera", "OK", self)
        }
    }
    func openGallary(){
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .overFullScreen
        self.present(imagePicker, animated: true, completion: nil)
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
    
}

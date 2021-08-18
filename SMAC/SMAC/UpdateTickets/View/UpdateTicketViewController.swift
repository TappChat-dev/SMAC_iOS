//
//  UpdateTicketViewController.swift
//  SMAC
//
//  Created by MAC on 18/08/21.
//

import UIKit

class UpdateTicketViewController: UIViewController {
    @IBOutlet weak var serviceRequesterTxt: UITextField!
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
        @IBOutlet weak var btnUpdate:UIButton!
        @IBOutlet weak var formView:UIView!
    var selectedDate = ""
    var datePicker = UIDatePicker()
    var toolbar = UIToolbar()
    let imagePicker = UIImagePickerController()
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addArrowBtnToTextField()
        // Do any additional setup after loading the view.
        let salutations = ["Select", "Mr.", "Ms.", "Mrs."]
        serviceRequesterTxt?.loadDropdownData(data: salutations)
        print(titleTxt)
    }
    
    fileprivate func addArrowBtnToTextField() {

      let dropDownBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal) //  downArrow_black arrowtriangle.down.fill, IQButtonBarArrowDown
        serviceRequesterTxt.rightViewMode = UITextField.ViewMode.always
        serviceRequesterTxt.rightView = dropDownBtn

  }

    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    
    @IBAction func tapToDatePicker(_ sender:Any){
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
}

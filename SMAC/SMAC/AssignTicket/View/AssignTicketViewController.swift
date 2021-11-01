//
//  AssignTicketViewController.swift
//  SMAC
//
//  Created by MAC on 30/10/21.
//

import UIKit

class AssignTicketViewController: UIViewController {
    @IBOutlet weak var contractNameTxt: UITextField!
    @IBOutlet weak var unitTxt: UITextField!
    @IBOutlet weak var equipmentNameTxt: UITextField!
    @IBOutlet weak var equipmentTypeTxt: UITextField!
    @IBOutlet weak var serviceTypeTxt: UITextField!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var ticketStatusTxt: UITextField!
    @IBOutlet weak var ticketIDTxt: UITextField!
    @IBOutlet weak var serviceEngTxt: UITextField!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var imageDocumentTxt: UITextField!
    @IBOutlet weak var btnViewImage: UIButton!
    @IBOutlet weak var btnUpdates: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // MARK: - Navigation
    
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    
    @IBAction func tapToViewDocument(_ sender:Any){
        
    }
}

//
//  InitiatePenaltyVC.swift
//  SMAC
//
//  Created by MAC on 17/09/21.
//

import UIKit

class InitiatePenaltyVC: UIViewController {
    @IBOutlet weak var formView:UIView!
    @IBOutlet weak var contractorNametxt:UITextField!
    @IBOutlet weak var organizationNametxt:UITextField!
    @IBOutlet weak var productNametxt:UITextField!
    @IBOutlet weak var penaltyAmounttxt:UITextField!
    @IBOutlet weak var ticketIDtxt:UITextField!
    @IBOutlet weak var datetxt:UITextField!
    @IBOutlet weak var btnDate:UIButton!
    @IBOutlet weak var btnSave:UIButton!
    @IBOutlet weak var btnReset:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        contractorNametxt.text = ""
        organizationNametxt.text = ""
        productNametxt.text = ""
        ticketIDtxt.text = ""
        penaltyAmounttxt.text = ""
    }

}

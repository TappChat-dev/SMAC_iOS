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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

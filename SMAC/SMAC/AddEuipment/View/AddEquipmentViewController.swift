//
//  AddEquipmentViewController.swift
//  SMAC
//
//  Created by MAC on 02/09/21.
//

import UIKit

class AddEquipmentViewController: UIViewController {
    @IBOutlet weak var equipmentNameTxt: UITextField!
    @IBOutlet weak var equipmentTypeTxt: UITextField!
    @IBOutlet weak var modelNoTxt: UITextField!
    @IBOutlet weak var equipmentNoTxt: UITextField!
    @IBOutlet weak var btnReset:UIButton!
    @IBOutlet weak var btnSave:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        self.setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }

    @IBAction func tapSaveButton(_ sender: Any){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewEquipmentVC") as! ViewEquipmentVC
            navigationController?.pushViewController(nextViewController, animated: true)
    }

}

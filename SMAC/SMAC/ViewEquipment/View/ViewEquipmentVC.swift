//
//  ViewEquipmentVC.swift
//  SMAC
//
//  Created by MAC on 07/09/21.
//

import UIKit

class ViewEquipmentVC: UIViewController {

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

    // MARK: - Navigation



}

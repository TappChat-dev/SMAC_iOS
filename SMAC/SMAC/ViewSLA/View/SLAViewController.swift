//
//  SLAViewController.swift
//  SMAC
//
//  Created by MAC on 15/09/21.
//

import UIKit

class SLAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
}

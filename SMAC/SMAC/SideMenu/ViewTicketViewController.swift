//
//  ViewTicketViewController.swift
//  SMAC
//
//  Created by intek on 09/08/21.
//

import UIKit

class ViewTicketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }


}

//
//  PenaltyDetailsVC.swift
//  SMAC
//
//  Created by MAC on 20/09/21.
//

import UIKit

class PenaltyDetailsVC: UIViewController {
    @IBOutlet weak var penalaltyAmount: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var contractorName: UILabel!
    @IBOutlet weak var organisationName: UILabel!
    @IBOutlet weak var ticketID: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - Back Button
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

//
//  LogoutVC.swift
//  SMAC
//
//  Created by MAC on 17/12/21.
//

import UIKit

class LogoutVC: UIViewController {
    @IBOutlet weak var logoutBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender:Any){
        UserDefaults.standard.set("No", forKey: "isLoginSuccess") //setObject
        UserDefaults.standard.set("", forKey: "TechID")
        UserDefaults.standard.set("", forKey: "unit")

        self.navigationController?.dismiss(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
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

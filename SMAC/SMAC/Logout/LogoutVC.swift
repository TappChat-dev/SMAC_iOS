//
//  LogoutVC.swift
//  SMAC
//
//  Created by MAC on 17/12/21.
//

import UIKit

class LogoutVC: UIViewController {
    @IBOutlet weak var logoutBtn:UIButton!
    @IBOutlet weak var logoImage:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblVersion:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let  Username =  UserDefaults.standard.string(forKey: "Username")
         self.lblName.text = Username
        let version = versionAndBuildNumber()
        self.lblVersion.text = "SMAC " + version
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender:Any){
        UserDefaults.standard.set("No", forKey: "isLoginSuccess") //setObject
        UserDefaults.standard.set("", forKey: "TechID")
        UserDefaults.standard.set("", forKey: "unit")
        let vc = (UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController)!
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        dictionary.keys.forEach
        {
            key in   defaults.removeObject(forKey: key)
        }
        self.navigationController?.pushViewController(vc, animated: true)
        //        let navigationController = UINavigationController(rootViewController: vc)
        //        navigationController.isNavigationBarHidden = false
        //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //
        //        appDelegate.window?.rootViewController = navigationController
        
        
        //        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //        appDelegate.window?.rootViewController = nextViewController
        //        appDelegate.window?.makeKeyAndVisible()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func versionAndBuildNumber() -> String {
      let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
      let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
      if let versionNumber = versionNumber, let buildNumber = buildNumber {
        return "Version \(versionNumber) ( Build \(buildNumber))"
      } else if let versionNumber = versionNumber {
        return versionNumber
      } else if let buildNumber = buildNumber {
        return buildNumber
      } else {
        return ""
      }
    }
}

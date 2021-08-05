//
//  LoginViewController.swift
//  SMAC
//
//  Created by MAC on 22/07/21.
//

import UIKit
import SideMenuSwift

//class LoginViewController: UIViewController, StoryboardInitializable {
class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnHideUnhide: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     func viewWillAppear(){
        super.viewWillAppear(true)
    }
    
    func viewWillDisappear(){
        super.viewWillDisappear(true)
    }
    
   
    // MARK: - Button
    @IBAction func tapToLogin(_ sender:UIButton){
        let vc1 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "SideMenu") as? SideMenuController
        let vc2 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContentNavigation") as? NavigationController
        let vc3 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        vc1?.contentViewController = vc2
            vc1?.menuViewController = vc3
        vc1!.modalPresentationStyle = .overFullScreen
       // vc3!.modalTransitionStyle = .coverVertical
//        self.navigationController?.pushViewController(vc!, animated: true)
//     var controller =   SideMenuController(contentViewController: contentViewController,
//                menuViewController: menuViewController)
       // let vc =  SideMenuController(contentViewController: contentViewController,
         //       menuViewController: menuViewController)
        self.present(vc1!, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate{
    
}

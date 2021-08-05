//
//  LoginViewController.swift
//  SMAC
//
//  Created by MAC on 22/07/21.
//

import UIKit

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

    }
}



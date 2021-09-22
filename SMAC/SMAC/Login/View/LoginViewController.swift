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
    private var sideMenuViewController: SideMenuViewController!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnHideUnhide: UIButton!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var btnSegment:UISegmentedControl!
    var segmentSelectedOption:String?
    lazy var viewModel = {
        LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt?.delegate = self
        passwordTxt?.delegate = self
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)

//        self.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.btnSegment?.setTitleTextAttributes([.foregroundColor: UIColor.init(rgb: 0x06284D)], for: .normal)
//        self.btnSegment.setTitleTextAttributes([.foregroundColor: UIColor.init(rgb: 0x06284D)], for: .selected)
        self.btnSegment?.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        // Do any additional setup after loading the view.
    }
    
     func viewWillAppear(){
        super.viewWillAppear(true)
    }
    
    func viewWillDisappear(){
        super.viewWillDisappear(true)
    }
    
    fileprivate func validationCheck() -> Bool {
        if usernameTxt.text!.isEmpty {
            Utility().addAlertView("Alert!", StringConstant.emptyUsername, "OK", self)
            return false
        } else if passwordTxt.text!.isEmpty || passwordTxt.text!.count < 6{
            Utility().addAlertView("Alert!", StringConstant.emptyPassword, "OK", self)
            return false
        }
        return true
    }
    
    // MARK: - Login Button
    @IBAction func tapToLogin(_ sender:UIButton){
//        if validationCheck() {
//            usernameTxt.resignFirstResponder()
//            passwordTxt.resignFirstResponder()
//            moveToDashBord()
       let vc1 = ContainerViewController()
        
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
        vc?.menuDelegate = vc1
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        self.sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuID") as? SideMenuViewController
            self.navigationController?.pushViewController(vc!, animated: true)
            
            return
            
            let status =  viewModel.getLoginResponse(user: LoginViewCredentialModel(username: usernameTxt.text!, password: passwordTxt.text!, type: segmentSelectedOption!))
              if status {
                  //navigate to other controller
                moveToDashBord()
              }else{
                  
              }
//        }
     
    }
    func moveToDashBord(){
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
    
    func setRootToLogin() {
        UIApplication.shared.windows.first?.rootViewController = ContainerViewController()
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch btnSegment.selectedSegmentIndex {
        case 0:
            segmentSelectedOption = "icg"
            break
            
        case 1:
            segmentSelectedOption = "non-icg"
            break
           
        default:
            break;
        }

    }
}

extension LoginViewController: UITextFieldDelegate{
    // UITextField Delegates
        func textFieldDidBeginEditing(_ textField: UITextField) {
            print("TextField did begin editing method called")
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            print("TextField did end editing method called\(textField.text!)")
        }
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            print("TextField should begin editing method called")
            return true;
        }
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            print("TextField should clear method called")
            return true;
        }
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            print("TextField should end editing method called")
            return true;
        }
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            print("While entering the characters this method gets called")
            return true;
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            print("TextField should return method called")
            textField.resignFirstResponder();
            return true;
        }
}



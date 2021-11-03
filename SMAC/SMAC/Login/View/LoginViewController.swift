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
    var userResultModel = [ResultLogin]()

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt?.delegate = self
        passwordTxt?.delegate = self
        self.navigationController?.isNavigationBarHidden = true
//        usernameTxt.text = "pushkar.singh" // NON-ICG
//        usernameTxt.text = "gautamsingh.12957" // ICG SDM
//        passwordTxt.text = "18Aug2014@8851"
        usernameTxt.text = "jaideep.04627" // ICG Equip USer
        passwordTxt.text = "06Aug2001@6676"
        
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
        } else if passwordTxt.text!.isEmpty || passwordTxt.text!.count < 3{
            Utility().addAlertView("Alert!", StringConstant.emptyPassword, "OK", self)
            return false
        }
        return true
    }
    
    // MARK: - Login Button
    @IBAction func tapToLogin(_ sender:UIButton){
        if validationCheck() {
            usernameTxt.resignFirstResponder()
            passwordTxt.resignFirstResponder()
//            moveToDashBord()
            if segmentSelectedOption == "" || segmentSelectedOption == nil{
                segmentSelectedOption = "ICG"
            }
            Loader.showLoader("Login...", target: self)
       let vc1 = ContainerViewController()
            var menuController : MenuCustomViewController!
            viewModel.getLoginResponse(user: LoginViewCredentialModel(username: usernameTxt.text!, password: passwordTxt.text!, type: segmentSelectedOption!), data: {
                response, status  in
                print(response)
                if status == true  && response.result.count > 0{
                    //navigate to other controller
  //                moveToDashBord()
                    var techID = ""
                    for item in response.result {
                        if self.segmentSelectedOption == "ICG" {
                            print(response.result[0])
                            techID = item.pid
                        }else{
                            
                        }
                    }
                    
                    
                    self.API_checkRole(TechID: techID, type: self.segmentSelectedOption!, roles: {
                        dict in
                        print(dict)
                        UserDefaults.standard.set(dict["roleID"], forKey: "isLoginRoleID")
                        UserDefaults.standard.set(dict["descr"], forKey: "isLoginRoleDesc")
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
                          Loader.hideLoader(self)
                        vc?.roleID = dict["roleID"] as! String
                        vc?.roleDescp = dict["descr"] as! String
                        self.navigationController?.pushViewController(vc!, animated: true)
                    })
//                    print(response[0].adhaarNO)
                    UserDefaults.standard.set("Yes", forKey: "isLoginSuccess") //setObject
                    UserDefaults.standard.set(response.result[0].unit, forKey: "unit")
                    UserDefaults.standard.set("", forKey: "status")
                 
//                    self.moveToDashBord()
                }else{
                    Loader.hideLoader(self)
                    Utility().addAlertView("Alert!", "Please Check Your Selected Option!", "OK", self)
                }
            })
//              if status == true {
//                  //navigate to other controller
////                moveToDashBord()
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
////            vc?.menuDelegate = vc1
//                self.navigationController?.pushViewController(vc!, animated: true)
//              }else{
//
//              }
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
//        vc?.menuDelegate = vc1
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        self.sideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuID") as? SideMenuViewController
//            self.navigationController?.pushViewController(vc!, animated: true)
            
            return
            
          
        }
     
    }
    func moveToDashBord(){
        let vc1 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "SideMenu") as? SideMenuController
        let vc2 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContentNavigation") as? NavigationController
        let vc3 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
//        let vc3 = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
        vc1?.contentViewController = vc2
            vc1?.menuViewController = vc3
        vc1!.modalPresentationStyle = .overFullScreen
       // vc3!.modalTransitionStyle = .coverVertical
//        self.navigationController?.pushViewController(vc!, animated: true)
//     var controller =   SideMenuController(contentViewController: contentViewController,
//                menuViewController: menuViewController)
       // let vc =  SideMenuController(contentViewController: contentViewController,
         //       menuViewController: menuViewController)
//        self.present(vc1!, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc1!, animated: true)
        
    }
    
    func setRootToLogin() {
        UIApplication.shared.windows.first?.rootViewController = ContainerViewController()
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch btnSegment.selectedSegmentIndex {
        case 0:
            segmentSelectedOption = "ICG"
            break
            
        case 1:
            segmentSelectedOption = "NCG"
            break
           
        default:
            break;
        }

    }
    
    
    func API_checkRole(TechID:String,type:String, roles:@escaping(_ result: Dictionary<String, Any>) ->()){
        Loader.showLoader("Wait... Geting Your Role.", target: self)
        viewModel.getRoles(user: RoleJsonDictionary(id: TechID, type: type), data: {
            response  in
            print(response)
            var dic = [String:Any]()
            for id in response.users{
                print(id.rID)
                dic = ["roleID":id.rID,"descr":id.descr]
            }
            roles(dic)
        })
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



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
//    var viewModelFactory: (LoginInputsModel) -> Bool = { _ in fatalError("Missing view model factory.") }
//    let viewDesignFactory : (LoginCoordinator) -> Void = {
//        _ in fatalError("Missing view model factory.") }
    
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
//        let inputs = LoginInputsModel(
        email: username.rx.text.orEmpty.asObservable(),
        passwords: password.rx.text.orEmpty.asObservable(),
        login: btnLogin.rx.tap.asObservable()
        )
        
//     let status =   viewModelFactory(inputs)
//        if status {
        let viewController = DashboardViewController.initFromStoryboard(name: "Main")
         let coordi =   DashboardCoordinator.init(rootViewController: viewController)
//        }
        let appCoordinator : LoginCoordinator?
//        DashboardCoordinator.init(rootViewController: <#T##UIViewController#>)
//        appCoordinator!.coordinateToDashboard()
//            .subscribe()
//            .disposed(by: DisposeBag.init())
        btnLogin.rx.tap
            .subscribe(onNext: { [weak self] in self.coordinateToDashboard() })
            .disposed(by: DisposeBag())
    }
}

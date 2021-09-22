//
//  ContainerViewController.swift
//  SMAC
//
//  Created by MAC on 21/09/21.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var menuController : MenuCustomViewController!
    var centerVC :UIViewController!
    var homeVC :DashboardViewController?
    var loginVC : LoginViewController?
    
    var isExpandMenu : Bool = false
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setHomeFun()
        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool{
        return isExpandMenu
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    func configureStatusbarAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
    func setHomeFun(){
        
        if homeVC == nil {
            homeVC = DashboardViewController()
            homeVC?.menuDelegate = self
            centerVC = UINavigationController(rootViewController: homeVC!)
            centerVC.view.frame = (self.homeVC?.view.frame)!
            self.view.addSubview(centerVC.view)
            addChild(centerVC)
            centerVC.didMove(toParent: self)
        }
        
//                if loginVC == nil {
//                    loginVC = LoginViewController()
//                    centerVC = UINavigationController(rootViewController: loginVC!)
//                    self.loginVC?.view.frame = self.view.frame
//                    self.view.addSubview(centerVC.view)
//                    addChild(centerVC)
//                    centerVC.didMove(toParent: self)
//                }else{
//                    homeVC = DashboardViewController()
//                    homeVC?.menuDelegate = self
//                    centerVC = UINavigationController(rootViewController: homeVC!)
//                    self.view.addSubview(centerVC.view)
//                    addChild(centerVC)
//                    centerVC.didMove(toParent: self)
//                }
    }
    func setHomeFun(index:Int){
        if (index == 1) {
            configureMenu()
        }
        else  if index == 2{
//            guard let url = URL(string: "https://www.appcodezip.com/p/var-posttitle-new-arrayvar-posturl-new.html") else {
//                return
//            }
//                let safariVC = SFSafariViewController(url: url)
//                present(safariVC, animated: true, completion: nil)
        }
        else  if index == 3{
//                guard let url = URL(string: "https://www.google.com/search?q=appcodezip&hl=en&sxsrf=ALeKk03gAE_L7gZHoClMTuwqGHQImCdjgQ:1592214875743&source=lnms&sa=X&ved=0ahUKEwiUlMzQxoPqAhXIV30KHRD5Be4Q_AUIDSgA&biw=1440&bih=693&dpr=1") else {
//                    return
//                }
//                    let safariVC = SFSafariViewController(url: url)
//                    present(safariVC, animated: true, completion: nil)
            }
        else{
//   homeVC.navigationController?.pushViewController(FirstVC(), animated: true)
            
        }
        
    }
    func configureMenu()  {
        if menuController == nil {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if #available(iOS 13.0, *) {
                menuController = storyBoard.instantiateViewController(identifier: "MenuCustomViewController") as? MenuCustomViewController
            } else {
                menuController = storyBoard.instantiateViewController(withIdentifier: "MenuCustomViewController") as? MenuCustomViewController
                
            }

            menuController.delegate = self
            view.insertSubview(menuController.view , at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("configureMenu called")
        }
    }
    func showMenu(isExpand:Bool){
        if isExpand {
            //open Menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerVC.view.frame.origin.x = self.centerVC.view.frame.width - 100
            }, completion: nil)
        }else{
             //close Menu
           UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.centerVC.view.frame.origin.x = 0
                      }, completion: nil)
        }
        configureStatusbarAnimation()
    }
}
extension ContainerViewController : MenuDelegate{

    
    func menuHandler(index: Int) {
        if !isExpandMenu {
            configureMenu()
        }
        isExpandMenu = !isExpandMenu
        showMenu(isExpand: isExpandMenu)
        if index > -1 {
            setHomeFun(index: index)
        }
    }
}

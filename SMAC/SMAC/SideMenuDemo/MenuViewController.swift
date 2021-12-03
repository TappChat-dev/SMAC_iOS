//
//  MenuViewController.swift
//  SideMenuExample
//
//  Created by kukushi on 11/02/2018.
//  Copyright © 2018 kukushi. All rights reserved.
//

import UIKit
import SideMenuSwift

class Preferences {
    static let shared = Preferences()
    var enableTransitionAnimation = false
}

class MenuViewController: UIViewController {
    var isDarkModeEnabled = false
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    @IBOutlet weak var selectionTableViewHeader: UILabel!

    @IBOutlet weak var selectionMenuTrailingConstraint: NSLayoutConstraint!
    private var themeColor = UIColor.white

    let totalSDMICG = ["DashBoard","Create Ticket", "View Ticket","View Contract","View Vender","View Equipment"]
    let arrSDMVender = ["DashBoard","Create Ticket","Assign Ticket","View Ticket","View Contract","View Equipment"]
    let arrEquipmentUser = ["DashBoard","Create Ticket","View Ticket","View Contract","View Equipment","View Vender"]
    let arrServiceEng = ["DashBoard","View Ticket","View Contract","View Equipment"]
    var totalArrayRole = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        roleID =  UserDefaults.standard.string(forKey: "isLoginRoleID")!
        if roleID == "DM" {// non-icg service desk manager //"R09"
            totalArrayRole = arrSDMVender
        }else if (roleID == "SD"){ // icg service desk manager //"R04"
            totalArrayRole = totalSDMICG
        }else if (roleID == "SE"){ // non-icg service engineer //"R05"
            totalArrayRole = arrServiceEng
        }else if (roleID == "EU"){ // icg Eqipment user //"R08"
            totalArrayRole = arrEquipmentUser
        }
        isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
        configureView()

        if roleID == "DM" {
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "CreateTicket")
            }, with: "1")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "AssignTicket")
            }, with: "2")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewTicket")
            }, with: "3")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewContract")
            }, with: "4")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewEquipment")
            }, with: "5")
        }else if (roleID == "SD"){// icg service desk manager //"R04"
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "CreateTicket")
            }, with: "1")

            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewTicket")
            }, with: "2")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewContract")
            }, with: "3")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewVender")
            }, with: "4")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewEquipment")
            }, with: "5")
        }else if (roleID == "SE"){ // non-icg service engineer //"R05"
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewTicket")
            }, with: "1")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewContract")
            }, with: "2")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewEquipment")
            }, with: "3")
        }else if (roleID == "EU"){ // icg Eqipment user //"R08"
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "CreateTicket")
            }, with: "1")

            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewTicket")
            }, with: "2")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewContract")
            }, with: "3")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewEquipment")
            }, with: "4")
            sideMenuController?.cache(viewControllerGenerator: {
                self.storyboard?.instantiateViewController(withIdentifier: "ViewVender")
            }, with: "5")
        }
//        sideMenuController?.cache(viewControllerGenerator: {
//            self.storyboard?.instantiateViewController(withIdentifier: "CreateTicket")
//        }, with: "1")
//
//        sideMenuController?.cache(viewControllerGenerator: {
//            self.storyboard?.instantiateViewController(withIdentifier: "ViewTicket")
//        }, with: "2")

        sideMenuController?.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[Example] Menu did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[Example] Menu will disappear")
    }

    private func configureView() {
        if isDarkModeEnabled {
            themeColor = UIColor(red: 0.03, green: 0.04, blue: 0.07, alpha: 1.00)
            selectionTableViewHeader.textColor = .white
        } else {
            selectionMenuTrailingConstraint.constant = 0
            themeColor = UIColor(red: 0.98, green: 0.97, blue: 0.96, alpha: 1.00)
        }

        let sidemenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sidemenuBasicConfiguration.position == .under) != (sidemenuBasicConfiguration.direction == .right)
        if showPlaceTableOnLeft {
            selectionMenuTrailingConstraint.constant = SideMenuController.preferences.basic.menuWidth - view.frame.width
        }

        view.backgroundColor = themeColor
        tableView.backgroundColor = themeColor
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        let sideMenuBasicConfiguration = SideMenuController.preferences.basic
        let showPlaceTableOnLeft = (sideMenuBasicConfiguration.position == .under) != (sideMenuBasicConfiguration.direction == .right)
        selectionMenuTrailingConstraint.constant = showPlaceTableOnLeft ? SideMenuController.preferences.basic.menuWidth - size.width : 0
        view.layoutIfNeeded()
    }
}

extension MenuViewController: SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController,
                            animationControllerFrom fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }

    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller will show [\(viewController)]")
    }

    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        print("[Example] View controller did show [\(viewController)]")
    }

    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will hide")
    }

    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did hide.")
    }

    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu will reveal.")
    }

    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
        print("[Example] Menu did reveal.")
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   totalArrayRole.count
    }

    // swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectionCell
        cell.contentView.backgroundColor = themeColor
        
        let row = indexPath.row
//        if row == 0 {
//            cell.titleLabel?.text = "DashBoard"
//        } else{
            cell.titleLabel?.text = totalArrayRole[indexPath.row]
//        }
//        if row == 1 {
//            cell.titleLabel?.text = "Create Ticket"
//        } else if row == 2 {
//            cell.titleLabel?.text = "View Ticket"
//        }
        if isDarkModeEnabled {
            cell.titleLabel?.textColor = UIColor.white
        }else{
            cell.titleLabel?.textColor = UIColor.black
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row

        sideMenuController?.setContentViewController(with: "\(row)", animated: Preferences.shared.enableTransitionAnimation)
        sideMenuController?.hideMenu()

        if let identifier = sideMenuController?.currentCacheIdentifier() {
            print("[Example] View Controller Cache Identifier: \(identifier)")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

class SelectionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

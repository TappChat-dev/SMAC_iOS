//
//  ViewController.swift
//  SideMenuExample
//
//  Created by kukushi on 11/02/2018.
//  Copyright © 2018 kukushi. All rights reserved.
//

import UIKit
import Eureka

extension UIColor {
    static var mirage: UIColor {
        return UIColor(red: 0.08, green: 0.11, blue: 0.19, alpha: 1.00)
    }

    static var lobolly: UIColor {
        return UIColor(red: 0.75, green: 0.78, blue: 0.81, alpha: 1.00)
    }
}

class TicketFilterViewController: FormViewController {
  
    
    @IBOutlet weak var enablePanGesture: UISwitch!
    @IBOutlet weak var enableRubberBandEffect: UISwitch!
    @IBOutlet weak var enableTransitionAnimationSwitch: UISwitch!
    @IBOutlet weak var statusBarBehaviorSegment: UISegmentedControl!
    @IBOutlet weak var menuPositionSegment: UISegmentedControl!
    @IBOutlet weak var menuDirectionSegment: UISegmentedControl!
    @IBOutlet weak var orientationSegment: UISegmentedControl!
    @IBOutlet var indicatorLabels: [UILabel]!
    @IBOutlet weak var containerView: UIView!

    var isDarkModeEnabled = false
    var themeColor = UIColor.white
    let statusBarBehaviors: [SideMenuController.Preferences.StatusBarBehavior] = [.none, .slide, .fade, .hideOnMenu]
    let menuPosition: [SideMenuController.Preferences.MenuPosition] = [.above, .under, .sideBySide]
    let menuDirections: [SideMenuController.Preferences.MenuDirection] = [.left, .right]
    let menuOrientation: [UIInterfaceOrientationMask] = [.portrait, .allButUpsideDown]

    override func viewDidLoad() {
        super.viewDidLoad()

       

        isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
        configureUI()
        setNeedsStatusBarAppearanceUpdate()
   // }
    super.viewDidLoad()
    title = "Filter"
    form +++
        Section(header: "Filter Ticket List", footer: "")

        <<< SegmentedRow<String>("segments"){
            $0.options = ["Open", "Close","Hold", "SRA"]
            $0.value = "Open"
        }

        <<< AlertRow<String>() {
            $0.title = "Priority"
            $0.cancelTitle = "Dismiss"
            $0.selectorTitle = "Priority"
            $0.options = ["Low", "High", "Mediam"]
            $0.value = "High"
            }.onChange { row in
                print(row.value ?? "No Value")
            }
            .onPresent{ _, to in
                to.view.tintColor = .purple
        }
       
      
        <<< DateRow(){
            $0.title = "Start date"
            $0.value = Date()
            let formatter = DateFormatter()
            formatter.locale = .current
            formatter.dateStyle = .long
            $0.dateFormatter = formatter
        }
        <<< DateRow(){
            $0.title = "End date"
            $0.value = Date()
            let formatter = DateFormatter()
            formatter.locale = .current
            formatter.dateStyle = .long
            $0.dateFormatter = formatter
        }
        <<< AlertRow<String>() {
            $0.title = "Assign To"
            $0.cancelTitle = "Dismiss"
            $0.selectorTitle = "Assign To"
            $0.options = ["Kanhiya", "Chandan", "Deepak", "ishaan", "sunny"]
            $0.value = "Kanhiya"
            }.onChange { row in
                print(row.value ?? "No Value")
            }
            .onPresent{ _, to in
                to.view.tintColor = .purple
        }
        <<< AlertRow<String>() {
            $0.title = "Ticket Status"
            $0.cancelTitle = "Dismiss"
            $0.selectorTitle = "Ticket Status"
            $0.options = ["Open", "Close", "Hold"]
            $0.value = "Open"
            }.onChange { row in
                print(row.value ?? "No Value")
            }
            .onPresent{ _, to in
                to.view.tintColor = .purple
        }
}

    private func configureUI() {

        if isDarkModeEnabled {
            themeColor = .mirage
            statusBarBehaviorSegment.tintColor = .lobolly
            menuPositionSegment.tintColor = .lobolly
            menuDirectionSegment.tintColor = .lobolly
            orientationSegment.tintColor = .lobolly
            for label in indicatorLabels {
                label.textColor = .white
            }
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = .lobolly
            navigationController?.navigationBar.barTintColor = .mirage
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        } else {
            themeColor = .white
        }

        view.backgroundColor = themeColor
        containerView.backgroundColor = themeColor

        let preferences = SideMenuController.preferences.basic
        guard let behaviorIndex = statusBarBehaviors.firstIndex(of: preferences.statusBarBehavior) else {
            fatalError("Configuration is messed up")
        }
//        statusBarBehaviorSegment.selectedSegmentIndex = behaviorIndex
//
//        guard let menuPositionIndex = menuPosition.firstIndex(of: preferences.position) else {
//            fatalError("Configuration is messed up")
//        }
//        menuPositionSegment.selectedSegmentIndex = menuPositionIndex
//
//        guard let menuDirectionIndex = menuDirections.firstIndex(of: preferences.direction) else {
//            fatalError("Configuration is messed up")
//        }
//        menuDirectionSegment.selectedSegmentIndex = menuDirectionIndex
//
//        guard let menuOrientationIndex = menuOrientation.firstIndex(of: preferences.supportedOrientations)else {
//            fatalError("Configuration is messed up")
//        }
//        orientationSegment.selectedSegmentIndex = menuOrientationIndex
    }

    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }

    @IBAction func segmentControlDidChanged(_ sender: UISegmentedControl) {
        switch sender {
        case statusBarBehaviorSegment:
            SideMenuController.preferences.basic.statusBarBehavior = statusBarBehaviors[sender.selectedSegmentIndex]
        case menuPositionSegment:
            SideMenuController.preferences.basic.position = menuPosition[sender.selectedSegmentIndex]
            presentAlert()
        case menuDirectionSegment:
            SideMenuController.preferences.basic.direction = menuDirections[sender.selectedSegmentIndex]
            presentAlert()
        case orientationSegment:
            SideMenuController.preferences.basic.supportedOrientations = sender.selectedSegmentIndex == 0 ? .portrait : .allButUpsideDown
        default:
            break
        }
    }

    func presentAlert() {
        let alert = UIAlertController(title: "Reload Side Menu",
                                      message: "Side Menu need to be reloaded after modifying key properties.",
                                      preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "Yeah", style: .default) { (_) in
            let sideMenuController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenu")
            UIApplication.shared.keyWindow?.rootViewController = sideMenuController
        }
        alert.addAction(confirmButton)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func switchDidClicked(_ sender: UISwitch) {
        switch sender {
        case enablePanGesture:
            SideMenuController.preferences.basic.enablePanGesture = sender.isOn
        case enableRubberBandEffect:
            SideMenuController.preferences.basic.enableRubberEffectWhenPanning = sender.isOn
        case enableTransitionAnimationSwitch:
            Preferences.shared.enableTransitionAnimation = sender.isOn
        default:
            break
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        print("[SideMenu] View Will Transition")
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDarkModeEnabled ? .lightContent : .default
    }

}

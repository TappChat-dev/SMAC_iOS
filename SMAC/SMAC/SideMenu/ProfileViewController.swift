//
//  ProfileViewController.swift
//  SMAC
//
//  Created by intek on 09/08/21.
//

import UIKit
import Eureka
class ProfileViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        form +++
            Section(header: "User Detail", footer: "")

            <<< NameRow() {
                $0.title = "Name"
                $0.placeholder = "kanhiya"
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            <<< NameRow() {
                $0.title = "Address"
                $0.placeholder = "ICG Noida"
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            <<< EmailRow() {
                $0.title = "Email"
                $0.placeholder = "xyx@gmail.com"
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            <<< DateRow(){
                $0.title = "Date of birth"
                $0.value = Date()
                let formatter = DateFormatter()
                formatter.locale = .current
                formatter.dateStyle = .long
                $0.dateFormatter = formatter
            }
            .cellSetup { cell, row in
                cell.height = {60 }
        }
            <<< AlertRow<String>() {
                $0.title = "Gender"
                $0.cancelTitle = "Dismiss"
                $0.selectorTitle = "Male"
                $0.options = ["Male", "Female"]
                $0.value = "Male"
                }.onChange { row in
                    print(row.value ?? "No Value")
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purple
            }
            .cellSetup { cell, row in
                cell.height = {60 }
        }
            
            <<< EmailRow() {
                $0.title = "Mobile Number"
                $0.placeholder = "xxxxxxxxxxxxx"
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            
        
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }

}

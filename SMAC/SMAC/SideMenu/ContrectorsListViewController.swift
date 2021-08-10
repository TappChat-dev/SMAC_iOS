//
//  ContrectorsListViewController.swift
//  SMAC
//
//  Created by intek on 09/08/21.
//

import UIKit
import Eureka
class ContrectorsListViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contrectors"
        form +++
            Section(header: "Contrectors List", footer: "")

            <<< NameRow() {
                $0.title = "Contrector1"
                
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            <<< NameRow() {
                $0.title = "Contrector2"
               
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            <<< NameRow() {
                $0.title = "Contrector3"
               
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
            <<< NameRow() {
                $0.title = "Contrector4"
             
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

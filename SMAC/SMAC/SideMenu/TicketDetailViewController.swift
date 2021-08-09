//
//  SecondViewController.swift
//  SideMenuExample
//
//  Created by kukushi on 21/02/2018.
//  Copyright © 2018 kukushi. All rights reserved.
//

import UIKit
import Eureka
typealias Emoji = String
class TicketDetailViewController: FormViewController {
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = kCREATE_TICKET
        form +++
            Section(header: "CREATE TICKET", footer: "")

            <<< NameRow() {
                $0.title = "Equipment ID"
                $0.placeholder = "Equipment ID"
               
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
                    cell.height = {60 }
            }

            <<< AlertRow<String>() {
                $0.title = "Equipment Type"
                $0.cancelTitle = "Dismiss"
                $0.selectorTitle = "Equipment Type"
                $0.options = ["Equipment1", "Equipment2", "Equipment3", "Equipment4", "Equipment5", "Equipment6","Equipment7", "Equipment8", "Equipment9", "Equipment10", "Equipment11", "Equipment12","Equipment13", "Equipment14", "Equipment15", "Equipment16", "Equipment17"]
                $0.value = "Equipment1"
                
                }.onChange { row in
                    print(row.value ?? "No Value")
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purple
                    
            }
            .cellSetup { cell, row in
                cell.height = {60 }
        }
            <<< AlertRow<String>() {
                $0.title = "Equipment SubType"
                $0.cancelTitle = "Dismiss"
                $0.selectorTitle = "Equipment SubType"
                $0.options = ["EquipmentSubType1", "EquipmentSubType2", "EquipmentSubType3", "EquipmentSubType4", "EquipmentSubType5"]
                $0.value = "EquipmentSubType5"
                }.onChange { row in
                    print(row.value ?? "No Value")
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purple
            }
            .cellSetup { cell, row in
                cell.height = {60 }
        }
          
            <<< DateRow(){
                $0.title = "Created date"
                $0.value = Date()
                let formatter = DateFormatter()
                formatter.locale = .current
                formatter.dateStyle = .long
                $0.dateFormatter = formatter
            }
            .cellSetup { cell, row in
                cell.height = {60 }
        }
            <<< DateRow(){
                $0.title = "Close date"
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
            .cellSetup { cell, row in
                cell.height = {60 }
        }
            <<< AlertRow<String>() {
                $0.title = "Ticket Status"
                $0.cancelTitle = "Dismiss"
                $0.selectorTitle = "Ticket Status"
                $0.options = ["Open", "Close", "Hold"]
                $0.value = "Kanhiya"
                }.onChange { row in
                    print(row.value ?? "No Value")
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purple
            }
            .cellSetup { cell, row in
                cell.height = {60 }
        }

    }
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
   
/*
    @IBAction func pushViewControllerButtonDidClicked(_ sender: Any) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "PushedViewController") else {
            return
        }
        viewController.view.backgroundColor = .white
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func presentViewControllerButtonClicked(_ sender: UIButton) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "PushedViewController") else {
            return
        }
        viewController.view.backgroundColor = .white
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                          target: self,
                                                                          action: #selector(dismissViewController))
        present(navigationController, animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }

   

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
*/
}

class PushedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    var items = [String](repeating: "Cell", count: 100)

    override func viewDidLoad() {
        super.viewDidLoad()

        printSideMenu(#function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        printSideMenu(#function)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        printSideMenu(#function)
    }

    private func printSideMenu(_ function: String) {
        if let sideMenuController = sideMenuController {
            print("In `\(function)`, sideMenuControlLer is: \(sideMenuController)")
        }

        if navigationController == navigationController {
            print("    - And navigationController is: \(String(describing: navigationController))")
        }
    }
}

extension PushedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row]) \(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//
//  SecondViewController.swift
//  SideMenuExample
//
//  Created by kukushi on 21/02/2018.
//  Copyright © 2018 kukushi. All rights reserved.
//

import UIKit
import Eureka

class TicketDetailViewController: FormViewController {
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Ticket"
        form +++
            Section(header: "CREATE TICKET", footer: "")

            <<< NameRow() {
                $0.title = "Equipment identity"
                $0.placeholder = "Please enter equipment identity "
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
            }

            <<< NameRow() {
                $0.title = "Equipment Type"
                $0.placeholder = "Please enter equipment type "
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
            }
            <<< NameRow() {
                $0.title = "Equipment Sub Type"
                $0.placeholder = "Please enter equipment sub type "
                }
                .cellSetup { cell, row in
                    cell.imageView?.image = UIImage(named: "plus_image")
            }
            <<< DateRow(){
                $0.title = "Created date"
                $0.value = Date()
                let formatter = DateFormatter()
                formatter.locale = .current
                formatter.dateStyle = .long
                $0.dateFormatter = formatter
            }
            <<< DateRow(){
                $0.title = "Close date"
                $0.value = Date()
                let formatter = DateFormatter()
                formatter.locale = .current
                formatter.dateStyle = .long
                $0.dateFormatter = formatter
            }
//            <<< SwitchRow() {
//                $0.cellProvider = CellProvider<SwitchCell>(nibName: "SwitchCell", bundle: Bundle.main)
//            }.cellSetup { (cell, row) in
//                cell.height = { 67 }
//            }
//
//            <<< DatePickerRow() {
//                $0.cellProvider = CellProvider<DatePickerCell>(nibName: "DatePickerCell", bundle: Bundle.main)
//            }.cellSetup { (cell, row) in
//                cell.height = { 345 }
//            }
//            <<< TextAreaRow() {
//                $0.placeholder = "TextAreaRow"
//                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
//        }
       /*     +++ Section("Customized Alignment")

            <<< NameRow() {
                $0.title = "Your name:"
                }.cellUpdate { cell, row in
                    cell.textField.textAlignment = .left
                    cell.textField.placeholder = "(left alignment)"
            }

            <<< NameRow().cellUpdate { cell, row in
                cell.textField.textAlignment = .right
                cell.textField.placeholder = "Name (right alignment)"
            }

            +++ Section(header: "Customized Text field width", footer: "Eureka allows us to set up a specific UITextField width using textFieldPercentage property. In the section above we have also right aligned the textLabels.")

            <<< NameRow() {
                $0.title = "Title"
                $0.titlePercentage = 0.4
                $0.placeholder = "textFieldPercentage = 0.6"
                }
                .cellUpdate {
                    $1.cell.textField.textAlignment = .left
                    $1.cell.textLabel?.textAlignment = .right
            }
            <<< NameRow() {
                $0.title = "Another Title"
                $0.titlePercentage = 0.4
                $0.placeholder = "textFieldPercentage = 0.6"
                }
                .cellUpdate {
                    $1.cell.textField.textAlignment = .left
                    $1.cell.textLabel?.textAlignment = .right
            }
            <<< NameRow() {
                $0.title = "One more"
                $0.titlePercentage = 0.3
                $0.placeholder = "textFieldPercentage = 0.7"
                }
                .cellUpdate {
                    $1.cell.textField.textAlignment = .left
                    $1.cell.textLabel?.textAlignment = .right
            }

            +++ Section("TextAreaRow")

            <<< TextAreaRow() {
                $0.placeholder = "TextAreaRow"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
        }
            <<< TextAreaRow() {
                $0.value = "You also have scrollable read only textAreaRows! I have to write a big text so you will be able to scroll a lot and see that this row is scrollable. I think it is a good idea to insert a Lorem Ipsum here: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac odio consectetur, faucibus elit at, congue dolor. Duis quis magna eu ante egestas laoreet. Vivamus ultricies tristique porttitor. Proin viverra sem non turpis molestie, volutpat facilisis justo rutrum. Nulla eget commodo ligula. Aliquam lobortis lobortis justo id fermentum. Sed sit amet elit eu ipsum ultricies porttitor et sed justo. Fusce id mi aliquam, iaculis odio ac, tempus sem. Aenean in eros imperdiet, euismod lacus vitae, mattis nulla. Praesent ornare sem vitae ornare efficitur. Nullam dictum tortor a tortor vestibulum pharetra. Donec sollicitudin varius fringilla. Praesent posuere fringilla tristique. Aliquam dapibus vel nisi in sollicitudin. In eu ligula arcu."
                $0.textAreaMode = .readOnly
                $0.textAreaHeight = .fixed(cellHeight: 110)
        }
*/
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

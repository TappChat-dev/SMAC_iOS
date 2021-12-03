//
//  ContractorSLA_VC.swift
//  SMAC
//
//  Created by MAC on 21/09/21.
//

import UIKit
import SideMenuSwift

class ContractorSLA_VC: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    var userModel = [UserContract]()// viewAllTickets
    var userModelContr = [ResultTickets]()
    lazy var viewModelType = {
        ContractModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)

        self.tableView.register(ContractorSLA.nib, forCellReuseIdentifier: ContractorSLA.identifier)
        if userModel.count > 0 {
            self.tableView.reloadData()
        }else{
            Loader.showLoader("Downloading Contract...", target: self)
            getContract()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        tableView.reloadData()
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
//        self.navigationController?.popViewController( animated: true)
        self.sideMenuController?.revealMenu()

    }
    //MARK:- API Call
    func getContract(){
//        viewModelType.get_APIContract(json: jsonDictionaryForGetContract.init(id: ""), data: {
//            response in
//            DispatchQueue.main.async {
//                var firstitem: Bool = false
//                if  response?.users.count ?? 0 > 0{
//                    Loader.hideLoader(self)
//                    self.userModel = response?.users ?? []
//                    self.tableView.reloadData()
////                    for id in response {
////
////                    }
//                }else{
//                    Loader.hideLoader(self)
//                    Utility().addAlertView("Alert!", "Data not found", "OK", self)
//                }
//            }
//        })
//        Loader.hideLoader(self)
        
        guard let techID =  UserDefaults.standard.string(forKey: "TechID") else { return print("unit id is not find.") }
        viewModelType.API_getViewAllTicketsWithComboContract(json: RoleJsonDictionary.init(id: techID, type: "TICKET_BY_PID"), data: { [weak self]
            response,status  in
            if status == true{
//                print(response?.result.count)
                let dataResult = response?.result ?? []
                for items in dataResult{
                    self?.userModelContr.append(items)
                }
                Loader.hideLoader(self)

//                print(self?.userResultModel)
                self?.tableView.reloadData()
            }
            Loader.hideLoader(self)
        })
    }
}
extension ContractorSLA_VC:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModelContr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractorSLA.identifier, for: indexPath) as? ContractorSLA else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = userModelContr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
}

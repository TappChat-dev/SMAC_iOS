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
    @IBOutlet weak var searchBar: UISearchBar!
    var SearchBarValue:String!
       var searchActive : Bool = false
    
    var userModel = [UserContract]()// viewAllTickets
//    var userModelContr = [ResultTickets]()
    var userModelContr = [RedefineResult]()
    var SearchResultModel = [RedefineResult]()

    lazy var viewModelType = {
        ContractModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)

        self.tableView.register(ContractorSLA.nib, forCellReuseIdentifier: ContractorSLA.identifier)
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        tableView.reloadData()
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
        if userModel.count > 0 {
            self.tableView.reloadData()
        }else{
            Loader.showLoader("Downloading Contract...", target: self)
            getContract()
        }
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
        viewModelType.API_getViewAllTicketsWithComboContract(json: RoleJsonDictionary.init(id: techID, type: "ALL_CONTRACT_BY_PID"), data: { [weak self]
            response,status  in
            if status == true{
//                print(response?.result.count)
                let dataResult = response?.result ?? []
//                for items in dataResult{
//                    self?.userModelContr.append(items)
//                }
                if dataResult.count > 0 {
                    self?.userModelContr = dataResult
                }
                Loader.hideLoader(self)

//                print(self?.userResultModel)
                self?.tableView.reloadData()
            }
            Loader.hideLoader(self)
        })
    }
    
    //MARK: Search bar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true
        }

        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchActive = true
        }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;

            searchBar.text = nil
            searchBar.resignFirstResponder()
        }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchActive = true
        searchBar.resignFirstResponder()
        }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.resignFirstResponder()
                    return true
        }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {


            if searchBar.text == nil || searchBar.text == "" {
                searchActive = false
                tableView.reloadData()
            }else { //if searchBar.text!.count > 2
                searchActive = true
                SearchResultModel = userModelContr.filter({ (products) -> Bool in
                    return products.contractName.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                    products.stationName.rawValue.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                           products.unitContractCreator.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil
                    // Add the rest as needed.
                 })
                print(SearchResultModel.count)
                tableView.reloadData()
            }
                
        }
    
}
extension ContractorSLA_VC:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
           return SearchResultModel.count
        }else{
        return userModelContr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractorSLA.identifier, for: indexPath) as? ContractorSLA else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
        if searchActive {
            cell.cellViewModel = SearchResultModel[indexPath.row]
        }else{
        cell.cellViewModel = userModelContr[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
}

//
//  ViewEquipmentVC.swift
//  SMAC
//
//  Created by MAC on 07/09/21.
//

import UIKit
import SideMenuSwift

class ViewEquipmentVC: UIViewController,UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var SearchBarValue:String!
       var searchActive : Bool = false
    
    lazy var viewModelType = {
        ViewEquipmentModel()
    }()
    var userModelEquip = [ResultEquipment]()
    var SearchResultModel = [ResultEquipment]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        self.setNeedsStatusBarAppearanceUpdate()
        self.tableView.register(ViewEquipmentCell.nib, forCellReuseIdentifier: ViewEquipmentCell.identifier)
        // Do any additional setup after loading the view.
        self.ApiCall()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        tableView.reloadData()
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
//        self.navigationController?.popViewController( animated: true)
        self.sideMenuController?.revealMenu()

    }

    // MARK: - Navigation

    func ApiCall(){
        let jsons = ViewEquipmentRequestModel.init(id: "", type: "EQUIPMENT_LIST")
        viewModelType.API_getEquipmentList(json: jsons, dataValue: {
            responseSorces in
            print(responseSorces?.result)
            Loader.hideLoader(self)
            self.userModelEquip = responseSorces?.result ?? []
            print(self.userModelEquip.count)
            self.tableView.reloadData()
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
                SearchResultModel = userModelEquip.filter({ (products) -> Bool in
                    return products.name?.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                    products.eqptDescr?.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                           products.eqptID.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil
                    // Add the rest as needed.
                 })
                print(SearchResultModel.count)
                tableView.reloadData()
            }
                
        }

}

extension ViewEquipmentVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return SearchResultModel.count
        }else{
        return userModelEquip.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewEquipmentCell.identifier, for: indexPath) as? ViewEquipmentCell else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
        if searchActive {
            cell.cellViewModel = SearchResultModel[indexPath.row]
        }else{
        cell.cellViewModel = userModelEquip[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
    
}

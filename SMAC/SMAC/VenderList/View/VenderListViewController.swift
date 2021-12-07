//
//  VenderListViewController.swift
//  SMAC
//
//  Created by MAC on 15/09/21.
//

import UIKit
import SideMenuSwift

class VenderListViewController: UIViewController,UISearchBarDelegate {
    @IBOutlet weak var tableview:UITableView!
    @IBOutlet weak var testbar: UISearchBar!
    var SearchBarValue:String!
       var searchActive : Bool = false
    lazy var viewModelType = {
        VendorListModel()
    }()
    
    var userModel = [User]()
    var searchUserModel = [ResultVendor]()
    var userModelvendor = [ResultVendor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        tableview.register(VenderListCell.nib, forCellReuseIdentifier: VenderListCell.identifier)
        Loader.showLoader("Downloading Details...", target: self)
//        fetchAPI_VenderList()
//        self.searchBar.delegate = self

        API_fetchAllvendor()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
//        self.navigationController?.popViewController( animated: true)
        self.sideMenuController?.revealMenu()

    }
   
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        tableview.reloadData()
        tableview.setNeedsLayout()
        tableview.layoutIfNeeded()
        tableview.reloadData()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func fetchAPI_VenderList(){
        viewModelType.getVendorList(json: ViewVendorRequestModel.init(id: ""), dataValue: { [self]
            response in
            print(response?.users)
            Loader.hideLoader(self)
            print("userModel==",userModel.count)
            userModel = response?.users ?? []
            self.tableview.reloadData()
            Loader.hideLoader(self)
        })
    }
    
    func API_fetchAllvendor(){
        viewModelType.API_getViewAllTicketsWithComboVendor(json: RoleJsonDictionary.init(id: "", type: "VENDOR_BY_ID"), data: { [weak self]
            (result,resultBool) in
            if resultBool == true{
//                print(response?.result.count)
                let dataResult = result?.result ?? []
                for items in dataResult{
                    self?.userModelvendor.append(items)
                }
                Loader.hideLoader(self)

                self?.tableview.reloadData()
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
//            self.tableView.reloadData()
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

//                self.searchActive = true;
//                self.searchBar.showsCancelButton = true

            if searchBar.text == nil || searchBar.text == "" {
                searchActive = false
                tableview.reloadData()
            }else { //if searchBar.text!.count > 2
                searchActive = true
//                searchUserModel = userModelvendor.filter({ value -> Bool in
////                    guard let text = searchText else { return false }
//                    return ((value.contactNo?.localizedLowercase.contains(searchText.localizedLowercase)) != nil)
//                })
//                searchUserModel = userModelvendor.filter({( item : ResultVendor) -> Bool in
//                    return  item.contactNo!.lowercased().contains(searchText.lowercased())
//                })
                searchUserModel = userModelvendor.filter({ (products) -> Bool in
                    return products.name.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                    products.contactNo?.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                           products.address.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil
                    // Add the rest as needed.
                 })
                print(searchUserModel.count)
                tableview.reloadData()
            }
                   


        }
}

extension VenderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return userModel.count
//        return userModelvendor.count
        if searchActive {
            return searchUserModel.count
        }else{
            return userModelvendor.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VenderListCell.identifier, for: indexPath) as? VenderListCell else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
//        cell.cellViewModel = userModel[indexPath.row]
        if searchActive {
            cell.cellViewModel = searchUserModel[indexPath.row]

        }else {
        cell.cellViewModel = userModelvendor[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
}

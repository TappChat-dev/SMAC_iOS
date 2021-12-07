//
//  ViewTicketsViewController.swift
//  SMAC
//
//  Created by MAC on 12/08/21.
//

import UIKit
import SideMenuSwift

class ViewTicketsViewController: UIViewController,ViewTicketCellDelegate,UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var segmentOption:UISegmentedControl!
    @IBOutlet weak var testbar: UISearchBar!
    var SearchBarValue:String!
       var searchActive : Bool = false
    lazy var viewModels = {
        VCViewModel()
    }()
    
    var userResultModel = [ResultTickets]()
    var SearchResultModel = [ResultTickets]()


    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        self.setNeedsStatusBarAppearanceUpdate()

//        let attr = NSDictionary(object: UIFont(name: "HelveticaNeue", size: 20.0)!, forKey: NSAttributedString.Key.font as NSCopying)
//        self.segmentOption.setTitleTextAttributes(attr as? [NSAttributedString.Key : Any], for: .normal)
        
        let font = UIFont.systemFont(ofSize: 17)

        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.gray]
        self.segmentOption.setTitleTextAttributes(normalAttribute, for: .normal)

//           let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.red]
//        self.segmentOption.setTitleTextAttributes(selectedAttribute, for: .selected)
        
        self.segmentOption.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.segmentOption.setTitleTextAttributes([.foregroundColor: UIColor.init(rgb: 0x06284D)], for: .selected)
        tableView.register(ViewTicketCell.nib, forCellReuseIdentifier: ViewTicketCell.identifier)
//        initViewModel()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
//        tableView.reloadData()
//        tableView.setNeedsLayout()
//        tableView.layoutIfNeeded()
//        tableView.reloadData()
        if (self.userResultModel.count) > 0 {
            self.userResultModel = []
        }
        getTicketUsingCOmbo()

    }
    
    @IBAction func tapTomenu(_ sender:Any){
        
    }
    
    func initViewModel() {
        // Get employees data
        guard let unit =  UserDefaults.standard.string(forKey: "unit") else { return print("unit id is not find.") }
//012345 , 000227
        viewModels.API_getViewAllTickets(json: ViewTicketJsonModel.init(id: "", unitID: unit), data: { [weak self]
            response,status  in
//            print(response!)
            if status == true{
                // Reload TableView closure
//                self.viewModels.reloadTableView = { [weak self] in
//                    DispatchQueue.main.async {
//                        self?.tableView.reloadData()
//                    }
//                }
                print(response?.result.count)
//                self?.userResultModel = response?.result ?? []
                let dataResult = response?.result ?? []
                for items in dataResult{
//                    self?.userResultModel.append(items as [String : Any])
                    self?.userResultModel.append(items)

                }
//                self?.userResultModel
                print(self?.userResultModel)
                self?.tableView.reloadData()
            }
        })
        
       
    }

    func getTicketUsingCOmbo(){
        guard let techID =  UserDefaults.standard.string(forKey: "TechID") else { return print("unit id is not find.") }
        Loader.showLoader("Getting all tickets...", target: self)

        viewModels.API_getViewAllTicketsWithCombo(json: RoleJsonDictionary.init(id: techID, type: "TICKET_BY_PID"), data: { [weak self]
            response,status  in
            if status == true{
//                print(response?.result.count)
                let dataResult = response?.result ?? []
                for items in dataResult{
                    self?.userResultModel.append(items)
                }
                Loader.hideLoader(self)

//                print(self?.userResultModel)
                self?.tableView.reloadData()
            }
            Loader.hideLoader(self)
        })
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
//        self.navigationController?.popViewController( animated: true)
        self.sideMenuController?.revealMenu()
    }
    
    func didPressButton(_ tag: Int) {
        print(tag)
        var data : ResultTickets? = nil
        if searchActive {
            data = SearchResultModel[tag]
        }else{
            data = userResultModel[tag]
        }
//        let data = userResultModel[tag]
        roleID =  UserDefaults.standard.string(forKey: "isLoginRoleID")!

        if roleID == "SE" {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SEUpdateTicketVC") as! SEUpdateTicketVC
            nextViewController.userResultUpdateModel = data
                navigationController?.pushViewController(nextViewController, animated: true)
        }else{
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "UpdateTicketViewController") as! UpdateTicketViewController
        nextViewController.userResultUpdateModel = data
            navigationController?.pushViewController(nextViewController, animated: true)
            
        }
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
                SearchResultModel = userResultModel.filter({ (products) -> Bool in
                    return products.contractName.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                    products.unitName.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil ||
                           products.subject.range(of: searchText, options: [ .caseInsensitive, .diacriticInsensitive ]) != nil
                    // Add the rest as needed.
                 })
                print(SearchResultModel.count)
                tableView.reloadData()
            }
                   


        }
}

extension ViewTicketsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return SearchResultModel.count
        }else{
        return userResultModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewTicketCell.identifier, for: indexPath) as? ViewTicketCell else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
        cell.cellDelegate = self
        cell.btnEdit.tag = indexPath.row
//        let cellVM = viewModels.getCellViewModel(at: indexPath)
        if searchActive {
            cell.cellViewModel = SearchResultModel[indexPath.row]
        }else{
            cell.cellViewModel = userResultModel[indexPath.row]
            
        }
//        cell.cellViewModelDic = userResultModel[indexPath.row]
//        let data = userResultModel[indexPath.row]
//        let ticketID = data["TICKET_ID"] as? String
//        let CONTRACT_NAME = data["CONTRACT_NAME"] as? String
//        let EQPT_TYPE = data["EQPT_TYPE"] as? String
//        let EQUIPMENT_NAME = data["EQUIPMENT_NAME"] as? String
//        cell.loadCellData(with: ticketID ?? "", equipmentName: EQUIPMENT_NAME ?? "", contractName: CONTRACT_NAME ?? "", eqptType: EQPT_TYPE ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = userResultModel[indexPath.row]
        print("Selected Cell Data",data)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 230.0
//    }
}

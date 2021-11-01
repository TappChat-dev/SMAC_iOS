//
//  ContractorSLA_VC.swift
//  SMAC
//
//  Created by MAC on 21/09/21.
//

import UIKit

class ContractorSLA_VC: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    var userModel = [GetContractJsonModel]()
    lazy var viewModelType = {
        CreateTicketViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)

        self.tableView.register(ContractorSLA.nib, forCellReuseIdentifier: ContractorSLA.identifier)
        if userModel.count > 0 {
            self.tableView.reloadData()
        }else{
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
        self.navigationController?.popViewController( animated: true)
    }
    //MARK:- API Call
    func getContract(){
        viewModelType.getContract_API(json: jsonDictionaryForGetContract.init(id: ""), data: {
            response in
            print("6th APi")
            DispatchQueue.main.async {
                var firstitem: Bool = false
                if  response.count > 0{
                    Loader.hideLoader(self)
                    self.userModel = response
                    self.tableView.reloadData()
//                    for id in response {
//
//                    }
                }else{
                    Loader.hideLoader(self)
                    Utility().addAlertView("Alert!", "Something is wrong", "OK", self)
                }
            }
        })
    }
}
extension ContractorSLA_VC:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractorSLA.identifier, for: indexPath) as? ContractorSLA else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = userModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
}

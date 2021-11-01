//
//  VenderListViewController.swift
//  SMAC
//
//  Created by MAC on 15/09/21.
//

import UIKit

class VenderListViewController: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    
    lazy var viewModelType = {
        VendorListModel()
    }()
    
    var userModel = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        tableview.register(VenderListCell.nib, forCellReuseIdentifier: VenderListCell.identifier)
        Loader.showLoader("Downloading Details...", target: self)
        fetchAPI_VenderList()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
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
        viewModelType.getVendorList(json: [:], dataValue: { [self]
            response in
            print(response.users)
            Loader.hideLoader(self)
            print("userModel==",userModel)
            userModel = response.users
            self.tableview.reloadData()
        })
    }
}

extension VenderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VenderListCell.identifier, for: indexPath) as? VenderListCell else { fatalError("xib does not exists") }
//        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = userModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
    }
}

//
//  ContractorSLA_VC.swift
//  SMAC
//
//  Created by MAC on 21/09/21.
//

import UIKit

class ContractorSLA_VC: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ContractorSLA.nib, forCellReuseIdentifier: ContractorSLA.identifier)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        tableView.reloadData()
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }
   

}
extension ContractorSLA_VC:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContractorSLA.identifier, for: indexPath) as? ContractorSLA else { fatalError("xib does not exists") }
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
//        cell.cellViewModel = cellVM
        return cell
    }
}

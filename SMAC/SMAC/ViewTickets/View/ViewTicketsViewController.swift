//
//  ViewTicketsViewController.swift
//  SMAC
//
//  Created by MAC on 12/08/21.
//

import UIKit

class ViewTicketsViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    lazy var viewModel = {
        VCViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    func initViewModel() {
        // Get employees data
        viewModel.getEmployees()
        
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewTicketsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewTicketCell.identifier, for: indexPath) as? ViewTicketCell else { fatalError("xib does not exists") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
    
    
}
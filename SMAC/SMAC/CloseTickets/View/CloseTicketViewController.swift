//
//  CloseTicketViewController.swift
//  SMAC
//
//  Created by MAC on 19/08/21.
//

import UIKit

class CloseTicketViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var btnBack:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CloseTicketTableCell.closenib, forCellReuseIdentifier: CloseTicketTableCell.closeidentifier)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
   

}

extension CloseTicketViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CloseTicketTableCell.closeidentifier, for: indexPath) as? CloseTicketTableCell else { fatalError("xib does not exists") }
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
//        cell.cellViewModel = cellVM
        return cell
    }
    
    
}

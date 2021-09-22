//
//  VenderListViewController.swift
//  SMAC
//
//  Created by MAC on 15/09/21.
//

import UIKit

class VenderListViewController: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(VenderListCell.nib, forCellReuseIdentifier: VenderListCell.identifier)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
   

}

extension VenderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VenderListCell.identifier, for: indexPath) as? VenderListCell else { fatalError("xib does not exists") }
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
//        cell.cellViewModel = cellVM
        return cell
    }
    

}

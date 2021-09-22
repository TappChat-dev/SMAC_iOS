//
//  SLAViewController.swift
//  SMAC
//
//  Created by MAC on 14/09/21.
//

import UIKit

class SLAListViewController: UIViewController {
    @IBOutlet weak var tableview:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.register(SLAViewCell.nib, forCellReuseIdentifier: SLAViewCell.identifier)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        tableview.reloadData()
        tableview.setNeedsLayout()
        tableview.layoutIfNeeded()
        tableview.reloadData()
    }
}

// MARK: - Table View Delegate
extension SLAListViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfSwction section: Int) -> Int{
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SLAViewCell.identifier, for: indexPath) as? SLAViewCell else { fatalError("xib does not exists") }
        cell.addShadow(backgroundColor: .white, cornerRadius: 13, shadowRadius: 5, shadowOpacity: 0.1, shadowPathInset: (dx: 8, dy: 6), shadowPathOffset: (dx: 0, dy: 2))
//        let cellVM = viewModel.getCellViewModel(at: indexPath)
//        cell.cellViewModel = cellVM
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SLAViewController") as! SLAViewController
            navigationController?.pushViewController(nextViewController, animated: true)

    }
}


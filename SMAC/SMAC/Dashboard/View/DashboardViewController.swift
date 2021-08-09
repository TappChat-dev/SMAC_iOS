//
//  DashboardViewController.swift
//  SMAC
//
//  Created by MAC on 05/08/21.
//

import UIKit
import Foundation

class DashboardViewController: UIViewController {
//    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var collectionView:UICollectionView!
    var dashBordType = ""
    var dashBordItemArray = [String]()
    let customFlowLayout = CustomFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(DashboardTVCell.nib, forCellReuseIdentifier: DashboardTVCell.identifier)
        dashBordType = kDASHBORDTYPE_EQUIPMENTMANAGER
        
        dashBordItemArray = [kCREATE_TICKET, kVIEW_TICKET, kCONTRACTORS]
        customFlowLayout.sectionInsetReference = .fromContentInset // .fromContentInset is default
                customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                customFlowLayout.minimumInteritemSpacing = 10
                customFlowLayout.minimumLineSpacing = 10
                customFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
                customFlowLayout.headerReferenceSize = CGSize(width: 0, height: 40)

                collectionView.collectionViewLayout = customFlowLayout
                collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(DashboardCVCell.CVnib, forCellWithReuseIdentifier: DashboardCVCell.CVidentifier)
        // Do any additional setup after loading the view.
    }
    

    /*
    

   
    */
    @IBAction func menuButtonDidClicked(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
}




// MARK: - Collection View
extension DashboardViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashBordItemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCVCell.CVidentifier, for: indexPath)  as? DashboardCVCell else {
            fatalError("xib does not exists")
        }
        cell.moduleName.text = "\(dashBordItemArray[indexPath.row])"
        if  cell.moduleName.text == kCREATE_TICKET  {
            cell.moduleCount.text == "0"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (dashBordItemArray[indexPath.row] == kCREATE_TICKET){
            let vc3 = UIStoryboard.init(name: "SideMenuMain", bundle: Bundle.main).instantiateViewController(withIdentifier: "TicketDetailViewController") as? TicketDetailViewController
            self.navigationController?.pushViewController(vc3!, animated: true)
           
        }
    }
    
}

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
    
    let customFlowLayout = CustomFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(DashboardTVCell.nib, forCellReuseIdentifier: DashboardTVCell.identifier)
        
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
  
}

// MARK: - TableView
/*
extension DashboardViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardTVCell.identifier, for: indexPath) as? DashboardTVCell else { fatalError("xib does not exists") }
        return cell
    }
    
    
}
*/

// MARK: - Collection View
extension DashboardViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCVCell.CVidentifier, for: indexPath)  as? DashboardCVCell else {
            fatalError("xib does not exists")
        }
        
        return cell
    }
    
    
}

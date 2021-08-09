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
    @IBOutlet weak var btnMenu:UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var isDarkModeEnabled = false
    var themeColor = UIColor.white
    let statusBarBehaviors: [SideMenuController.Preferences.StatusBarBehavior] = [.none, .slide, .fade, .hideOnMenu]
    let menuPosition: [SideMenuController.Preferences.MenuPosition] = [.above, .under, .sideBySide]
    let menuDirections: [SideMenuController.Preferences.MenuDirection] = [.left, .right]
    let menuOrientation: [UIInterfaceOrientationMask] = [.portrait, .allButUpsideDown]
    let customFlowLayout = CustomFlowLayout()
    let totalArray = ["Create Ticket", "View Ticket", "Contractor"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(DashboardTVCell.nib, forCellReuseIdentifier: DashboardTVCell.identifier)
        
       
        collectionView.register(DashboardCVCell.CVnib, forCellWithReuseIdentifier: DashboardCVCell.CVidentifier)
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {

        if isDarkModeEnabled {
            themeColor = .mirage

            
            
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = .lobolly
            navigationController?.navigationBar.barTintColor = .mirage
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        } else {
            themeColor = .white
        }

        view.backgroundColor = themeColor
        containerView.backgroundColor = themeColor

        let preferences = SideMenuController.preferences.basic
        guard let behaviorIndex = statusBarBehaviors.firstIndex(of: preferences.statusBarBehavior) else {
            fatalError("Configuration is messed up")
        }
//        statusBarBehaviorSegment.selectedSegmentIndex = behaviorIndex
//
//        guard let menuPositionIndex = menuPosition.firstIndex(of: preferences.position) else {
//            fatalError("Configuration is messed up")
//        }
//        menuPositionSegment.selectedSegmentIndex = menuPositionIndex
//
//        guard let menuDirectionIndex = menuDirections.firstIndex(of: preferences.direction) else {
//            fatalError("Configuration is messed up")
//        }
//        menuDirectionSegment.selectedSegmentIndex = menuDirectionIndex
//
//        guard let menuOrientationIndex = menuOrientation.firstIndex(of: preferences.supportedOrientations)else {
//            fatalError("Configuration is messed up")
//        }
//        orientationSegment.selectedSegmentIndex = menuOrientationIndex
    }
  
    func ConfigureCollectionUI(){
        customFlowLayout.sectionInsetReference = .fromContentInset // .fromContentInset is default
                customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                customFlowLayout.minimumInteritemSpacing = 10
                customFlowLayout.minimumLineSpacing = 20
                customFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
//                customFlowLayout.headerReferenceSize = CGSize(width: 0, height: 40)

                collectionView.collectionViewLayout = customFlowLayout
                collectionView.contentInsetAdjustmentBehavior = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ConfigureCollectionUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func tapToMenu(_ sender:UIButton){
        sideMenuController?.revealMenu()
    }
}

extension DashboardViewController{
    
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
extension DashboardViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCVCell.CVidentifier, for: indexPath)  as? DashboardCVCell else {
            fatalError("xib does not exists")
        }
        cell.moduleName.text = totalArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidth: CGFloat = flowLayout.itemSize.width
        let cellHieght: CGFloat = flowLayout.itemSize.height
        let cellSpacing: CGFloat = flowLayout.minimumInteritemSpacing
        let cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
        var collectionWidth = collectionView.frame.size.width
        var collectionHeight = collectionView.frame.size.height
        if #available(iOS 11.0, *) {
            collectionWidth -= collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
            collectionHeight -= collectionView.safeAreaInsets.top + collectionView.safeAreaInsets.bottom
        }
        let totalWidth = cellWidth * cellCount + cellSpacing * (cellCount - 1)
        let totalHieght = cellHieght * cellCount + cellSpacing * (cellCount - 1)
        var cellStrartFrom:CGFloat = 0.0
                if cellCount == 1 {
                    cellStrartFrom = CGFloat(collectionHeight/2) - 10
                }else{
                    cellStrartFrom = CGFloat(collectionHeight/cellCount) -  cellCount*8
                }
        
        if totalWidth <= collectionWidth {
            let edgeInsetWidth = (collectionWidth - totalWidth) / 2

            print(edgeInsetWidth, edgeInsetWidth)
            return UIEdgeInsets(top: cellStrartFrom, left: edgeInsetWidth, bottom: flowLayout.sectionInset.top, right: edgeInsetWidth)
        } else {
            let edgeInsetHieght = (collectionHeight - totalHieght) / 2
            print(edgeInsetHieght, edgeInsetHieght)
            return UIEdgeInsets(top: edgeInsetHieght, left: flowLayout.sectionInset.top, bottom: edgeInsetHieght, right: flowLayout.sectionInset.top)

        }
    }
}

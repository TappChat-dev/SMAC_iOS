//
//  DashboardViewController.swift
//  SMAC
//
//  Created by MAC on 05/08/21.
//

import UIKit
import Foundation
import SideMenuSwift
import Charts

var roleID:String = ""
var roleDescp:String = ""
class DashboardViewController: UIViewController, SideMenuControllerDelegate {
//    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var btnMenu:UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var pieChartView: PieChartView!

    var menuDelegate: MenuDelegate?
    
    var isDarkModeEnabled = false
    var themeColor = UIColor.white
    let statusBarBehaviors: [SideMenuController.Preferences.StatusBarBehavior] = [.none, .slide, .fade, .hideOnMenu]
    let menuPosition: [SideMenuController.Preferences.MenuPosition] = [.above, .under, .sideBySide]
    let menuDirections: [SideMenuController.Preferences.MenuDirection] = [.left, .right]
    let menuOrientation: [UIInterfaceOrientationMask] = [.portrait, .allButUpsideDown]
    let customFlowLayout = CustomFlowLayout()
//    let totalArray = ["Create Ticket", "View Ticket","Close Ticket", "Contractor"]
//    let totalArray = ["Create Ticket", "View Ticket","Close Ticket", "Contractor", "List SLA", "Add Equipment","List Vender"]
//    let totalSDMICG = ["Create Ticket", "View Ticket","Close Ticket","View Contract","View Vender","View Equipment"]
    let totalSDMICG = ["Create Ticket", "View Ticket","View Contract","View Vender","View Equipment"]
    let arrSDMVender = ["Create Ticket","Assign Ticket","View Ticket","View Contract","View Equipment"]
    let arrEquipmentUser = ["Create Ticket","View Ticket","View Contract","View Equipment","View Vender"]
    let arrServiceEng = ["View Ticket","View Contract","View Equipment"]

    var totalArrayRole = [String]()
    
    var players : [String]? = []
    var goals : [Double]? = []
    
    lazy var viewModelType = {
        DashboardViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

//        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D) //06284D
//        tableView.register(DashboardTVCell.nib, forCellReuseIdentifier: DashboardTVCell.identifier)
        isDarkModeEnabled = SideMenuController.preferences.basic.position == .under
        sideMenuController?.delegate = self
        configureUI()
        collectionView?.register(DashboardCVCell.CVnib, forCellWithReuseIdentifier: DashboardCVCell.CVidentifier)
        roleID =  UserDefaults.standard.string(forKey: "isLoginRoleID")!
        //Assign User Role
        if roleID == "DM" {// non-icg service desk manager //"R09"
            totalArrayRole = arrSDMVender
        }else if (roleID == "SD"){ // icg service desk manager //"R04"
            totalArrayRole = totalSDMICG
        }else if (roleID == "SE"){ // non-icg service engineer //"R05"
            totalArrayRole = arrServiceEng
        }else if (roleID == "EU"){ // icg Eqipment user //"R08"
            totalArrayRole = arrEquipmentUser
        }
        customizeChart(dataPoints: players ?? [], values: goals.map{ $0 } as! [Double])

        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func configureUI() {
        
        if isDarkModeEnabled {
           
         
         
            navigationController?.navigationBar.isTranslucent = false
          
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        } else {
            themeColor = .white
        }

        view.backgroundColor = themeColor
     

        let preferences = SideMenuController.preferences.basic
        guard let behaviorIndex = statusBarBehaviors.firstIndex(of: preferences.statusBarBehavior) else {
            fatalError("Configuration is messed up")
        }
      

        guard let menuPositionIndex = menuPosition.firstIndex(of: preferences.position) else {
            fatalError("Configuration is messed up")
        }
     

        guard let menuDirectionIndex = menuDirections.firstIndex(of: preferences.direction) else {
            fatalError("Configuration is messed up")
        }
     

        guard let menuOrientationIndex = menuOrientation.firstIndex(of: preferences.supportedOrientations)else {
            fatalError("Configuration is messed up")
        }
    
    }
  
    func ConfigureCollectionUI(){
        customFlowLayout.sectionInsetReference = .fromContentInset // .fromContentInset is default
                customFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
                customFlowLayout.minimumInteritemSpacing = 10
                customFlowLayout.minimumLineSpacing = 20
                customFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
//                customFlowLayout.headerReferenceSize = CGSize(width: 0, height: 40)

                collectionView?.collectionViewLayout = customFlowLayout
                collectionView?.contentInsetAdjustmentBehavior = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D) 

        ConfigureCollectionUI()
        API_Dashboard()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func tapToMenu(_ sender:UIButton){
        self.sideMenuController?.revealMenu()

//        sideMenuController?.revealMenu()
//        menuDelegate?.menuHandler(index: -1)
        
    }
    @IBAction func tapToCreateTicket(_ sender:Any){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let TC = storyboard.instantiateViewController(withIdentifier: "CreateTicketsViewController") as? CreateTicketsViewController
            self.navigationController?.pushViewController(TC!, animated: true)
    }
    
        //MARK: Pie Charts
    func customizeChart(dataPoints: [String], values: [Double]) {
      
      // 1. Set ChartDataEntry
      var dataEntries: [ChartDataEntry] = []
        if values.count > 0 {
      for i in 0..<dataPoints.count {
        let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data:  dataPoints[i] as AnyObject)
        dataEntries.append(dataEntry)
      }
        }
      // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
      pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
      
      // 3. Set ChartData
      let pieChartData = PieChartData(dataSet: pieChartDataSet)
      let format = NumberFormatter()
      format.numberStyle = .none
      let formatter = DefaultValueFormatter(formatter: format)
      pieChartData.setValueFormatter(formatter)
      
      // 4. Assign it to the chart's data
      pieChartView.data = pieChartData
    }
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }
    
    //MARK: API Dashboard Count
    func API_Dashboard(){
        guard let techID =  UserDefaults.standard.string(forKey: "TechID") else { return print("unit id is not find.") }
        
        viewModelType.getDashboard_Count(json: DashboardJsonDictionary.init(id: techID), data: {result in
            print(result)
            let status = result["STATUS"] as? String
            let msg = result["msg"] as? String
            if status == "Success" {
                let TICKETS_ALL = result["P_TICKETS_ALL"] as? NSNumber
                let InProgress = result["P_TICKETS_INPROGRESS"] as? NSNumber

                let Closed = result["P_TICKETS_CLOSED"] as? NSNumber
                self.players = ["AllTickets", "InProgress", "Close"]
                if TICKETS_ALL?.rangeValue.length ?? -1 >= 0 || InProgress?.rangeValue.length ?? -1 >= 0 || Closed?.rangeValue.length ?? -1 >= 0 {
                    self.goals = [Double(truncating: TICKETS_ALL!),Double(truncating: InProgress!),Double(truncating: Closed!)]

                }
                self.customizeChart(dataPoints: self.players!, values: self.goals.map{ $0 } as! [Double] )

            }
        })
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
       // return arrSDMVender.count //totalSDMICG
        return totalArrayRole.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCVCell.CVidentifier, for: indexPath)  as? DashboardCVCell else {
            fatalError("xib does not exists")
        }
        cell.moduleName.text = totalArrayRole[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){

            print(" selected")
//        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor.gray
        let name = totalArrayRole[indexPath.item].description
       
        if (name == "Create Ticket") {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "CreateTicketsViewController") as? CreateTicketsViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "View Ticket"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "ViewTicketsViewController") as? ViewTicketsViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "Close Ticket"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "CloseTicketViewController") as? CloseTicketViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "Contractor"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "CreateContractViewController") as? CreateContractViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "Add Equipment"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "AddEquipmentViewController") as? AddEquipmentViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "View Contract"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//            let TC = storyboard.instantiateViewController(withIdentifier: "SLAListViewController") as? SLAListViewController
            let TC = storyboard.instantiateViewController(withIdentifier: "ContractorSLA_VC") as? ContractorSLA_VC
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "View Vender"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "VenderListViewController") as? VenderListViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "View Equipment"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "ViewEquipmentVC") as? ViewEquipmentVC
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        if (name == "Assign Ticket"){
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let TC = storyboard.instantiateViewController(withIdentifier: "AssignTicketViewController") as? AssignTicketViewController
                self.navigationController?.pushViewController(TC!, animated: true)
        }
        
        }
    
    
     func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.cellForItem(at: indexPath as IndexPath)?.backgroundColor = UIColor.clear
        

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

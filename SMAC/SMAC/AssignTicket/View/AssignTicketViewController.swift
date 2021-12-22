//
//  AssignTicketViewController.swift
//  SMAC
//
//  Created by MAC on 30/10/21.
//

import UIKit
import SideMenuSwift

class AssignTicketViewController: UIViewController {
    @IBOutlet weak var contractNameTxt: UITextField!
    @IBOutlet weak var unitTxt: UITextField!
    @IBOutlet weak var equipmentNameTxt: UITextField!
    @IBOutlet weak var equipmentTypeTxt: UITextField!
    @IBOutlet weak var serviceTypeTxt: UITextField!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var ticketStatusTxt: UITextField!
    @IBOutlet weak var ticketIDTxt: UITextField!
    @IBOutlet weak var serviceEngTxt: UITextField!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var imageDocumentTxt: UITextField!
    @IBOutlet weak var btnViewImage: UIButton!
    @IBOutlet weak var btnUpdates: UIButton!
    
    lazy var viewModelType = {
        AssignViewModel()
    }()
    
    var arrSerEngName = [String]()
    var arrSerEngID = [String]()
    var arrSerEngMobile = [String]()
    var arrSerEngEmail = [String]()
    var userResultUpdateModel: ResultTickets? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor.init(rgb: 0x06284D)
        
        let contract = userResultUpdateModel?.contractName
        let contractID = userResultUpdateModel?.contractID
        self.contractNameTxt.text = contract
        self.unitTxt.text = ""
        self.equipmentNameTxt.text = userResultUpdateModel?.equipmentName
        self.equipmentTypeTxt.text = ""
        self.titleTxt.text = userResultUpdateModel?.ticketStatus
        self.ticketIDTxt.text = userResultUpdateModel?.ticketID
        self.descriptionTxtView.text = userResultUpdateModel?.descr
        API_GetServiceEngineer(contractID: contractID ?? "")
        
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // MARK: - Navigation
    
    @IBAction func tapToBackButton(_ sender:Any){
        self.navigationController?.popViewController( animated: true)
//        self.sideMenuController?.revealMenu()

    }
    
    @IBAction func tapToViewDocument(_ sender:Any){
        
    }
    
    @IBAction func tapToUpdateTicket(_ sender:Any){
        
    }
    
    func API_GetServiceEngineer(contractID:String){
        viewModelType.API_getServiceEngineerWithComboContractID(json: RoleJsonDictionary.init(id: contractID, type: "SERVICE_ENGINEER_BY_CONTRACT"), data: {(result,resultBool) in
            if let resultData = result {
                print(resultData)
                do{
                    let json = try JSONSerialization.jsonObject(with: resultData, options: []) as? [String : Any]
                    let status = json?["STATUS"] as? String
                    let resultJSON = json?["result"] as? [[String:Any]] ?? []
                    var firstitem: Bool = false

                    for item in resultJSON {
                        let name = item["FIRSTNAME"] as? String
                        let id = item["TECH_ID"] as? String
                        let mobile = item["MOBILE_NO"] as? String
                        let email = item["OFFICIAL_EMAIL"] as? String
                        if firstitem == false {
                            firstitem = true
                            self.arrSerEngName.append("Select")
                            self.arrSerEngID.append("Select")
                            self.arrSerEngEmail.append("Select")
                            self.arrSerEngMobile.append("Select")
                            self.arrSerEngName.append(name!)
                            self.arrSerEngID.append(id!)
                            self.arrSerEngEmail.append(email!)
                            self.arrSerEngMobile.append(mobile!)
                        }else{
                            self.arrSerEngName.append(name!)
                            self.arrSerEngID.append(id!)
                            self.arrSerEngEmail.append(email!)
                            self.arrSerEngMobile.append(mobile!)                        }
                    }
                    
                    if self.arrSerEngName.count > 0 {
                        self.serviceEngTxt.loadDropdownData(data: self.arrSerEngName)
                    }
                }catch{ print("erroMsg") }
            }
        })
    }
}

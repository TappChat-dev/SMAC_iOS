//
//  InitiatePenaltyVC.swift
//  SMAC
//
//  Created by MAC on 17/09/21.
//

import UIKit

class InitiatePenaltyVC: UIViewController {
    @IBOutlet weak var formView:UIView!
    @IBOutlet weak var ticketNoTxt:UITextField!
    @IBOutlet weak var statusTxt:UITextField!
    @IBOutlet weak var maxNACDayTxt:UITextField!
    @IBOutlet weak var reportDateTxt:UITextField!
    @IBOutlet weak var lastUpdateDTtxt:UITextField!
    @IBOutlet weak var nacDatetxt:UITextField!
    @IBOutlet weak var lastRemarkTxt:UITextView!
    @IBOutlet weak var contractorNameTxt:UITextField!
    @IBOutlet weak var contractorTypeTxt:UITextField!
    @IBOutlet weak var costTxt:UITextField!
    @IBOutlet weak var GSTtxt:UITextField!
    @IBOutlet weak var customDutyTxt:UITextField!
    @IBOutlet weak var totalCoastTxt:UITextField!
    @IBOutlet weak var EquipmetTxt:UITextField!
    @IBOutlet weak var serviceTypeTxt:UITextField!
    @IBOutlet weak var typeTxt:UITextField!
    @IBOutlet weak var TypeView:UIView!
    @IBOutlet weak var ViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var btnDate:UIButton!
    @IBOutlet weak var btnSave:UIButton!
    @IBOutlet weak var btnReset:UIButton!
    @IBOutlet weak var btnBack:UIButton!
    var typeOption = [String]()
    var arrayTicketID = [String]()

    var userResultModel = [PeynaltyResult]()

    
    lazy var viewModels = {
        PenaltyViewModel()
    }()
    
    var spareLD = Bundle.main.loadNibNamed("SpareLD", owner: self, options: nil)?.first as! SpareLD
    var serviceProrata = Bundle.main.loadNibNamed("ServiceProrata", owner: self, options: nil)?.first as! ServiceProrata
    var penaltyService = Bundle.main.loadNibNamed("PenaltyService", owner: self, options: nil)?.first as! PenaltyService
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewHeightConstraint.constant = 0
        TypeView.isHidden = true
        let service = ["Select", "Service","Spare"]
         typeOption = ["Select", "LD","Prorata"]
        let dropDownBtn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn1.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        ticketNoTxt.rightViewMode = UITextField.ViewMode.always
        ticketNoTxt.rightView = dropDownBtn1
        
        let dropDownBtn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn2.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        typeTxt.rightViewMode = UITextField.ViewMode.always
        typeTxt.rightView = dropDownBtn2
        
        let dropDownBtn5 = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dropDownBtn5.setBackgroundImage(UIImage(named: "fill_downArrow_small.png"), for: UIControl.State.normal)
        serviceTypeTxt.rightViewMode = UITextField.ViewMode.always
        serviceTypeTxt.rightView = dropDownBtn5
        serviceTypeTxt.loadDropdownData(data: service)
        typeTxt.loadDropdownData(data: typeOption)
        // Do any additional setup after loading the view.
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTicketUsingCOmbo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func setupViews() {
        self.spareLD.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 635 , width: UIScreen.main.bounds.width, height:645 )
        self.serviceProrata.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 635 , width: UIScreen.main.bounds.width, height:645 )
        self.penaltyService.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 635 , width: UIScreen.main.bounds.width, height:645 )
    }

    
    // MARK: - Back Button
    @IBAction func tapToBackButton(_ sender:Any){
//        self.navigationController?.popViewController( animated: true)
        self.sideMenuController?.revealMenu()

    }
    
    // MARK: - Save data

    @IBAction func tapToSave(_ sender:Any){
        
    }
   
    @IBAction func tapToReset(_ sender: Any){
//        contractorNametxt.text = ""
//        organizationNametxt.text = ""
//        productNametxt.text = ""
//        ticketIDtxt.text = ""
//        penaltyAmounttxt.text = ""
    }

    func SelectServiceType(type:String){
        
    }
    
    func getTicketUsingCOmbo(){
        guard let techID =  UserDefaults.standard.string(forKey: "TechID") else { return print("unit id is not find.") }
        Loader.showLoader("Getting all tickets...", target: self)

        viewModels.API_Get_PenaltyWithCombo(json: RoleJsonDictionary.init(id: techID, type: "TICKET_BY_PID"), data: { [weak self]
            response,status  in
            if status == true{
                print("Penalty count",response?.result.count as Any)
                let dataResult = response?.result ?? []
                var firstitem: Bool = false
                if  response?.result.count ?? 0 > 0{
                for items in response!.result{
                    self?.userResultModel.append(items)
                    if firstitem == false {
                        firstitem = true
                        self?.arrayTicketID.append("Select")
                        self?.arrayTicketID.append(items.ticketID)
                    }else{
                    self?.arrayTicketID.append(items.ticketID)
                    }
                }
                Loader.hideLoader(self)
                if (self?.arrayTicketID.count)! > 0 {
                    self?.ticketNoTxt.loadDropdownData(data: self!.arrayTicketID)
                }
                }
            }
            Loader.hideLoader(self)
        })
    }
    
    func getTicketDetailsUsingCOmbo(id:String){
       

        viewModels.API_Get_OtherPenaltyWithCombo(json: RoleJsonDictionary.init(id: id, type: "INITIATE_PANELTY"), data: { [weak self]
            response,status  in
            if status == true{
                print("Penalty count",response?.result.count as Any)
                let dataResult = response?.result ?? []
                if  response?.result.count ?? 0 > 0{
                    let alldata = response!.result[0]
                    self?.statusTxt.text = alldata.ticketStatus
                    self?.maxNACDayTxt.text = ""
                    self?.reportDateTxt.text = alldata.ticketGeneratedDate
                    self?.lastUpdateDTtxt.text = alldata.lastUpdate
                    self?.nacDatetxt.text = ""
                    if let str = alldata.lastRemark as? String {
                        self?.lastRemarkTxt.text = str
                    }else{
                        self?.lastRemarkTxt.text = alldata.lastRemark as? String
                    }
                    self?.contractorNameTxt.text = alldata.contractName
                    self?.contractorTypeTxt.text = alldata.contractType
                    self?.costTxt.text = alldata.contractCost
                    self?.GSTtxt.text = alldata.contractGst
                    self?.customDutyTxt.text = String(alldata.customDuty)
                    self?.totalCoastTxt.text = alldata.totalContractCost
                    self?.EquipmetTxt.text = alldata.equipmentName
//                for items in response!.result{
//                    self?.userResultModel.append(items)
//
//                }
              
                }
            }
            Loader.hideLoader(self)
        })
    }
    func animateViewDown_spareLD(completion:(() -> Void)?) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.spareLD.frame.origin.y = self.view.bounds.height
//            self.loginWithOTP.isHidden = false
//            self.loginWithOTP.alpha = 1
//            self.loginWithOTP.isUserInteractionEnabled = true

            self.view.layoutIfNeeded()
            }, completion: { _ in
                self.spareLD.removeFromSuperview()
                
                completion?()
        })
    }
    
    func animateViewDown_serviceProrata(completion:(() -> Void)?) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.serviceProrata.frame.origin.y = self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: { _ in
                self.serviceProrata.removeFromSuperview()
                
                completion?()
        })
    }
    
    func animateViewDown_penaltyService(completion:(() -> Void)?) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.penaltyService.frame.origin.y = self.view.bounds.height
            self.view.layoutIfNeeded()
            }, completion: { _ in
                self.penaltyService.removeFromSuperview()
                
                completion?()
        })
    }
    
    //MARK:- Animated View
    func animateViewUp_spareLD() {
        UIView.animate(withDuration: 1.0, delay: 1, options: [.curveLinear], animations: {
            self.spareLD.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.view.layoutIfNeeded()
        }, completion:nil)
//        spareLD.viewOtps.addSubview(otpStackView)
        self.view.addSubview(spareLD)
//        self.view.insertSubview(otpView, aboveSubview: backContainerView)
    }
    
    func animateViewUp_serviceProrata() {
        UIView.animate(withDuration: 1.0, delay: 1, options: [.curveLinear], animations: {
            self.serviceProrata.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.view.layoutIfNeeded()
        }, completion:nil)
        self.view.addSubview(serviceProrata)
    }
    
    func animateViewUp_penaltyService() {
        UIView.animate(withDuration: 1.0, delay: 1, options: [.curveLinear], animations: {
            self.penaltyService.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.view.layoutIfNeeded()
        }, completion:nil)
        self.view.addSubview(penaltyService)
    }
    
    func appearOTPView(type:Int){
//        loginWithOTP.isUserInteractionEnabled = false
//        loginWithOTP.alpha = 1
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
                       animations: {
//                        self.loginWithOTP.alpha = 0
        }, completion: { _ in
//            self.loginWithOTP.isHidden = true
            proceed()
        })
        
        func proceed() {
            if type == 1 {
                spareLD.transform = CGAffineTransform(translationX: 0, y: 645)
                self.spareLD.btnCalculate.addTarget(self, action: #selector(self.calculate), for: .touchUpInside)

                
                animateViewUp_spareLD()
            }else if type == 2{
                serviceProrata.transform = CGAffineTransform(translationX: 0, y: 645)
                self.serviceProrata.btnVariefy.addTarget(self, action: #selector(self.calculateServiceProrata), for: .touchUpInside)
                let dataQuarter = ["89","90","91","92"]
                self.serviceProrata.dayQuarterTxt.loadDropdownData(data: dataQuarter)

                
                animateViewUp_serviceProrata()
            }else if type == 3{
                penaltyService.transform = CGAffineTransform(translationX: 0, y: 645)
                self.penaltyService.btnVariefy.addTarget(self, action: #selector(self.calculateServicePenalty), for: .touchUpInside)

                
                animateViewUp_penaltyService()
            }
            
        }
        
    }
    
    
    @objc func calculate(){
        let data = Float(Double(spareLD.spareCostTtxt.text!)!) * Float(Double(spareLD.totalDelayTxt.text!)!)  * Float(Double(spareLD.ldRateTxt.text!)!) / 100
        let payble = spareLD.payablePaynltyTxt.text?.toDouble()
        let maxLD = spareLD.maximumLDTxt.text?.toDouble()
        if data > Float(maxLD!) {
            spareLD.payablePaynltyTxt.text = spareLD.maximumLDTxt.text
        }else{
        spareLD.payablePaynltyTxt.text = String(data)
        }
    }
    @objc func calculateServicePenalty(){
        if penaltyService.totalDelayTxt.text != nil && penaltyService.totalDelayTxt.text != "" && penaltyService.ldRateTxt.text != nil && penaltyService.ldRateTxt.text != nil {
            let data = Float(Double(penaltyService.basicUnittxt.text!)!) * Float(Double(penaltyService.totalDelayTxt.text!)!)  * Float(Double(penaltyService.ldRateTxt.text!)!) / 100
            let payble = penaltyService.payablePaynltyTxt.text?.toDouble()
            let maxLD = penaltyService.maximumLDTxt.text?.toDouble()
            if data > Float(maxLD!) {
                penaltyService.payablePaynltyTxt.text = penaltyService.maximumLDTxt.text
            }else{
                penaltyService.payablePaynltyTxt.text = String(data)
            }
        }else{
            Utility().addAlertView("Alert!", "Enter the value in required field.", "OK", self)

        }
      
    }
    @objc func calculateServiceProrata(){
        if serviceProrata.unitCostTxt.text != nil && serviceProrata.unitCostTxt.text != "" && serviceProrata.totalDelayTxt.text != nil && serviceProrata.totalDelayTxt.text != nil {
            let unitCost = serviceProrata.unitCostTxt.text?.toDouble()
            let totaldelay = serviceProrata.totalDelayTxt.text?.toDouble()

            serviceProrata.payablePaynltyTxt.text = String(Int(unitCost!) * Int(totaldelay!))
        }
    }
    func textFieldEditingDidChange(id: String){
        let index =  arrayTicketID.firstIndex(where: { $0 == id }) ?? 0
        if index > 0 {
            getTicketDetailsUsingCOmbo(id: id)
//            let AllData =  userResultModel[index - 1]
//print("All Data",AllData)
            
        }
    }
}

extension InitiatePenaltyVC:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
        if textField == spareLD.spareCostTtxt {
            let cost = 0.10 * Double(spareLD.spareCostTtxt.text!)!
            spareLD.maximumLDTxt.text = String(cost)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
        if (textField.tag == 112){
            print(textField.text)
            if textField.text == "Spare" {
                ViewHeightConstraint.constant = 110
                TypeView.isHidden = false
                self.typeTxt.isUserInteractionEnabled = false
                self.typeTxt.text = self.typeOption[1]
                appearOTPView(type: 1)
                self.animateViewUp_spareLD()
            }else{
                ViewHeightConstraint.constant = 110
                TypeView.isHidden = false
                self.typeTxt.isUserInteractionEnabled = true
                self.typeTxt.text = self.typeOption[0]
                
            }
            SelectServiceType(type: textField.text!)
        }else if (textField.tag == 113){
            if textField.text == "LD" {
                appearOTPView(type: 3)
            }else if textField.text == "Prorata"{
                appearOTPView(type: 2)
                
            }
        }
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called == ", textField.text as Any)
        if textField.tag == 1016 {
        if textField.text != nil || textField.text != "Select" {
            textFieldEditingDidChange(id: textField.text!)
        }
        }
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    
    
}

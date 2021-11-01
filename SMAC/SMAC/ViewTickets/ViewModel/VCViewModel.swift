//
//  VCViewModel.swift
//  SMAC
//
//  Created by MAC on 17/08/21.
//

import UIKit

class VCViewModel: NSObject {
    var reloadTableView: (() -> Void)?
    private let apiManager = NetworkManager()

    let serviceUrl = BaseUrl.baseURLWithIP + "Ticket/View-Ticket"

//    var ticketslist = tickets()
    var ticketslist = viewAllTickets()
    var CellViewModels = [cellModel?]() {
        didSet {
            reloadTableView?()
        }
    }

//    init(employeeService: EmployeesServiceProtocol = EmployeesService()) {
//        self.employeeService = employeeService
//    }
    
//    func getEmployees() {
//        Service.getList { success, model, error in
//            if success, let models = model {
//                self.fetchData(model: models)
//            } else {
//                print(error!)
//            }
//        }
        
        
        
//    }
    
    func API_getViewAllTickets(json:ViewTicketJsonModel, data:@escaping (_ resultBool: Bool) -> ()){
        let jsons =  ViewTicketJsonModel.encode(object: json)
        apiManager.apiPostViewTickets(serviceName: serviceUrl, parameters: jsons as! [String : Any], completionHandler: {
            [weak self] (response, error) in
            if let response = response {
                print(response)
                let details = try? newJSONDecoder().decode(viewAllTickets.self, from: response)
                self?.fetchData(model: details!)
                data(true)
            }else{
                data(false)
            }
        })
    }
    
    func fetchData(model: viewAllTickets) {
        self.ticketslist = model // Cache
        var vms = [cellModel]()
        for item in model {
//            vms.append(createCellModel(employee: item)!)
        }
        CellViewModels = vms
    }
    
    func createCellModel(employee: ViewAllTicket) -> cellModel? {
        let id = employee.contractID
        let name = employee.userID
        let statuss = employee.ticketStatus
        let dates = employee.createdDT
        
        return cellModel( id: id!, status: statuss, unitName: name, date: dates)
    }
    
    func getCellViewModel(at indexPath: IndexPath?) -> cellModel? {
        return CellViewModels[indexPath!.row]
    }
}

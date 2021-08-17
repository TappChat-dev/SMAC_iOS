//
//  VCViewModel.swift
//  SMAC
//
//  Created by MAC on 17/08/21.
//

import UIKit

class VCViewModel: NSObject {
    var reloadTableView: (() -> Void)?
    
    var ticketslist = tickets()
    
    var CellViewModels = [cellModel]() {
        didSet {
            reloadTableView?()
        }
    }

//    init(employeeService: EmployeesServiceProtocol = EmployeesService()) {
//        self.employeeService = employeeService
//    }
    
    func getEmployees() {
//        Service.getList { success, model, error in
//            if success, let models = model {
//                self.fetchData(model: models)
//            } else {
//                print(error!)
//            }
//        }
    }
    
    func fetchData(model: tickets) {
        self.ticketslist = model // Cache
        var vms = [cellModel]()
        for item in model {
            vms.append(createCellModel(employee: item))
        }
        CellViewModels = vms
    }
    
    func createCellModel(employee: AllTicket) -> cellModel {
        let id = employee.id
        let name = employee.unitName
        let statuss = employee.status
        let dates = employee.date
        
        return cellModel( id: id, status: statuss, unitName: name, date: dates)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> cellModel {
        return CellViewModels[indexPath.row]
    }
}

//
//  DashboardTVCell.swift
//  SMAC
//
//  Created by MAC on 06/08/21.
//

import UIKit
import Foundation

class DashboardTVCell: UITableViewCell {
    
    @IBOutlet weak var moduleName:UILabel!
    @IBOutlet weak var moduleCount:UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var cellViewModel: DashboardCellViewModel? {
        didSet {
            moduleCount.text = cellViewModel?.count
            moduleName.text = cellViewModel?.name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initView() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        moduleName.text = nil
        moduleCount.text = nil
       
    }
}

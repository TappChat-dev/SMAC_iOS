//
//  DashboardCVCell.swift
//  SMAC
//
//  Created by MAC on 06/08/21.
//

import UIKit

class DashboardCVCell: UICollectionViewCell {

    @IBOutlet weak var moduleName:UILabel!
    @IBOutlet weak var moduleCount:UILabel!
    
    class var CVidentifier: String { return String(describing: self) }
    class var CVnib: UINib { return UINib(nibName: CVidentifier, bundle: nil) }
    
//    var cellViewModel: DashboardCellViewModel? {
//        didSet {
//            moduleCount.text = cellViewModel?.count
//            moduleName.text = cellViewModel?.name
//
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }

  
    
    func initView() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsets.zero
        contentView.layer.cornerRadius = 15.0
        contentView.layer.masksToBounds = true
        
//        layer.shadowColor = UIColor.white.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 5.0)
//        layer.shadowRadius = 2.0
//        layer.shadowOpacity = 0.25
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 10.0).cgPath
//        layer.cornerRadius = 15.0
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        moduleName.text = nil
//        moduleCount.text = nil
//       
//    }

}

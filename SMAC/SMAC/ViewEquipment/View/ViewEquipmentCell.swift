//
//  ViewEquipmentCell.swift
//  SMAC
//
//  Created by MAC on 07/09/21.
//

import UIKit

class ViewEquipmentCell: UITableViewCell {
    @IBOutlet weak var eqipmentNamelbl:UILabel!
    @IBOutlet weak var eqipmentTypelbl:UILabel!
    @IBOutlet weak var eqipmentNoLBL:UILabel!
    @IBOutlet weak var modelNoLBL:UILabel!
    @IBOutlet weak var btnEdit:UILabel!
    @IBOutlet weak var btnMapContract:UILabel!
    
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ContractorSLA.swift
//  SMAC
//
//  Created by MAC on 21/09/21.
//

import UIKit

class ContractorSLA: UITableViewCell {
    @IBOutlet weak var raisedBylbl:UILabel!
    @IBOutlet weak var raisedDatelbl:UILabel!
    @IBOutlet weak var descriptionlbl:UILabel!
    @IBOutlet weak var ticketIDlbl:UILabel!
    @IBOutlet weak var slaLevellbl:UILabel!
    
    
    
    
    var cellViewModel: GetContractJsonModel? {
        didSet {
            raisedBylbl.text = cellViewModel?.contractName
            raisedDatelbl.text = cellViewModel?.contractDt
            descriptionlbl.text = cellViewModel?.contractDescr
            ticketIDlbl.text = cellViewModel?.contractID
        }
    }
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

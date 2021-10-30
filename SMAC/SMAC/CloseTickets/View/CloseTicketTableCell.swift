//
//  CloseTicketTableCell.swift
//  SMAC
//
//  Created by MAC on 19/08/21.
//

import UIKit

class CloseTicketTableCell: UITableViewCell {
    @IBOutlet weak var unitNamelbl:UILabel!
    @IBOutlet weak var ticketIDlbl:UILabel!
    @IBOutlet weak var commentlbl:UILabel!
    @IBOutlet weak var statusLBL:UILabel!
    @IBOutlet weak var dateLBL:UILabel!
    
    class var closeidentifier: String { return String(describing: self) }
    class var closenib: UINib { return UINib(nibName: closeidentifier, bundle: nil) }
    
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

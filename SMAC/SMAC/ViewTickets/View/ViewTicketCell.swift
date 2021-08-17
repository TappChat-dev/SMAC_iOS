//
//  ViewTicketCell.swift
//  SMAC
//
//  Created by MAC on 12/08/21.
//

import UIKit

class ViewTicketCell: UITableViewCell {
    @IBOutlet weak var namelbl:UILabel!
    @IBOutlet weak var IDlbl:UILabel!
    @IBOutlet weak var EqipmentNamelbl:UILabel!
    @IBOutlet weak var unitNamelbl:UILabel!
    @IBOutlet weak var statusLBL:UILabel!
    @IBOutlet weak var dateLBL:UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    
    var cellViewModel: cellModel? {
        didSet {
            IDlbl.text = cellViewModel?.id
            dateLBL.text = cellViewModel?.date
            unitNamelbl.text = cellViewModel?.unitName
            statusLBL.text = cellViewModel?.status
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(){
//        self.namelbl.text =
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
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
        namelbl.text = nil
        IDlbl.text = nil
        EqipmentNamelbl.text = nil
        unitNamelbl.text = nil
        statusLBL.text = nil
        dateLBL.text = nil
    }
}

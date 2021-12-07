//
//  ViewTicketCell.swift
//  SMAC
//
//  Created by MAC on 12/08/21.
//

import UIKit

protocol ViewTicketCellDelegate : class {
    func didPressButton(_ tag: Int)
}

class ViewTicketCell: UITableViewCell {
    @IBOutlet weak var namelbl:UILabel!
    @IBOutlet weak var IDlbl:UILabel!
    @IBOutlet weak var subjectlbl:UILabel!
    @IBOutlet weak var descriptionlbl:UILabel!
    @IBOutlet weak var unitNamelbl:UILabel!
    @IBOutlet weak var statusLBL:UILabel!
    @IBOutlet weak var dateLBL:UILabel!
    @IBOutlet weak var btnEdit:UIButton!
    @IBOutlet weak var backView:UIView!
    var cellDelegate: ViewTicketCellDelegate?
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var buttonPressed : (() -> ()) = {}

         @IBAction func buttonAction(_ sender: UIButton) {
//             buttonPressed()
            cellDelegate?.didPressButton(sender.tag)
         }
    
//    var cellViewModel: cellModel? {
//        didSet {
//            IDlbl.text = cellViewModel?.id
//            dateLBL.text = cellViewModel?.date
//            unitNamelbl.text = cellViewModel?.unitName
//            statusLBL.text = cellViewModel?.status
//        }
//    }

    var cellViewModel: ResultTickets? {
        didSet {
            IDlbl.text = cellViewModel?.ticketID
            dateLBL.text = cellViewModel?.equipmentName
            namelbl.text = cellViewModel?.contractName
            statusLBL.text = cellViewModel?.ticketStatusName
            unitNamelbl.text = cellViewModel?.unitName
            subjectlbl.text = cellViewModel?.subject
            descriptionlbl.text = cellViewModel?.descr
        }
    }
    
//    var cellViewModelDic : ViewAllTicket{
//        didSet{
//            IDlbl.text = cellViewModel?.ticketID
//            dateLBL.text = cellViewModel?.equipmentName
//            namelbl.text = cellViewModel?.contractName
//            statusLBL.text = cellViewModel?.eqptType
//        }
//    }
    
    func loadCellData(with ticketID: String, equipmentName: String, contractName: String, eqptType:String) {
        IDlbl.text = ticketID
        dateLBL.text = equipmentName
        namelbl.text = contractName
        statusLBL.text = eqptType
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
//        preservesSuperviewLayoutMargins = false
//        separatorInset = UIEdgeInsets.zero
//        layoutMargins = UIEdgeInsets.zero
    }

//    override func prepareForReuse() {
//        super.prepareForReuse()
//        namelbl.text = nil
//        IDlbl.text = nil
//        EqipmentNamelbl.text = nil
//        unitNamelbl.text = nil
//        statusLBL.text = nil
//        dateLBL.text = nil
//    }
    
    override func layoutSubviews() {
//        self.addShadow()
        super.layoutSubviews()
             //set the values for top,left,bottom,right margins
//             let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//             contentView.frame = contentView.frame.inset(by: margins)
//             contentView.layer.cornerRadius = 8
    }
}

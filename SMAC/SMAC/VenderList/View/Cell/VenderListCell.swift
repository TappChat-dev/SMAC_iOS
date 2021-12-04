//
//  VenderListCell.swift
//  SMAC
//
//  Created by MAC on 15/09/21.
//

import UIKit

class VenderListCell: UITableViewCell {
    @IBOutlet weak var venderNamelbl:UILabel!
    @IBOutlet weak var venderIDlbl:UILabel!
    @IBOutlet weak var venderAddresslbl:UILabel!
    @IBOutlet weak var venderNumberbl:UILabel!
    
    
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
//    var cellViewModel: User? {
    var cellViewModel: ResultVendor? {
        didSet {
            venderNamelbl.text = cellViewModel?.name
            venderIDlbl.text = cellViewModel?.gstNo
            venderAddresslbl.text = cellViewModel?.address
//            if let fetchedAdd = cellViewModel?.address1 as? String {
//                venderAddresslbl.text = fetchedAdd
//            }
//            if let fetchedAdd = cellViewModel?.contactNo as? String {
//                venderNumberbl.text = fetchedAdd
//            }
            venderNumberbl.text = cellViewModel?.contactNo
        }
    }
}

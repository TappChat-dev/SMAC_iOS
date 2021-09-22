//
//  ImageHeaderView.swift
//  SMAC
//
//  Created by MAC on 21/09/21.
//

import UIKit

class ImageHeaderView : UIView {
    
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDepart: UILabel!
    @IBOutlet weak var lblCompany: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImage.layoutIfNeeded()
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.borderWidth = 1
        self.profileImage.layer.borderColor = UIColor.white.cgColor
        lblUserName.text = "Chandan Jee"
        lblDepart.isHidden = true
        lblCompany.text =  "Intek Micro Systems"
    }
}

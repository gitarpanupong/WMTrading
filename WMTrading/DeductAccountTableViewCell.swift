//
//  DeductAccountTableViewCell.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 17/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class DeductAccountTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblHeadername: UILabel!
    
    @IBOutlet weak var lblFullname: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var lblBankAccount: UILabel!
    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var lblAccountNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

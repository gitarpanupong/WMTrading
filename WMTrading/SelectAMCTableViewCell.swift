//
//  SelectAMCTableViewCell.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 13/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class SelectAMCTableViewCell: UITableViewCell {
    
    @IBOutlet weak var amcImage: UIImageView!
    @IBOutlet weak var amcName: UILabel!
    @IBOutlet weak var amcFullname: UILabel!
    @IBOutlet weak var btnOpenBuy: UIButton!
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var btnCondition: UIButton!
    
    @IBOutlet weak var btnAlreadybuy: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

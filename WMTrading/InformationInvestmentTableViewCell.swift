//
//  InformationInvestmentTableViewCell.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 14/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class InformationInvestmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblData: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
           // your cleanup code
          
       }

}

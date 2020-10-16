//
//  FifthTableViewCell.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 13/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class FifthTableViewCell: UITableViewCell {
    
    @IBOutlet weak var amImage: UIImageView!
    @IBOutlet weak var amName: UILabel!
    @IBOutlet weak var amFullname: UILabel!
    @IBOutlet weak var amTax: UILabel!
    @IBOutlet weak var amNumber: UILabel!
    @IBOutlet weak var amWrite: UILabel!
    @IBOutlet weak var amAccount: UILabel!
    @IBOutlet weak var amAccountType: UILabel!
    @IBOutlet weak var amAccountNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  QuestionnaireTableViewCell.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 16/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class QuestionnaireTableViewCell: UITableViewCell {

    @IBOutlet weak var lblData: UILabel!
 
    @IBOutlet weak var tfData: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   override func prepareForReuse() {
        print("prepare ")
    }

}

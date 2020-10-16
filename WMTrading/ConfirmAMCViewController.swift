//
//  ConfirmAMCViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 17/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class ConfirmAMCViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var ConfirmAMCData: [[String:String]] = []
    
    var HeaderConfirmAMC = ["บริษัทหลักทรัพย์ฯ ที่ต้องการเปิด"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.setAnimationsEnabled(false)
        ConfirmAMCData.remove(at: 0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ConfirmAMCData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmAMCCell", for: indexPath) as! ConfirmAMCTableViewCell
        
        cell.logoImage.image = UIImage(named: ConfirmAMCData[indexPath.row]["Headername"]!)!
        cell.lblHeadername.text = ConfirmAMCData[indexPath.row]["Headername"]
        cell.lblFullname.text = ConfirmAMCData[indexPath.row]["Fullname"]
        
       // cell.accessoryType = .checkmark
        cell.selectionStyle = .none
        cell.layer.borderWidth = 0.23
        cell.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cell.logoImage.layer.borderWidth = 3
        cell.logoImage.layer.cornerRadius = 7
        cell.logoImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
       // #colorLiteral(red: 0.2060739398, green: 0.2581427097, blue: 0.3039865196, alpha: 1)
        //035096
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmAMCCell", for: indexPath) as! ConfirmAMCTableViewCell
       // tableView.reloadRows(at: [indexPath], with: .none)
        tableView.deselectRow(at: indexPath, animated: false)
    
    }
    
       func numberOfSections(in tableView: UITableView) -> Int {
           return HeaderConfirmAMC.count
       }
       
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
           headerView.layer.backgroundColor = #colorLiteral(red: 0.1675891876, green: 0.1996641159, blue: 0.2247056961, alpha: 1)
           
           let headerlabel = UILabel()
           //15
           headerlabel.frame = CGRect.init(x: 15, y: 0, width: headerView.frame.width - 20, height: headerView.frame.height + 20)
           let header = HeaderConfirmAMC[section]
         //  headerlabel.font = UIFont.boldSystemFont(ofSize: 16)
           headerlabel.font = UIFont.boldSystemFont(ofSize: 15)
           headerlabel.textColor = #colorLiteral(red: 0.1799544096, green: 0.6760377884, blue: 0.9656587243, alpha: 1)
          // headerlabel.adjustsFontSizeToFitWidth = true
           
          // headerlabel.adjustsFontSizeToFitWidth = true
           headerlabel.minimumScaleFactor = 0.5
          
           headerlabel.numberOfLines = 0
           headerlabel.lineBreakMode = .byWordWrapping
            headerlabel.text = header
         //  headerlabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           
            headerView.addSubview(headerlabel)
           
            return headerView
       }
       
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
              return 45
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

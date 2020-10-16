//
//  DeductAccountViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 17/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class DeductAccountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    
    
    @IBOutlet weak var tableView: UITableView!
    
      var DeductData: [[String:String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DeductData.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeductAccountCell", for: indexPath) as! DeductAccountTableViewCell
        
        cell.logoImage.image = UIImage(named: DeductData[indexPath.row]["Headername"]!)
        cell.lblHeadername.text = DeductData[indexPath.row]["Headername"]
        cell.lblFullname.text = DeductData[indexPath.row]["Fullname"]
        
        cell.lblBankAccount.text = "ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน) (BAY)"
        cell.lblAccountType.text = "ออมทรัพย์"
        cell.lblAccountNumber.text = "123 1232 131231 213213213"
        
        cell.logoImage.layer.cornerRadius = 7
        cell.logoImage.layer.borderWidth = 3
        cell.logoImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha:0.0)
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          var showDetail = storyboard?.instantiateViewController(withIdentifier: "LessPurchasePriceDetail") as! LessPurchasePriceDetailViewController
        
        showDetail.LessPurchaseData = DeductData[indexPath.row]
        
        self.navigationController?.pushViewController(showDetail, animated: false)
              
        tableView.deselectRow(at: indexPath, animated: true)
       
        
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          guard let firstVC = segue.destination as? InformationInvestmentViewController else { return }
          firstVC.InvestData = DeductData
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

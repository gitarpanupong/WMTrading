//
//  FifthViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 13/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var AccountData: [[String]] = [["ประสงค์","110200744752","ไม่จดทะเบียนภาษีมูลค่าเพิ่ม","ธนาคารกรุงไทย จำกัด (มหาชน) (KTB)","ออมทรัพย์","9900000004866","นาย ภาณุพงศ์ ไชยรัตน์"]]
    
  //  var Data: [[String]] = [["LHFUND","บริษัทหลักทรัพย์จัดการกองทุน แลนด์ แอนด์ เฮ้าส์ จำกัด"],["KSAM","บริษัทหลักทรัพย์จัดการกองทุน กรุงศรี จำกัด"],["KTAM","บริษัทหลักทรัพย์จัดการกองทุน กรุงไทย จำกัด (มหาชน)"],["MFC","บริษัทหลักทรัพย์จัดการกองทุน เอ็มเอฟซี จำกัด (มหาชน)"],["SCBAM","บริษัทหลักทรัพย์จัดการกองทุน ไทยพาณิชย์ จำกัด"]]
    
    var Data: [[String:String]] = []
    @IBOutlet weak var btnNextpage: UIButton!
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "returnfundCell", for: indexPath) as! FifthTableViewCell
        
        cell.layer.borderWidth = 0.23
        cell.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
       
        cell.amImage.image = UIImage(named: Data[indexPath.row]["Headername"]!)
        cell.amImage.layer.cornerRadius = 7
        cell.amImage.layer.borderWidth = 3
        cell.amImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha:0.0)
        cell.amName.text = Data[indexPath.row]["Headername"]
        cell.amFullname.text = Data[indexPath.row]["Fullname"]
        
        cell.amTax.text = AccountData[0][0]
        cell.amNumber.text = AccountData[0][1]
        cell.amWrite.text = AccountData[0][2]
        cell.amAccount.text = AccountData[0][3]
        cell.amAccountType.text = AccountData[0][4]
        cell.amAccountNumber.text = AccountData[0][5]
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Data ",Data)
      
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  let cell = tableView.cellForRow(at: indexPath) as! FifthTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "returnfundCell", for: indexPath) as! FifthTableViewCell
        
        let showDetail = storyboard?.instantiateViewController(withIdentifier: "showDetailAMC") as! DetailAMCViewController
        
        
      //  showDetail.amcImage.image =  UIImage(named: Data[indexPath.row][0])
       // showDetail.Data = [Data[indexPath.row]]
       // showDetail.Data = Data[indexPath.section][indexPath.row]
       // showDetail.AccountData = AccountData
        
        showDetail.DetailData = [Data[indexPath.row]]
        showDetail.AccountData = AccountData
        
//        showDetail.amcName.text = Data[indexPath.row][0]
//        showDetail.amcFullname.text = Data[indexPath.row][1]
//        showDetail.bankNameTF.text = AccountData[0][3]
//        showDetail.accountTypeTF.text = AccountData[0][4]
//        showDetail.accountNameTF.text = AccountData[0][7]
//        showDetail.accountNumberTF.text = AccountData[0][5]
//        showDetail.identificationNumberTF.text = AccountData[0][6]
//        showDetail.registerTaxTF.text = AccountData[0][2]

        self.navigationController?.pushViewController(showDetail, animated: false)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let firstVC = segue.destination as? DeductAccountViewController else { return }
            firstVC.DeductData = Data
            
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

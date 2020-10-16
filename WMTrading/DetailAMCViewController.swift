//
//  DetailAMCViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 13/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class DetailAMCViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var amcImage: UIImageView!
    @IBOutlet weak var amcName: UILabel!
    @IBOutlet weak var amcFullname: UILabel!
    
    @IBOutlet weak var bankNameTF: UITextField!
    @IBOutlet weak var accountTypeTF: UITextField!
    @IBOutlet weak var accountNameTF: UITextField!
    @IBOutlet weak var accountNumberTF: UITextField!
    
    @IBOutlet weak var identificationNumberTF: UITextField!
    @IBOutlet weak var registerTaxTF: UITextField!
    
    @IBOutlet var lblData: [UILabel]!
    @IBOutlet var tfData: [UITextField]!
    
    
    var DetailData: [[String:String]] = []
    var AccountData: [[String]] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "รายละเอียดบัญชีรับเงินค่าขายคืน";
        
        print("DetailData ",DetailData)
        
        amcImage.layer.cornerRadius = 5
        
        amcImage.image =  UIImage(named: DetailData[0]["Headername"]!)
        amcName.text = DetailData[0]["Headername"]
        amcFullname.text = DetailData[0]["Fullname"]
//         bankNameTF.text = AccountData[0][3]
//        accountTypeTF.text = AccountData[0][4]
//        accountNameTF.text = AccountData[0][6]
//        accountNumberTF.text = AccountData[0][5]
//        identificationNumberTF.text = AccountData[0][1]
//        registerTaxTF.text = AccountData[0][2]
         for (index,textfield) in tfData.enumerated() {
             textfield.delegate = self
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: tfData[index].frame.height - 3, width: tfData[index].frame.width, height: 3.0)
            bottomLine.backgroundColor = #colorLiteral(red: 0.1334861405, green: 0.4779872789, blue: 0.670943052, alpha: 1)
              //  bottomLine.backgroundColor = #colorLiteral(red: 0.1413752717, green: 0.3980787606, blue: 0.5760628173, alpha: 1)
            tfData[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            tfData[index].borderStyle = .none
            tfData[index].textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            tfData[index].layer.addSublayer(bottomLine)
//            tfData[index].layer.cornerRadius = 10
//            tfData[index].layer.borderColor = #colorLiteral(red: 0.1180533958, green: 0.4227256944, blue: 0.5933732551, alpha: 1)
//            tfData[index].layer.borderWidth = 2
//            tfData[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
//            tfData[index].textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
             if textfield.text == "" {
                lblData[index].isHidden = true
                tfData[index].attributedPlaceholder = NSAttributedString(string: lblData[index].text!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
             }else {
                 lblData[index].isHidden = false
             }
         }
        // #colorLiteral(red: 0.118473433, green: 0.3195216656, blue: 0.4401983023, alpha: 1)
        
          let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
           //Causes the view (or one of its embedded text fields) to resign the first responder status.
        for (index,_) in tfData.enumerated() {
            if tfData[index].text == "" {
                lblData[index].isHidden = true
                tfData[index].attributedPlaceholder = NSAttributedString(string: lblData[index].text!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            }else {
                lblData[index].isHidden = false
            }
        }
           view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        for (index,tf) in tfData.enumerated() {
            if textField == tf {
                lblData[index].isHidden = false
                tfData[index].placeholder = nil
            }
        }

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

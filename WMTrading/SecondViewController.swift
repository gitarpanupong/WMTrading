//
//  SecondViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 10/1/2563 BE.












//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var sameAddressView: UIView!
    
    @IBOutlet weak var thirdAddressView: UIView!
    @IBOutlet weak var btnNextpage: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var WorkAddressView: UIView!
   
    @IBOutlet weak var btnWorkSameAddress: UIButton!
    
    @IBOutlet var TextFieldCollect: [UITextField]!
    @IBOutlet var TextFieldCollectWork: [UITextField]!
    
    @IBOutlet var buttonSelectContact: [UIButton]!
    @IBOutlet var buttonSelectCurrent: [UIButton]!
    
    
    
    
    
 //   var checkTextfield:UITextField?
    var checkoriginy: CGFloat?
    var check = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNextpage.layer.cornerRadius = 10
        scrollView.keyboardDismissMode = .onDrag
        btnWorkSameAddress.layer.cornerRadius = btnWorkSameAddress.frame.size.width / 3
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
             
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
         view.addGestureRecognizer(tap)
        
        for textfield in TextFieldCollect {
            textfield.delegate = self
        }
        for textfield in TextFieldCollectWork {
            textfield.delegate = self
        }
        
//        btnContactAddressHouse.layer.cornerRadius = btnContactAddressHouse.layer.bounds.width / 3
//        btnContactAddressWork.layer.cornerRadius = btnContactAddressWork.layer.bounds.width / 3
//        btnCurrentAddressHouse.layer.cornerRadius = btnContactAddressHouse.layer.bounds.width / 3
//        btnCurrentAddressWork.layer.cornerRadius = btnContactAddressWork.layer.bounds.width / 3
        
        for (index,btn) in buttonSelectContact.enumerated() {
            btn.layer.cornerRadius = btn.layer.bounds.width / 3
            if index == 0{
                btn.isSelected = true
                btn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                btn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
            }
        }
        for (index,btn) in buttonSelectCurrent.enumerated() {
            btn.layer.cornerRadius = btn.layer.bounds.width / 3
            if index == 0{
                btn.isSelected = true
                btn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                btn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
            }
        }
        
        WorkAddressView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        WorkAddressView.layer.borderWidth = 0.25
        
//        btnContactAddressHouse.isSelected = true
//        btnContactAddressHouse.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        btnContactAddressHouse.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
        
//        btnCurrentAddressHouse.isSelected = true
//        btnCurrentAddressHouse.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        btnCurrentAddressHouse.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
//
    }
    @IBOutlet weak var btnSameAddressClick: UIButton!
    
    @IBAction func sameAddressClick(_ sender: UIButton) {
     

      //  for button in buttonArray {
      //      if sender.tag == button?.tag as! Int && button?.isSelected == false {
        if btnWorkSameAddress.isSelected == false {
            btnWorkSameAddress.isSelected = true
            btnWorkSameAddress.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            btnWorkSameAddress.layer.cornerRadius = btnWorkSameAddress.frame.size.width / 3
            sameAddressView.isHidden = true
            thirdAddressView.frame.origin = CGPoint(x: 0, y: WorkAddressView.frame.origin.y + WorkAddressView.frame.size.height)
            btnNextpage.frame.origin = CGPoint(x: 126, y: thirdAddressView.frame.origin.y + thirdAddressView.frame.size.height + 20)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
                
                print("select")
        }else {
            btnWorkSameAddress.isSelected = false
            btnWorkSameAddress.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            btnWorkSameAddress.layer.cornerRadius = btnWorkSameAddress.frame.size.width / 3
            sameAddressView.isHidden = false
            thirdAddressView.frame.origin = CGPoint(x: 0, y: sameAddressView.frame.origin.y + sameAddressView.frame.size.height)
            btnNextpage.frame.origin = CGPoint(x: 126, y: thirdAddressView.frame.origin.y + thirdAddressView.frame.size.height + 20)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
                print("Disselect")
            }
            
            
            
    //    }
//        for button in btnALLTerritory {
//               if sender.tag == button.tag{
//                   button.isSelected = true;
//                   button.setImage(#imageLiteral(resourceName: "ic_Radio_filled"), for: .normal)
//               }else{
//                   button.isSelected = false;
//                   button.setImage(#imageLiteral(resourceName: "ic_Radio_Empty"), for: .normal)
//               }
//           }
        
    }
    @objc func dismissKeyboard() {
         //Causes the view (or one of its embedded text fields) to resign the first responder status.
         view.endEditing(true)
     }
     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
     
     @objc func keyboardWillShow(notification:NSNotification){
         //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
         var userInfo = notification.userInfo!
         var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
         keyboardFrame = self.view.convert(keyboardFrame, from: nil)

         var contentInset:UIEdgeInsets = self.scrollView.contentInset
         contentInset.bottom = keyboardFrame.size.height + 80
         scrollView.contentInset = contentInset
     }

     @objc func keyboardWillHide(notification:NSNotification){
         let contentInset:UIEdgeInsets = UIEdgeInsets.zero
         scrollView.contentInset = contentInset
     }
    
    @IBAction func ButtonNextPage(_ sender: UIButton) {
        
         for textfield in TextFieldCollect {
            if textfield.text?.isEmpty == true {
                textfield.layer.borderColor = #colorLiteral(red: 0.8167829949, green: 0.1221832305, blue: 0.00705682826, alpha: 1)
                textfield.layer.borderWidth = 2
                textfield.layer.cornerRadius = 6
                textfield.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                check += 1
            
                if check == 1 {
                    checkoriginy = textfield.frame.origin.y
                }
            }else {
                textfield.layer.borderColor = #colorLiteral(red: 0.8167829949, green: 0.1221832305, blue: 0.00705682826, alpha: 0)
            }
        }
        if btnWorkSameAddress.isSelected == false {
            for textfield in TextFieldCollectWork {
                if textfield.text?.isEmpty == true {
                    textfield.layer.borderColor = #colorLiteral(red: 0.8167829949, green: 0.1221832305, blue: 0.00705682826, alpha: 1)
                    textfield.layer.borderWidth = 2
                    textfield.layer.cornerRadius = 6
                    textfield.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    check += 1
                
                    if check == 1 {
                        checkoriginy = WorkAddressView.frame.origin.y - textfield.frame.origin.y
                    }
                }else {
                     textfield.layer.borderColor = #colorLiteral(red: 0.8167829949, green: 0.1221832305, blue: 0.00705682826, alpha: 0)
                }
            }
        }
       
        if check >= 1{
            let alert = UIAlertController(title: "กรุณาตรวจสอบความถูกต้องของข้อมูลต่อไปนี้", message: "\n- กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            scrollView.contentOffset = CGPoint(x: 0 ,y: checkoriginy! - ((navigationController?.navigationBar.frame.size.height)!) - 90) ;
                   check = 0
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    @IBAction func btnSelect(_ sender: UIButton) {
        
//        if btnContactAddressHouse.isSelected == false || btnContactAddressWork.isSelected == true {
//            btnContactAddressHouse.isSelected = true
//              btnContactAddressWork.isSelected = false
//            btnContactAddressHouse.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//              btnContactAddressHouse.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
//            btnContactAddressWork.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
        
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            sender.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
            
            for btn in buttonSelectContact {
                if btn != sender {
                    btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    btn.isSelected = false
                }
            }
        }
        
        
    }
    
    
    @IBAction func btnSelect2(_ sender: UIButton) {
            
         sender.isSelected = !sender.isSelected
        if(sender.isSelected == true) {
            
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            sender.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
            
            for btn in buttonSelectCurrent {
                if btn != sender {
                    btn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    btn.isSelected = false
                }
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

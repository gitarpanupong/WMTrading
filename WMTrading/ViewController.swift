//
//  ViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 9/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit
import SQLite3

class CellClass: UITableViewCell {
    
}
class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var SelectedButton: [UIButton]!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusSegment: UISegmentedControl!
    @IBOutlet weak var childTextfield: UITextField!
    var child: Int?
    @IBOutlet weak var inputChildView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var lastView: UIView!
    @IBOutlet weak var btnNextpage: UIButton!
    @IBOutlet weak var btnForever: UIButton!
    @IBOutlet weak var ExpDateTF: UITextField!
    @IBOutlet weak var lblForeEver: UILabel!
    var checkTextfield: UITextField!
    var checkoriginy: CGFloat?
    var check = 0
   
    
    
    @IBOutlet var Textfield: [UITextField]!
    @IBOutlet var statusTextField: [UITextField]!
    @IBOutlet var childTextField: [UITextField]!
    @IBOutlet var lastTextField: [UITextField]!
    
    
    @IBOutlet weak var btnTitleName: UIButton!
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource = [String]()
    
    @IBOutlet weak var NameTitlePickerTextField: UITextField!
    
     let salutations = ["", "Mr.", "Ms.", "Mrs."]
    
    @IBAction func statusSegmentControl(_ sender: UISegmentedControl) {
        switch statusSegment.selectedSegmentIndex
        {
        case 0:
            inputChildView.frame.origin = CGPoint(x: 0, y: statusView.frame.origin.y )
            statusView.isHidden = true
            
            childView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
            if childView.isHidden != true {
                lastView.frame.origin = CGPoint(x: 0, y: childView.frame.origin.y + childView.frame.size.height )
            }else {
                 lastView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
            }
            
           // lastView.frame.origin = CGPoint(x: 0, y: 1195)
            btnNextpage.frame.origin = CGPoint(x: 126, y: lastView.frame.origin.y + lastView.frame.size.height + 23)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
        case 1:
            statusView.isHidden = false
            inputChildView.frame.origin = CGPoint(x: 0, y: statusView.frame.origin.y + statusView.frame.size.height )
             childView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
                      
            if childView.isHidden != true {
                lastView.frame.origin = CGPoint(x: 0, y: childView.frame.origin.y + childView.frame.size.height )
            }else {
                lastView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
            }
                      
                     // lastView.frame.origin = CGPoint(x: 0, y: 1195)
            btnNextpage.frame.origin = CGPoint(x: 126, y: lastView.frame.origin.y + lastView.frame.size.height + 23)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
           // self.scrollView.contentSize.height = 2700
        case 2:
            inputChildView.frame.origin = CGPoint(x: 0, y: statusView.frame.origin.y )
            statusView.isHidden = true
            childView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
            if childView.isHidden != true {
                lastView.frame.origin = CGPoint(x: 0, y: childView.frame.origin.y + childView.frame.size.height )
            }else {
                lastView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
            }
                       
                      // lastView.frame.origin = CGPoint(x: 0, y: 1195)
            btnNextpage.frame.origin = CGPoint(x: 126, y: lastView.frame.origin.y + lastView.frame.size.height + 23)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
        case 3:
            inputChildView.frame.origin = CGPoint(x: 0, y: statusView.frame.origin.y )
            statusView.isHidden = true
                      
            childView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
                      
            if childView.isHidden != true {
                lastView.frame.origin = CGPoint(x: 0, y: childView.frame.origin.y + childView.frame.size.height )
            }else {
                lastView.frame.origin = CGPoint(x: 0, y: inputChildView.frame.origin.y + inputChildView.frame.size.height)
            }
                      
                     // lastView.frame.origin = CGPoint(x: 0, y: 1195)
            btnNextpage.frame.origin = CGPoint(x: 126, y: lastView.frame.origin.y + lastView.frame.size.height + 23)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
            
        default:
            break
        }
    }
    
    
    
    
    @IBAction func HandlerButton(_ sender: UIButton) {
        SelectedButton.forEach{ (button) in
            button.isHidden = !button.isHidden
        }
    }
    
    
    @IBAction func chooseButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        scrollView.keyboardDismissMode = .onDrag
      //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
      //tap.cancelsTouchesInView = false

        for textfield in self.Textfield {
            textfield.delegate = self
//            var bottomLine = CALayer()
//            bottomLine.frame = CGRect(x: 0.0, y: textfield.frame.height - 3, width: textfield.frame.width, height: 3.0)
//            bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//            textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
//            textfield.borderStyle = .none
//            textfield.layer.addSublayer(bottomLine)
        
        }
        for textfield in statusTextField {
            textfield.delegate = self
        }
        for textfield in childTextField {
            textfield.delegate = self
        }
        for textfield in lastTextField {
            textfield.delegate = self
        }
//        for textfield in statusTextField {
//                textfield.delegate = self
//                var bottomLine = CALayer()
//                bottomLine.frame = CGRect(x: 0.0, y: textfield.frame.height - 3, width: textfield.frame.width, height: 3.0)
//                bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//                textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
//                textfield.borderStyle = .none
//                textfield.layer.addSublayer(bottomLine)
//
//        }
//        for textfield in childTextField {
//            textfield.delegate = self
//            var bottomLine = CALayer()
//            bottomLine.frame = CGRect(x: 0.0, y: textfield.frame.height - 3, width: textfield.frame.width, height: 3.0)
//            bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//            textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
//            textfield.borderStyle = .none
//            textfield.layer.addSublayer(bottomLine)
//
//              }
//        for textfield in lastTextField {
//                   textfield.delegate = self
//                   var bottomLine = CALayer()
//                   bottomLine.frame = CGRect(x: 0.0, y: textfield.frame.height - 3, width: textfield.frame.width, height: 3.0)
//                   bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//                   textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
//                   textfield.borderStyle = .none
//                   textfield.layer.addSublayer(bottomLine)
//
//                     }
        
        
        childTextfield.delegate = self
       
        
        btnForever.layer.cornerRadius = btnForever.bounds.size.width / 3
        btnForever.clipsToBounds = true
        
        childView.layer.borderWidth = 0.3
        childView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        statusView.layer.borderWidth = 0.3
        statusView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        view.addGestureRecognizer(tap)
        
//        var bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0.0, y: childTextfield.frame.height - 3, width: childTextfield.frame.width, height: 3.0)
//        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        childTextfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
//        childTextfield.borderStyle = .none
//        childTextfield.layer.addSublayer(bottomLine)
        
       
//        for textfield in Textfield {
//            textfield.UITextFieldDelegate
//        }
//
        
//        let fileURL = try! FileManager.default
//            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            .appendingPathComponent("AMCDatabase.sqlite")
//
//        var db: OpaquePointer?
//        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
//              print("Successfully opened connection to database at \(fileURL.path)")
//
//        } else {
//            sqlite3_close(db)
//            db = nil
//            return
//        }
//
        childTextfield.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingChanged)
        
        print("Screen ",scrollView.contentOffset)
        
        tableView.delegate = self// as! UITableViewDelegate
        tableView.dataSource = self// as! UITableViewDataSource
       // tableView.register(ViewController.self, forHeaderFooterViewReuseIdentifier: "Cell")
        tap.cancelsTouchesInView = false
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnTitleName.layer.cornerRadius = 7
        btnTitleName.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        btnTitleName.layer.borderWidth = 3
        self.view.backgroundColor = UIColor(named: "black")
       // UIView.setbac = UIColor(named: "darkBlue")
        self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
      //  print("scroview ",scrollView.contentSize.height)
        btnNextpage.layer.cornerRadius = 10
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
         
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        tableView.alpha = 1
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
     //    tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        self.transparentView.alpha = 0.5
        self.tableView.backgroundColor = UIColor.white
        self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
         }, completion: nil)
     }
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        self.transparentView.alpha = 0
        self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }

    @IBAction func onClickTitleName(_ sender: Any) {
        dataSource = ["นาย", "นาง", "นางสาว"]
        selectedButton = btnTitleName
        addTransparentView(frames: btnTitleName.frame)
     }
        
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        if childTextfield.text == "0"{
            childView.isHidden = true
            lastView.frame.origin.y = inputChildView.frame.origin.y + inputChildView.frame.size.height
                       //   scrollView.frame.origin.y = inputChildView.frame.origin.y + 64
            btnNextpage.frame.origin = CGPoint(x: 126, y: lastView.frame.origin.y + lastView.frame.size.height + 23)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
            
        }else {
            childView.isHidden = false
//             lastView.frame.origin.y = inputChildView.frame.origin.y + 370
//             btnNextpage.frame.origin = CGPoint(x: 158, y: lastView.frame.origin.y + 806)
//            self.scrollView.contentSize.height = 2700
            lastView.frame.origin.y = childView.frame.origin.y + childView.frame.size.height
                       //   scrollView.frame.origin.y = inputChildView.frame.origin.y + 64
            btnNextpage.frame.origin = CGPoint(x: 126, y: lastView.frame.origin.y + lastView.frame.size.height + 23)
            self.scrollView.contentSize.height = btnNextpage.frame.origin.y + btnNextpage.frame.size.height + 52
        }
    }
    
    @IBAction func NextButton(_ sender: Any) {
     //    var checkTextfield  = Textfield

        for textfield in Textfield {
            if textfield.text?.isEmpty == true {
                textfield.layer.borderColor = #colorLiteral(red: 0.9510123134, green: 0.3623146415, blue: 0.3538915515, alpha: 1)
                
//              var bottomLine = CALayer()
//                     bottomLine.frame = CGRect(x: 0.0, y: textfield.frame.height - 3, width: textfield.frame.width, height: 3.0)
//                     bottomLine.backgroundColor = #colorLiteral(red: 0.9510123134, green: 0.3623146415, blue: 0.3538915515, alpha: 1)
//                     textfield.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
//              textfield.borderStyle = .none
//              textfield.layer.addSublayer(bottomLine)
                textfield.layer.borderWidth = 2
                textfield.layer.cornerRadius = 6
                check += 1
                if check == 1 {
                    checkoriginy = textfield.frame.origin.y
                   //checkTextfield = textfield as! UITextField
                }
               
            }else {
                textfield.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0)
            }
        }
        
        if statusSegment.selectedSegmentIndex == 1 {
        for textfield in statusTextField {
            if textfield.text?.isEmpty == true {
                check += 1
                textfield.layer.borderWidth = 2
                textfield.layer.cornerRadius = 6
                textfield.layer.borderColor = #colorLiteral(red: 0.9510123134, green: 0.3623146415, blue: 0.3538915515, alpha: 1)
                if check == 1{
                    checkoriginy = statusView.frame.origin.y - textfield.frame.origin.y
                }
            }else {
                 textfield.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0)
            }
        }
        }
        if childTextfield.text != "0" {
            for textfield in childTextField {
                if textfield.text?.isEmpty == true {
                    check += 1
                    textfield.layer.borderWidth = 2
                    textfield.layer.cornerRadius = 6
                    textfield.layer.borderColor = #colorLiteral(red: 0.9510123134, green: 0.3623146415, blue: 0.3538915515, alpha: 1)
                        if check == 1{
                            checkoriginy = childView.frame.origin.y - textfield.frame.origin.y
                        }
                }else {
                     textfield.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0)
                }
            }
        }
        
        for textfield in lastTextField {
            if textfield.text?.isEmpty == true {
                check += 1
                textfield.layer.borderWidth = 2
                textfield.layer.cornerRadius = 6
                textfield.layer.borderColor = #colorLiteral(red: 0.9510123134, green: 0.3623146415, blue: 0.3538915515, alpha: 1)
                if check == 1{
                    checkoriginy = childView.frame.origin.y - textfield.frame.origin.y
                }
            }else {
                 textfield.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0)
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
    
    func readtextFile(){
        let fileText = Bundle.main.path(forResource: "testColor", ofType: "txt")
        var readText = ""
        do{
            readText = try String(contentsOfFile: fileText!, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
        print(readText)
    }
    
    @IBAction func ForeverAction(_ sender: UIButton) {
        if btnForever.isSelected == false {
            btnForever.isSelected = true
            btnForever.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            btnForever.frame.origin.x = ExpDateTF.frame.origin.x
            lblForeEver.frame.origin.x = btnForever.frame.origin.x + btnForever.frame.size.height + 5
            ExpDateTF.isHidden = true
        }else {
            btnForever.isSelected = false
            ExpDateTF.isHidden = false
            btnForever.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            btnForever.frame.origin.x = ExpDateTF.frame.origin.x + ExpDateTF.frame.size.width + 10
            lblForeEver.frame.origin.x = btnForever.frame.origin.x + btnForever.frame.size.height + 5
        }
    }
    
    @IBAction func done(_ sender: UITextField) {
         sender.resignFirstResponder()
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
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
    
}


//extension UITextField {
//  func setBottomBorder() {
//    self.borderStyle = .none
//    self.layer.backgroundColor = UIColor.white.cgColor
//
//    self.layer.masksToBounds = false
//    self.layer.shadowColor = UIColor.gray.cgColor
//    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//    self.layer.shadowOpacity = 1.0
//    self.layer.shadowRadius = 0.0
//  }
//}


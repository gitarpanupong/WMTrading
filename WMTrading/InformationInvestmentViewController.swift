//
//  InformationInvestmentViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 14/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class InformationInvestmentViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var tableView: UITableView!
    
    var checktextbox: [[String:Any]] = []
    var InvestData: [[String:String]] = []
    var selectedRowIndex = -1
    var selectSectionIndex = -1
    var selectedIndex: [[String:Any]] = []
      var selectedSection: [Int] = []
   //  var selectedIndexes = [ [IndexPath.init(row: 0, section: 1)],[IndexPath.init(row: 0, section: 2)],[IndexPath.init(row: 0, section: 4)],[IndexPath.init(row: 0, section: 5)],[IndexPath.init(row: 0, section: 6)],[IndexPath.init(row: 0, section: 7)],[IndexPath.init(row: 0, section: 8)]]
    var selectedIndexs : [Int:Int]?
     var isCollapce = false
    @IBOutlet weak var btnNextPage: UIButton!
    
   // var Dataheader : [String] = ["วัตถุประสงค์การลงทุน","ประสบการณ์การลงทุน","ท่านเป็นผู้มีความบกพร่องทางการได้ยิน การมองเห็น   หรือทางร่างกายหรือไม่","แหล่งที่มาของเงิน/แบ่งตามประเภทรายได้","จำนวนเงินที่นำมาทำธุรกรรม","มีประวัติการกระทำความผิดตามกฎหมายฟอกเงินในช่วง 3 ปีที่ผ่านมา","เป็นนักการเมืองหรือเป็นผู้เกี่ยวข้องกับนักการเมือง","บิดา/มารดา มีส่วนเกี่ยวข้องกับการเมือง"]
    
   // var Dataname: [[String:String]] = [["Question":"วัตถุประสงค์การลงทุน":"Answer":]]
    
    
    var Data : [[String]] = [["เพิ่มผลตอบแทน / เพื่อสร้างกำไร",
    "ความมั่นคงของบุคคลในครอบครัว",
    "ออมเงิน / ออมเงินระยะยาว",
    "ใช้จ่ายยามเกษียณ",
    "เพื่อซื้อสินทรัพย์อื่น เช่น บ้าน รถ ที่ดิน",
    "การลงทุนระยะสั้น",
    "การลงทุนระยะยาว",
    "ผลประโยชน์ทางภาษี",
    "กระจายความเสี่ยง",
    "ป้องกันความเสี่ยง",
    "สวัสดิการพนักงาน",
    "เพื่อการศึกษา",
    "รายได้ประจำ",
    "เพื่อธุรกิจ",
    "อื่นๆ"],["ไม่เคยลงทุน","เคยลงทุนมาแล้ว 1 - 3 ปี","เคยลงทุนมาแล้วมากกว่า 3 ปี"],["ไม่ใช่","ใช่"],["เงินเดือน / ค่าจ้าง / เงินบำเหน็จ",
    "ธุรกิจ/ธุรกิจส่วนตัว ระบุธุรกิจ",
    "ขายสินทรัพย์ ระบุสินทรัพย์",
    "การขายหลักทรัพย์ / ตราสารเงิน / อสังหาริมทรัพย์",
    "เงินปันผล / ดอกเบี้ย / เงินออม",
    "มรดก / ของขวัญ",
    "การลงทุน",
    "ค้าของเก่า",
    "ค่าตอบแทนการให้บริการ",
    "เงินเกษียณ",
    "ค่าเช่า",
    "ให้กู้ยืม",
    "ค่าที่ปรึกษา",
    "ค่าคอมมิชชั่น",
    "อื่นๆ"],["น้อยกว่า 1 ล้าน","1 - 3 ล้าน" ,"3 - 5 ล้าน", "5 - 10 ล้าน", "มากกว่า 10 ล้าน"],["ไม่เคย","เคย"],["ไม่ใช่","ใช่"],["ไม่ใช่","ใช่"]]
    
    var Dataheader : [String] = ["วัตถุประสงค์การลงทุน","ประสบการณ์การลงทุน","ท่านเป็นผู้มีความบกพร่องทางการได้ยิน การมองเห็น  หรือทางร่างกายหรือไม่","แหล่งที่มาของเงิน/แบ่งตามประเภทรายได้","จำนวนเงินที่นำมาทำธุรกรรม","มีประวัติการกระทำความผิดตามกฎหมายฟอกเงินในช่วง 3 ปีที่ผ่านมา","เป็นนักการเมืองหรือเป็นผู้เกี่ยวข้องกับนักการเมือง","บิดา/มารดา มีส่วนเกี่ยวข้องกับการเมือง"]
    
    let DataQuestion =  [[["Question":"วัตถุประสงค์การลงทุน"],["Answer":"เพิ่มผลตอบแทน / เพื่อสร้างกำไร"],["Answer":"ความมั่นคงของบุคคลในครอบครัว"],
       ["Answer":"ออมเงิน / ออมเงินระยะยาว"],
       ["Answer":"ใช้จ่ายยามเกษียณ"],
       ["Answer":"เพื่อซื้อสินทรัพย์อื่น เช่น บ้าน รถ ที่ดิน"],
       ["Answer":"การลงทุนระยะสั้น"],
       ["Answer":"การลงทุนระยะยาว"],
       ["Answer":"ผลประโยชน์ทางภาษี"],
       ["Answer":"กระจายความเสี่ยง"],
       ["Answer":"ป้องกันความเสี่ยง"],
       ["Answer":"สวัสดิการพนักงาน"],
       ["Answer":"เพื่อการศึกษา"],
       ["Answer":"รายได้ประจำ"],
       ["Answer":"เพื่อธุรกิจ"],
       ["Answer":"อื่นๆ","Textbox":"Yes"]],
                         
        [["Question":"ประสบการณ์การลงทุน"],
         ["Answer":"ไม่เคยลงทุน"],
         ["Answer":"เคยลงทุนมาแล้ว 1 - 3 ปี"],
         ["Answer":"เคยลงทุนมาแล้วมากกว่า 3 ปี"]],
        
        [["Question":"ท่านเป็นผู้มีความบกพร่องทางการได้ยิน การมองเห็น   หรือทางร่างกายหรือไม่"],
         ["Answer":"ไม่ใช่"],["Answer":"ใช่"]]
        
        ,[["Question":"แหล่งที่มาของเงิน/แบ่งตามประเภทรายได้"],["Answer":"เงินเดือน / ค่าจ้าง / เงินบำเหน็จ"],
          ["Answer":"ธุรกิจ/ธุรกิจส่วนตัว ระบุธุรกิจ","Textbox":"Yes"],
        ["Answer":"ขายสินทรัพย์ ระบุสินทรัพย์","Textbox":"Yes"],
        ["Answer":"การขายหลักทรัพย์ / ตราสารเงิน / อสังหาริมทรัพย์"],
        ["Answer":"เงินปันผล / ดอกเบี้ย / เงินออม"],
        ["Answer":"มรดก / ของขวัญ"],
        ["Answer":"การลงทุน"],
        ["Answer":"ค้าของเก่า"],
        ["Answer":"ค่าตอบแทนการให้บริการ"],
        ["Answer":"เงินเกษียณ"],
        ["Answer":"ค่าเช่า"],
        ["Answer":"ให้กู้ยืม"],
        ["Answer":"ค่าที่ปรึกษา"],
        ["Answer":"ค่าคอมมิชชั่น"],
        ["Answer":"อื่นๆ","Textbox":"Yes"]],
         
         [["Question":"จำนวนเงินที่นำมาทำธุรกรรม"],["Answer":"น้อยกว่า 1 ล้าน"],["Answer":"1 - 3 ล้าน"],["Answer":"3 - 5 ล้าน"],["Answer":"5 - 10 ล้าน"],["Answer":"มากกว่า 10 ล้าน"]] ,
         [["Question":"มีประวัติการกระทำความผิดตามกฎหมายฟอกเงินในช่วง 3 ปีที่ผ่านมา"],["Answer":"ไม่เคย"],["Answer":"เคย","Textbox":"Yes"]],
         [["Question":"เป็นนักการเมืองหรือเป็นผู้เกี่ยวข้องกับนักการเมือง"],["Answer":"ไม่ใช่"],["Answer":"ใช่","Textbox":"Yes"]],
         [["Question":"บิดา/มารดา มีส่วนเกี่ยวข้องกับการเมือง"],["Answer":"ไม่ใช่"],["Answer":"ใช่","Textbox":"Yes"]]
        ]
    
  //  let getData: [[String]] = [["เพิ้มผลตอบแทน","ใช้จ่ายยามเกษียณ"],["ไม่เคยลงทุน"]]
    var countAnswer: Int = 0

    var getAnswer: [[String]] = []
    
    var chooseData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.setAnimationsEnabled(false)
        
        //  print("count ",DataQuestion[0]["Question"].count)
      //  print("count ",DataQuestion[0].flatMap({ $0["Question"] }).count)
    
       
    }
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationInvestCell", for: indexPath) as! InformationInvestmentTableViewCell
        
      //  print(indexPath.row," Quest ",DataQuestion[0][indexPath.row+1]["Answer"])
     
        

        let textField = UITextField(frame: CGRect(x: 20, y: 50, width: 350, height: 30))
        
               textField.placeholder = "  Enter text here"
               textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
               textField.layer.cornerRadius = 5
               textField.font = UIFont.systemFont(ofSize: 17)
      
            cell.lblData.text = DataQuestion[indexPath.section][indexPath.row+1]["Answer"]
    
        if selectedIndex.contains(where: { $0["IndexPath"] as! IndexPath == indexPath }) {
//                if Data[indexPath.section][indexPath.row] == "อื่นๆ" {
//                    selectedRowIndex = indexPath.row
//                    selectSectionIndex = indexPath.section
//                    self.isCollapce = true
//                    cell.addSubview(textField)
//                }
            if DataQuestion[indexPath.section][indexPath.row+1]["Textbox"] != nil  {
                            selectedRowIndex = indexPath.row
                            selectSectionIndex = indexPath.section
                            self.isCollapce = true
                            cell.addSubview(textField)
                        }
            cell.accessoryType = .checkmark
           
        }else {
           
             cell.accessoryType = .none
        }

       
        cell.selectionStyle = .none

       
//    if let index2 = checktextbox.firstIndex(where: { $0["indexPath"] as! IndexPath == indexPath }) {
//
//             cell.addSubview(textField)
//
//        }
        
        
    
        cell.layer.borderWidth = 0.23
        cell.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        return cell
        
    }
    
 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex && indexPath.section == selectSectionIndex && isCollapce == true && selectedIndex.contains(where: { $0["IndexPath"] as! IndexPath == indexPath }) {
      //  if let index2 = checktextbox.firstIndex(where: { $0["indexPath"] as! IndexPath == indexPath }) {
            return 95
        }

        return 50
        
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           
           return 60
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        
        return DataQuestion[section].flatMap({ $0["Answer"] }).count
           // return Data[section].count
       
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationInvestCell", for: indexPath) as! InformationInvestmentTableViewCell

        
     
      
        
        
//        let count = selectedIndex.filter{$0["Section"] as! Int == 1}.count
//
//        if count > 0 {
//            if  let index = selectedIndex.firstIndex(where: { $0["Section"] as! Int == 1 }) {
//                reloadSection = selectedIndex[index]["Section"] as! Int
//                reloadRow = selectedIndex[index]["Row"] as! Int
//
//                //selectedIndex.remove(at: index)
//
//                print(index," index ",selectedIndex ,"selectedIndex")
//                //cell?.accessoryType = .none
//                selectedIndex.remove(at: index)
//             //self.tableView.reloadData()
//                tableView.reloadRows(at: [[reloadSection, reloadRow]], with: .none)
//           // print("index ",[selectedIndex[index]["Section"] as! Int,selectedIndex[index]["Row"] as! Int])
//            }
//        }
//        if indexPath.section == 1 {
//            if  let index = selectedIndex.firstIndex(where: { $0["Section"] as! IndexPath == [indexPath.section,0] }) {
//                let reloadindexPath = selectedIndex[index]["Section"] as! IndexPath
//
//                print("yes getit ",reloadindexPath)
//
//               // selectedIndex.removeAll { $0["Section"] == reloadindexPath }
//                selectedIndex.remove(at: index)
//                tableView.reloadRows(at: [reloadindexPath], with: .none)
//
//
//
//            }
//        }

        
        if indexPath.section != 0 && indexPath.section != 3 {
            
            if  let index = selectedIndex.firstIndex(where: { $0["Section"] as! Int == indexPath.section })  {
                let reloadindexPath = selectedIndex[index]["IndexPath"] as! IndexPath
                selectedIndex.remove(at: index)
                tableView.reloadRows(at: [reloadindexPath] , with: .none)
            }
        }
        
        
            if let index = selectedIndex.firstIndex(where: { $0["IndexPath"] as! IndexPath == indexPath }) {
               // selectedIndex.removeAll{ $0["Data"] as! String == Data[indexPath.section][indexPath.row] }
                 selectedIndex.remove(at: index)
               
            }else {
                selectedIndex.append(["IndexPath": indexPath,"Section": indexPath.section ,"Data": Data[indexPath.section][indexPath.row]])
               // print("get Answer ",getAnswer)
            }

        
        tableView.reloadRows(at: [indexPath], with: .none)
        
//        print("indexPath ",indexPath)
//
//        checkTextbox(name: DataQuestion[indexPath.section][indexPath.row+1]["Answer"] as! String , indexPath: indexPath)
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       // return DataQuestion[0].flatMap({ $0["Question"] }).count
        return Dataheader.count
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        headerView.layer.backgroundColor = #colorLiteral(red: 0.1675891876, green: 0.1996641159, blue: 0.2247056961, alpha: 1)
        
        let headerlabel = UILabel()
        //15
        headerlabel.frame = CGRect.init(x: 15, y: 0, width: headerView.frame.width - 20, height: headerView.frame.height + 35)
        let header = Dataheader[section]
      //  headerlabel.font = UIFont.boldSystemFont(ofSize: 18)
         headerlabel.font = UIFont.boldSystemFont(ofSize: 15)
       // headerlabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
       // headerlabel.adjustsFontSizeToFitWidth = true
        
       // headerlabel.adjustsFontSizeToFitWidth = true
        let paragraphStyle = NSMutableParagraphStyle()
              paragraphStyle.lineSpacing = 7
        let attrString = NSMutableAttributedString(string: header)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
                headerlabel.attributedText = attrString
        headerlabel.minimumScaleFactor = 0.5
       
        headerlabel.numberOfLines = 0
        headerlabel.lineBreakMode = .byWordWrapping
      
        
        headerlabel.text = header
        headerlabel.textColor = #colorLiteral(red: 0.3204850554, green: 0.6859720349, blue: 0.7579422593, alpha: 1)
        
        
        headerView.addSubview(headerlabel)
        
         return headerView
    }
   
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        
       guard let firstVC = segue.destination as? QuestionnaireViewController else { return }
                 firstVC.QuestionaireData = InvestData
      
/*
        
       for (index, name) in selectedIndex.enumerated()
        {
            if let index2 = selectedIndex.firstIndex(where: { $0["Section"] as! Int == index }) {
              print(index," count ",selectedIndex.filter{$0["Section"] as! Int == index2}.count)
                countAnswer = index
            }
           // print(index," count ",selectedIndex.filter{$0["Section"] as! Int == index}.count)
        }
        
        
        if countAnswer < 7{
            let alertController = UIAlertController(title: "กรุณาตรวจสอบความถูกต้องของข้อมูลต่อไปนี้", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: {action in }))
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            guard let firstVC = segue.destination as? QuestionnaireViewController else { return }
            firstVC.QuestionaireData = InvestData
        }
    */
        
//        let dictionary = selectedIndex.reduce(into: [:]) { counts, number in
//            counts[number as! Int, default: 0] += 1
//        }
   
    }

    
    /*
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == Dataheader.count-1 {
            return 100
        }else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        guard section == Dataheader.count-1 else { return nil } // Can remove if want button for all sections

        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
            let myButton = UIButton(type: .custom)

            myButton.setTitle("ต่อไป", for: .normal)
            myButton.addTarget(self, action: #selector(myAction(_:)), for: .touchUpInside)
          
            myButton.setTitleColor(UIColor.white, for: .normal) //set the color this is may be different for iOS 7
            myButton.frame = CGRect(x: 0, y: 0, width: 130, height: 30) //set some large width to ur title
            myButton.translatesAutoresizingMaskIntoConstraints = false
        
           
        
            myButton.center = footerView.center
            footerView.addSubview(myButton)
            return footerView;

    }
*/
   @objc func myAction(_ sender : AnyObject) {

    }

    
    func checkTextbox(name: String,indexPath: IndexPath){
        
        print(name," name ",indexPath)
        
        if let index = checktextbox.firstIndex(where: {$0["indexPath"] as! IndexPath == indexPath}){
            checktextbox.remove(at: index)
        }else {
            
            if name == "อื่นๆ" {
                checktextbox.append(["Select":true,"indexPath": indexPath,"Text": "โปรดระบุ"])
            }else {
                
            }
            
        }
        
      //  tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == Dataheader.count {
//            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
//            return footerView
//        }
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

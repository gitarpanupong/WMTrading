//
//  SelectAMCViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 13/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class SelectAMCViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   
    @IBOutlet weak var btnNextpage: UIButton!
    @IBOutlet weak var btnFastBuy: UIButton!
    @IBOutlet weak var conditionButton: UIButton!
    
    var checkCountry = true
    

    @IBOutlet weak var tableView: UITableView!
    
    let headerData: [String] = ["ท่านสามารถเลือก \"ซื้อด่วนจี๋\" กับ บลจ. เหล่านี้ได้","บลจ. อื่นๆ"]
    
  //  let DataName = [["KAsset","TMBAM","ONEAM"], ["SCBAM","KTAM","KSAM","LHFUND","MAMT","MFC","PAMC","PhatraAM","PRINCIPAL","SKFM","T-FUND","TALISAM","UOBAM"]]
    
    // let DataFullName = [["บลจ. กสิกรไทย จำกัด","บลจ. ทหารไทย จำกัด"," บลจ. วรรณ จำกัด"], ["บลจ. ไทยพาณิชย์ จำกัด","บลจ. กรุงไทย จำกัด (มหาชน)","บลจ. กรุงศรี จำกัด","บลจ. แลนด์ แอนด์ เฮ้าส์ จำกัด","บลจ. แมนูไลฟ์ (ประเทศไทย) จำกัด","บลจ. เอ็มเอฟซี จำกัด (มหาชน)","บลจ.รวม ฟิลลิป จำกัด","บลจ. ภัทร จำกัด","บลจ. พรินซิเพิล จำกัด","บลจ. สยาม ไนท์ ฟันด์ แมเนจเม้นท์ จำกัด","บลจ. ธนชาต จำกัด","บลจ. ทาลิส จำกัด","บลจ. ยูโอบี (ประเทศไทย) จำกัด"]]
    
    let DataName = [[["Headername": "KAsset","Fullname": "บลจ. กสิกรไทย จำกัด","Condition":"กรณีเปิดชีกองทุนกับ บลจ.กสิกรไทย หากไม่มีการลงทุน ภายใน 2 เดือนนับจากวันที่ได้รับอนุมัติเปิดบัญชี ทางบลจ.จะดำเนินการระงับบัญชีชั่วคราว และจะทำการปิดบัญชีโดยอัตโนมัติ เมื่อไม่มีรายการเคลื่อนไหวหรือเมื่อมูลค่าพอร์ตการลงทุนเป็นศูนย์ติดต่อกันเกิน 1 ปี","Buy":"สถานะ: เปิดบัญชีเรียบร้อย","FastBuy": "Yes"],
        ["Headername":"TMBAM","Fullname":"บลจ. ทหารไทย จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย","FastBuy": "Yes"],
        ["Headername":"ONEAM","Fullname":"บลจ. วรรณ จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย","FastBuy": "Yes"]],
        [["Headername":"CLF","Fullname":"บลจ. แคปปิตอล ลิ้งค์ จำกัด","Condition":"บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"ABERDEEN","Fullname":"บลจ. อเบอร์ดีน จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"IAM","Fullname":"บลจ. อินโนเทค จำกัด","Condition":"บลจ.นี้อยู่ระหว่างพัฒนาและปรับปรุงระบบงานภายในบริษัทฯ จึงทำให้ไม่สามารถรับคำขอเปิดบัญชีและคำสั่งซื้อในช่วงนี้ได้","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"SCBAM","Fullname":"บลจ. ไทยพาณิชย์ จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"KTAM","Fullname":"บลจ. กรุงไทย จำกัด (มหาชน)","Condition":"บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"KSAM","Fullname":"บลจ. กรุงศรี จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"LHFUND","Fullname":"บลจ. แลนด์ แอนด์ เฮ้าส์ จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"MAMT","Fullname":"บลจ. แมนูไลฟ์ (ประเทศไทย) จำกัด","Condition":"บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์","Buy":"สถานะ: รอเอกสาร"],
         ["Headername":"MFC","Fullname":"บลจ. เอ็มเอฟซี จำกัด (มหาชน)","Condition":"บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"PAMC","Fullname":"บลจ.รวม ฟิลลิป จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"PhatraAM","Fullname":"บลจ. ภัทร จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"PRINCIPAL","Fullname":"บลจ. พรินซิเพิล จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"SKFM","Fullname":"บลจ. สยาม ไนท์ ฟันด์ แมเนจเม้นท์ จำกัด","Condition":"- บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์ - บลจ.นี้มีกองทุนส่วนใหญ่เป็นกองทุน ที่ไม่ใช่สำหรับนักลงทุนรายย่อย และเป็นกองทุนที่มีขั้นต่ำสูง","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"T-FUND","Fullname":"บลจ. ธนชาต จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"TALISAM","Fullname":"บลจ. ทาลิส จำกัด","Condition":"บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"],
         ["Headername":"UOBAM","Fullname":"บลจ. ยูโอบี (ประเทศไทย) จำกัด","Buy":"สถานะ: เปิดบัญชีเรียบร้อย"]] ]
    
    var FirstData: [[String]] = [["LHFUND","บลจ. แลนด์ แอนด์ เฮ้าส์ จำกัด"],["KSAM","บลจ. กรุงศรี จำกัด"],["SCBAM","บลจ. แลนด์ แอนด์ เฮ้าส์ จำกัด"]]
    
     var Data: [[String]] = [["KTAM","บลจ. กรุงไทย จำกัด (มหาชน)"],["MFC","บลจ. เอ็มเอฟซี จำกัด (มหาชน)"],["SCBAM","บลจ. ไทยพาณิชย์ จำกัด"]]
    
    var selectedIndex: [[String:Any]] = []
    
    var SelectData: [[String]] = []
    var ChooseData: [[String:String]] = []
    
    @IBOutlet weak var selectAMCSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if checkCountry == false {
            tableView.allowsSelection = false
          
        }
        
        // Do any additional setup after loading the view.
        btnFastBuy.layer.cornerRadius = 5
  
   // selectAMCSegment.isHidden = true
      
         UIView.setAnimationsEnabled(false)
  
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataName[section].count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAMCCell", for: indexPath) as! SelectAMCTableViewCell
           
        cell.layer.borderWidth = 0.23
        cell.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//        let attributedString = NSMutableAttributedString(string: Data[indexPath.row][0]+Data[indexPath.row][1])
//        attributedString.append(NSAttributedString(string: Data[indexPath.row][1], attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 60), NSAttributedString.Key.foregroundColor: UIColor.white ]))
        
        
        
       /// var btnBuy = UIButton(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
      
        
        //btnBuy.setBackgroundImage("Checked", for: .normal)
       // let btnBuy = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        
        
        //headerlabel.font = UIFont.boldSystemFont(ofSize: 18)
        
//        if indexPath.section == 0 {
//            cell.btnOpenBuy.setTitle("ซื้อด่วนจี๋", for: .normal)
//        }
        
        if DataName[indexPath.section][indexPath.row]["FastBuy"] != nil {
            cell.btnOpenBuy.setTitle("ซื้อด่วนจี๋", for: .normal)
        }else {
             cell.btnOpenBuy.setTitle("เปิดพร้อมซื้อ", for: .normal)
        }
        
        let text = NSMutableAttributedString()
   
        text.append(NSAttributedString(string: DataName[indexPath.section][indexPath.row]["Headername"]!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 1), NSAttributedString.Key.font:  UIFont.boldSystemFont(ofSize: 13.0) ]))
        text.append(NSAttributedString(string: " "+DataName[indexPath.section][indexPath.row]["Fullname"]!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.3204850554, green: 0.6859720349, blue: 0.7579422593, alpha: 1), NSAttributedString.Key.font:  UIFont.boldSystemFont(ofSize: 12.0) ]))
      
        cell.amcName.attributedText = text
        cell.btnSelect.tag = indexPath.row
        //cell.btnSelect.indexPath = indexPath
        
        cell.btnSelect.addTarget(self, action: #selector(didTapCellButton(sender:)), for: .touchUpInside)
      
        cell.amcImage.layer.cornerRadius = 5
        
        cell.btnAlreadybuy.layer.cornerRadius = 0.5 *  cell.btnAlreadybuy.bounds.size.width
        cell.btnAlreadybuy.clipsToBounds = true
        
        if selectedIndex.contains(where: { $0["IndexPath"] as! IndexPath == indexPath }) {
          //  cell.btnSelect.setTitle("✓", for: .normal)
            cell.btnSelect.setTitleColor(UIColor.black, for: .normal)
            cell.btnSelect.setImage(UIImage(named:"checked"), for: .normal)
            cell.btnSelect.frame = CGRect(x:  cell.btnSelect.frame.origin.x, y: cell.btnSelect.frame.origin.y , width: 20,height: 20)
            cell.btnSelect.layer.cornerRadius = cell.btnSelect.bounds.size.width / 2
            cell.btnSelect.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
          //  cell.btnSelect.setBackgroundImage(UIImage(named:"correct2"), for: .normal)
        }else {
          //  cell.btnSelect.isSelected = false
         //   cell.btnSelect.setTitle("", for: .normal)
            cell.btnSelect.setImage(UIImage(named:"unchecked"), for: .normal)
            cell.btnSelect.frame = CGRect(x: cell.btnSelect.frame.origin.x , y: cell.btnSelect.frame.origin.y , width: 15,height: 15)
            cell.btnSelect.layer.cornerRadius = cell.btnSelect.bounds.size.width / 2
            cell.btnSelect.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        
        if DataName[indexPath.section][indexPath.row]["Condition"] != nil {
            cell.btnCondition.isHidden = false
        }else {
            cell.btnCondition.isHidden = true
        }
        
        cell.btnCondition.tag = indexPath.row
       // cell.btnCondition.addTarget(self, action: "buttonClicked:", for: UIControl.Event.touchUpInside)
        cell.btnCondition.addTarget([indexPath], action: #selector(btnAction(_:)), for: .touchUpInside)
    
     //   print("condition ",DataName[indexPath.section][indexPath.row]["Condition"])
        
//        if DataName[indexPath.section][indexPath.row].first(where: { $0["Condition"] == "บลจ.นี้มีนโยบายรับเปิดบัญชีกองทุน ที่มาพร้อมรายการซื้อเท่านั้น ท่านต้องบันทึกรายการซื้อหลังจากเปิดบัญชีกองทุน รายการจึงจะสมบูรณ์" }) {
//            cell.btnCondition.isHidden = false
//        }else {
//             cell.btnCondition.isHidden = true
//        }
//
        
       // let btnAlreadybuy = UIButton()
       // btnAlreadybuy.alpha = 0.2
       
//        cell.btnAlreadybuy.frame.size.width = 21
//        cell.btnAlreadybuy.frame.size.height = 21
//        cell.btnAlreadybuy.frame.origin.x = cell.amcImage.frame.origin.x + (cell.amcImage.frame.size.width - btnAlreadybuy.frame.size.width) + 5
//        cell.btnAlreadybuy.frame.origin.y = cell.amcImage.frame.origin.y - 5
        cell.btnAlreadybuy.layer.cornerRadius = 10
        cell.btnAlreadybuy.layer.borderWidth = 4
        cell.btnAlreadybuy.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        
        if DataName[indexPath.section][indexPath.row]["Buy"] == "สถานะ: เปิดบัญชีเรียบร้อย"  {
             cell.btnAlreadybuy.setBackgroundImage(UIImage(named:"correct"), for: .normal)
          //   cell.contentView.addSubview(btnAlreadybuy)
            
        }else if DataName[indexPath.section][indexPath.row]["Buy"] == "สถานะ: รอเอกสาร" {
            cell.btnAlreadybuy.setBackgroundImage(UIImage(named:"Wait"), for: .normal)
           //  cell.contentView.addSubview(btnAlreadybuy)
        }else {
            
        }
        
        cell.btnAlreadybuy.tag = indexPath.row
        cell.btnAlreadybuy.addTarget([indexPath], action: #selector(btnAlreadybuy(_:)), for: .touchUpInside)
       
       // cell.amcImage.image = UIImage(named: SelectData[indexPath.row][0])
        
        cell.amcImage.image = UIImage(named: DataName[indexPath.section][indexPath.row]["Headername"]!)
        cell.btnOpenBuy.layer.cornerRadius = 5
        cell.btnCondition.layer.cornerRadius = 5

        if checkCountry == false {
            cell.contentView.alpha = 0.3
        }
       
     // #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 1)
       // cell.amcFullname.text = Data[indexPath.row][1]
           
        return cell
    }

    @objc func btnAction(_ sender: UIButton) {
    
        let index = sender.tag
        let indexPath = NSIndexPath(row:index, section:1)
    //    let cell = tableView.cellForRow(at: indexPath as IndexPath) as! SelectAMCTableViewCell

        let alertController = UIAlertController(title: "เงื่อนไข บลจ.", message:  "\n"+DataName[indexPath.section][indexPath.row]["Condition"]!, preferredStyle: .alert)
                 
        alertController.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: {action in }))
                  self.present(alertController, animated: true, completion: nil)
        print(index," getCondition   ")
    }
    
    @objc func btnAlreadybuy(_ sender: UIButton) {
        let index = sender.tag
        let indexPath = NSIndexPath(row:index, section:1)
       // let cell = tableView.cellForRow(at: indexPath as IndexPath) as! SelectAMCTableViewCell
        
        let alertController = UIAlertController(title: "ท่านเคยเปิดบัญชีกับบลจ.นี้แล้ว", message:  "\n"+DataName[indexPath.section][indexPath.row]["Buy"]!, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: {action in }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func selectAMCSegmentControl(_ sender: UISegmentedControl) {
        switch selectAMCSegment.selectedSegmentIndex
            {
                case 0:
                    SelectData = FirstData
                    tableView.reloadData()
                case 1:
                    SelectData = Data
                    tableView.reloadData()
                default:
                    break
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAMCCell", for: indexPath) as! SelectAMCTableViewCell
        let cell = tableView.cellForRow(at: indexPath) as! SelectAMCTableViewCell
        
       // print("Select ",cell.amcFullname.text," \n",cell.amcName.text)
//        if ChooseData.containsSameElements(as: SelectData)) {
        
//        if ChooseData.contains(where: { $0 == SelectData[indexPath.row] }) {
//          // ChooseData.append(SelectData[indexPath.row])
//        }else {
//             ChooseData.append(SelectData[indexPath.row])
//        }
        
       if  let index = selectedIndex.firstIndex(where: { $0["IndexPath"] as! IndexPath == indexPath }){
            selectedIndex.remove(at: index)
        }
        
        if let index = ChooseData.firstIndex(of: DataName[indexPath.section][indexPath.row] ) {
            selectedIndex.removeAll(where: { $0["IndexPath"] as! IndexPath == indexPath })
            ChooseData.remove(at: index)
          //  cell.btnSelect.setTitle("", for: .normal)
            cell.btnSelect.setImage(UIImage(named:"unchecked"), for: .normal)
            cell.btnSelect.layer.cornerRadius = cell.btnSelect.bounds.size.width / 2
            cell.btnSelect.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            ChooseData.append(DataName[indexPath.section][indexPath.row])
            selectedIndex.append(["IndexPath": indexPath])
            cell.btnSelect.setImage(UIImage(named:"checked"), for: .normal)
            cell.btnSelect.layer.cornerRadius = cell.btnSelect.bounds.size.width / 2
            
           // cell.btnSelect.setTitle("✓", for: .normal)
          //  cell.btnSelect.setTitleColor(UIColor.black, for: .normal)
             cell.btnSelect.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         //    cell.btnSelect.backgroundColor = #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 1)
          //  cell.btnSelect.isSelected = true

            print("name ",DataName[indexPath.section][indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
        print("ChooseData ",ChooseData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       if ChooseData.isEmpty {
        let alertController = UIAlertController(title: "กรุณาตรวจสอบความถูกต้องของข้อมูลต่อไปนี้", message: "\nกรุณาเลือกอย่างน้อยหนึ่งบริษัทหลักทรัพย์จัดการกองทุน", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: {action in }))
            self.present(alertController, animated: true, completion: nil)
        }else {
            guard let firstVC = segue.destination as? FifthViewController else { return }
            firstVC.Data = ChooseData
        }
    }
   
    @objc func didTapCellButton(sender: UIButton) {
     //   let index = sender.tag
   //     let indexPath = NSIndexPath(row:index, section:1)
    //    let cell = tableView.cellForRow(at: indexPath as IndexPath) as! SelectAMCTableViewCell
      //  var name: String = cell.amcName.text!
    }
 
     func numberOfSections(in tableView: UITableView) -> Int {
         return headerData.count
     }

     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
         headerView.layer.backgroundColor = #colorLiteral(red: 0.2060739398, green: 0.2581427097, blue: 0.3039865196, alpha: 1)
         
         let headerlabel = UILabel()
         //15
         headerlabel.frame = CGRect.init(x: 12, y: 5, width: headerView.frame.width - 20, height: headerView.frame.height)
         let header = headerData[section]
         headerlabel.font = UIFont.boldSystemFont(ofSize: 13)
        // headerlabel.adjustsFontSizeToFitWidth = true
         headerlabel.minimumScaleFactor = 0.5
        
         headerlabel.numberOfLines = 0
         headerlabel.lineBreakMode = .byWordWrapping
       
         headerlabel.text = header
         headerlabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
         
        UIScreen.main.bounds.width
        //311
        let headerbutton = UIButton()
        headerbutton.frame = CGRect.init(x:  UIScreen.main.bounds.width-100, y: 10, width: 96, height: 22)
        headerbutton.setTitle("ซื้อด่วนจี๋ คืออะไร?", for: .normal)
        headerbutton.titleLabel?.font = .systemFont(ofSize: 11)
        headerbutton.setTitleColor(.white, for: .normal)
        headerbutton.backgroundColor = #colorLiteral(red: 0.271928966, green: 0.6427256465, blue: 0.71878016, alpha: 1)
        headerbutton.layer.cornerRadius = 5
         headerView.addSubview(headerlabel)
        if section == 0 {
            headerView.addSubview(headerbutton)
        }
       
        headerbutton.tag = section
        headerbutton.addTarget([section], action: #selector(Fastbuy(_:)), for: .touchUpInside)
        return headerView
     }
     @objc func Fastbuy(_ sender: UIButton) {
    let alertController = UIAlertController(title: "เงื่อนไข \"ซื้อด่วนจี๋\"", message:  "\n1. ผู้ใช้บริการกรอกรายละเอียดข้อมูลส่วนบุคคลในระบบคำขอเปิดบัญชีให้ถูกต้องและครบถ้วน \n2.เงินลงทุนขั้นต่ำตั้งแต่ 10,000 บาทขึ้นไป \n3.ผู้ใช้บริการสั่งพิมพ์ใบคำขอเปิดบัญชีและใบคำสั่งซื้อ ของ บริษัทหลักทรัพย์จัดการกองทุน ที่ต้องการซื้อพร้อมลงลายมือชื่อในใบคำขอเปิดบัญชีและใบคำสั่งซื้อ \n4.ผู้ใช้บริการสามารถส่งเอกสารใบคำขอเปิดบัญชี ใบคำสั่งซื้อ และเอกสารประกอบ โดยวิธีสแกนหรือถ่ายรูป และส่งผ่านช่องทาง อีเมล์ marketing@wealthmagik.com เพื่อขออนุมัติเปิดบัญชีแบบด่วน ได้ โดยบริษัทฯ สงวนสิทธิ์ ในการรับเปิดบัญชีพร้อมซื้อ และส่งเอกสารครบถ้วน ภายในเวลา 13.00 น. หากเลยเวลาที่กำหนด บริษัทฯ จะทำรายการให้ในวันทำการถัดไป \n5.ผู้ใช้บริการมีหน้าที่นำส่งต้นฉบับเอกสารใบคำขอเปิดบัญชี พร้อมสำเนาบัตรประจำตัวประชาชน และสำเนาหน้าสมุดบัญชีธนาคารหน้าแรก ที่ลงลายมือชื่อ โดยวิธีตามข้อ 3. ให้บริษัทฯ ภายใน 7 วันทำการ นับจากวันเปิดบัญชีสำเร็จ \n6.ผู้ใช้บริการสามารถทำรายการซื้อขายสับเปลี่ยน เพิ่มเติมได้ ต่อเมื่อ บริษัทฯ ได้รับเอกสารต้นฉบับที่ลงลายมือชื่อจากผู้ใช้บริการครบถ้วนรียบร้อยแล้ว \n7.กรณีที่ผู้ลงทุนซื้อกองทุน ที่เลยเวลากำหนดปิดรับคำสั่ง รายการจะมีผลในวันทำการถัดไป (ขึ้นอยู่กับเงื่อนไขเวลาปิดรับคำสั่งของแต่ละกองทุน) \n8.สำหรับการสมัครใช้บริการหักบัญชีอัตโนมัติ (Automatic Transfer System : ATS) จะต้องใช้เอกสารคำร้องขอต้นฉบับ และลงลายมือให้เหมือนกับที่ให้ไว้กับธนาคาร เท่านั้น \n9.เอกสารประกอบการเปิดบัญชี ประกอบด้วย \n•    ถ่ายรูปคู่กับบัตรประจำตัวประชาชน \n•    สำเนาบัตรประจำตัวประชาชน \n•    สำเนาหน้าสมุดบัญชีเงินฝากธนาคาร สำหรับ รับเงินค่าขายคืน/เงินปันผล และหักเงินค่าซื้อ \n•    Pay-in Slip หรือ หลักฐานแสดงการโอนเงินค่าซื้อหน่วยลงทุน", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: {action in }))
                        self.present(alertController, animated: true, completion: nil)
    }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 70
     }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
     }
    @IBAction func btnNextPage(_ sender: UIBarButtonItem) {
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

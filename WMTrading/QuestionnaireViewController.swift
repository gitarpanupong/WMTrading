//
//  QuestionnaireViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 16/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class QuestionnaireViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    let myImages = ["WMTrading","SCBAM","TMBAM","KTAM","KAsset","KSAM","LHFUND","MAMT","MFC","ONEAM","PAMC","PhatraAM","PRINCIPAL","SKFM","T-FUND","TALISAM","TMBAM","UOBAM"]
    
     var QuestionaireData: [[String:String]] = []
    var nextpagecheck = false
  //  var getSelect = false
    var getCount: Int?
    
    var getDataText: [String] = []
    
    var getCheck: [[String:Any]] = []
    var chooseData: [[String: Any]] = []
    var getData: [[String: Any]] = []
    var realData: [[String: Any]] = []
    var textfieldindex: [IndexPath] = []
  //  var selectedIndex: [[String:Any]] = []
    var getImage: [Any] = []
  
    let WealthMagik: [String] = ["ท่านรู้จัก บลน. WealthMagik ผ่านช่องทางใด (ตอบได้มากกว่า 1 ข้อ)", "ท่านต้องการจัดส่งเอกสารมายัง บลน. เว็ลธ์เมจิก ผ่านช่องทางใด"]
    
    let WealthMagikData: [[String]] = [["wealthmagik.com",
    "Google",
    "Facebook",
    "Line",
    "Instagram",
    "Twitter",
    "Youtube",
    "Event",
    "Wealth Advice 5 ขั้นมั่นใจลงทุน ",
    "เพื่อน/คนแนะนำ",
        "อื่นๆ"],["ไปรษณีย์","อื่นๆ"]]
    
 
    
    let KTAM: [String] = ["แหล่งที่มาของเงิน / แบ่งตามประเทศ"]
    let KTAMData: [[String]] = [[ "ประเทศไทย", "นอกประเทศ"]]
    
  
    let Dataname = [ ["WealthMagik","ท่านรู้จัก บลน. WealthMagik ผ่านช่องทางใด (ตอบได้มากกว่า 1 ข้อ)", "ท่านต้องการจัดส่งเอกสารมายัง บลน. เว็ลธ์เมจิก ผ่านช่องทางใด"],
                    ["KTAM","แหล่งที่มาของเงิน / แบ่งตามประเทศ"],
                    ["TMBAM","ต้องการรับข้อมูลผ่านทางอีเมล / SMS","ทรัพย์สินที่ถือครองในปัจจุบันได้มาจาก","แหล่งที่มาของเงิน / แบ่งตามประเทศ","จำนวนเงินที่คาดว่าจะนำเงินมาลงทุนในครั้งแรก (บาท)","การสมัครใช้บริการ"],
                    ["ONEAM","วิธีการจัดส่งเอกสาร","การสมัครใช้บริการ","ถูกปฏิเสธการรับทำธุรกรรมทางการเงินจากสถาบันการเงินอื่น","แหล่งที่มาของเงิน / แบ่งตามประเทศ"],
                ["KSAM","ถูกปฏิเสธการรับทำธุรกรรมทางการเงินจากสถาบันการเงินอื่น","จำนวนเงินที่ประสงค์หรือคาดว่าจะลงทุนครั้งแรกกับบริษัทจัดการ","ประเภทธุรกิจตามอาชีพของท่าน","แหล่งที่มาของเงิน / แบ่งตามประเทศ"],
                    ["T-FUND","วัตถุประสงค์การลงทุน","หลักทรัพย์และทรัพย์สินอื่น"],
                    ["SCBAM","แหล่งที่มาของเงิน/แบ่งตามประเทศ","ทรัพย์สินที่ถือครองในปัจจุบันได้มาจาก","บุคคลที่ตัดสินใจเกี่ยวกับการลงทุน","เคยลงทุนใน LTF / RMF","มีบัญชีเงินฝากของธนาคารไทยพาณิชย์ จำกัด (มหาชน) หรือไม่"],
                     ["KAsset","ระยะเวลาที่คาดว่าจะลงทุน","ภาระทางการเงินต่อปี","ถูกปฏิเสธการเปิดบัญชีจากบริษัทหลักทรัพย์อื่นๆ","บุคคลที่สามารถติดต่อได้"],
         ["MAMT","ลักษณะที่อยู่","ท่านต้องการรับเอกสาร หรือรายงานผ่านทางช่องทางใด","หลักทรัพย์ที่เคยลงทุน","พื้นฐานความรู้ / ความเข้าใจในการลงทุน","กองทุนที่สนใจจะลงทุน","รายได้ครอบครัวต่อเดือน","ท่านกำลังอยู่ในขั้นตอนพิทักษ์ทรัพย์หรือเป็นบุคคลล้มละลาย","ถูกปฏิเสธการรับทำธุรกรรมทางการเงินจากสถาบันการเงินอื่น","ข้อมูลของบุคคลที่สามที่เกี่ยวข้องกับการลงทุนของท่าน","ท่านหรือผู้รับผลประโยชน์ มีส่วนเกี่ยวข้องกับเขตดินแดนหรือประเทศที่ไม่มีมาตรการหรือไม่ได้ประยุกต์ใช้ข้อแนะนำของ FATF ในการกำหนดมาตรการทางการเงินเกี่ยวกับการป้องกันและปราบปรามการฟอกเงินและต่อต้านการสนับสนุนทางการเงินแก่การก่อการร้าย (non-FATF) รวมทั้งประเทศหรือเขตดินแดนที่มีข้อบกพร่องอย่างวิกฤติในระบบต่อต้านการฟอกเงินของตนหรือแสดงให้เห็นว่ามีความไม่เต็มใจที่จะร่วมมือในความพยายามต่อต้านการฟอกเงิน (NCCT) ดังต่อไปนี้","เป็นนักการเมืองหรือเป็นผู้เกี่ยวข้องกับนักการเมือง"],
         ["ABERDEEN","จำนวนเงินที่ประสงค์หรือคาดว่าจะลงทุนครั้งแรกกับบริษัทจัดการ","บุคคลที่สามารถติดต่อได้","ถูกปฏิเสธการรับทำธุรกรรมทางการเงินจากสถาบันการเงินอื่น","ขอใช้บริการจัดทำคำสั่งซื้อโดยบริษัทจัดการ (Fast Track)","การสมัครใช้บริการ"],
         ["UOBAM","แหล่งที่มาของเงิน / แบ่งตามประเทศ","ทรัพย์สินที่ถือครองในปัจจุบันได้มาจาก","ประสงค์จะรับ E-Confirmation Note และ E-Statement ผ่านอีเมล์","ท่านเคยลงทุนในหลักทรัพย์หรือไม่","พื้นฐานความรู้ / ความเข้าใจในการลงทุน","การยอมรับความเสี่ยงที่ท่านจะลงทุนในครั้งนี้"],
         ["PhatraAM","แหล่งที่มาของเงิน / แบ่งตามประเทศ","ถูกปฏิเสธการรับทำธุรกรรมทางการเงินจากสถาบันการเงินอื่น","จำนวนเงินที่ประสงค์หรือคาดว่าจะลงทุนครั้งแรกกับบริษัทจัดการ","เบอร์โทรศัพท์ที่ทำงาน / บ้าน","บุคคลที่ตัดสินใจเกี่ยวกับการลงทุน"],
         ["MFC","ช่องทางการรับเอกสารการทำธุรกรรม","ทรัพย์สินที่ถือครองในปัจจุบันได้มาจาก","แหล่งที่มาของเงิน / แบ่งตามประเทศ","ภาระทางการเงินต่อปี"],
         ["PAMC","จำนวนเงินที่นำมาทำธุรกรรม","ท่านเคยลงทุนในหลักทรัพย์หรือไม่","พื้นฐานความรู้ / ความเข้าใจในการลงทุน","การยอมรับความเสี่ยงที่ท่านจะลงทุนในครั้งนี้","บริษัทหลักทรัพย์จัดการกองทุนรวมอื่นที่ท่านใช้หรือเคยใช้บริการ","ท่านหรือผู้รับผลประโยชน์ มีส่วนเกี่ยวข้องกับเขตดินแดนหรือประเทศที่ไม่มีมาตรการหรือไม่ได้ประยุกต์ใช้ข้อแนะนำของ FATF ในการกำหนดมาตรการทางการเงินเกี่ยวกับการป้องกันและปราบปรามการฟอกเงินและต่อต้านการสนับสนุนทางการเงินแก่การก่อการร้าย (non-FATF) รวมทั้งประเทศหรือเขตดินแดนที่มีข้อบกพร่องอย่างวิกฤติในระบบต่อต้านการฟอกเงินของตนหรือแสดงให้เห็นว่ามีความไม่เต็มใจที่จะร่วมมือในความพยายามต่อต้านการฟอกเงิน (NCCT) ดังต่อไปนี้","ถูกปฏิเสธการรับทำธุรกรรมทางการเงินจากสถาบันการเงินอื่น"],
         ["TALISAM","แหล่งที่มาของเงิน / แบ่งตามประเทศ","ขอสมัครใช้ธุรกรรมทางอินเตอร์เน็ต ทั้งนี้ บริษัทจัดการจะใช้ E-mail Address ตามที่ผู้ขอเปิดบัญชีได้ระบุไว้"]
                    ]
   
    var DataAnswer = [[["WealthMagik"],["wealthmagik.com",
    "Google",
    "Facebook",
    "Line",
    "Instagram",
    "Twitter",
    "Youtube",
    "Event",
    "Wealth Advice 5 ขั้นมั่นใจลงทุน ",
    "เพื่อน/คนแนะนำ",
        "อื่นๆ"],["ไปรษณีย์","อื่นๆ"]],
        [["KTAM"],["ประเทศไทย","นอกประเทศ"]],
    [["TMBAM"],["ใช่","ไม่ใช่"],["เงินเดือน","เงินออม","การขายอสังหาริมทรัพย์ / สังหาริมทรัพย์","การประกอบธุรกิจส่วนตัว","อื่นๆ","รวมมูลค่าทรัพย์สินประมาณ"], ["ประเทศไทย","นอกประเทศ"],["น้อยกว่า 1 แสน","1 แสน - 1 ล้าน ","1 - 3 ล้าน","3 - 10 ล้าน", "10 - 20 ล้าน","มากกว่า 20 ล้าน"],["ขอสมัครใช้ธุรกรรมทางอินเตอร์เน็ต"] ],
    [["ONEAM"],["ไปรษณีย์","อีเมล"],["ขอใช้บริการซื้อขายหน่วยลงทุนผ่านทางอิเล็กทรอนิกส์ (ONE-LIVE)","ขอใช้บริการยืนยันการทารายการทางอิเล็กทรอนิกส์ (E-Confirm)","ขอใช้บริการรับข่าวสาร (E-NEWS)","ขอใช้บริการรับข่าวโปรโมชั่น (E-PROMOTION)","ขอใช้บริการส่งคาสั่งซื้อขายหน่วยลงทุนผ่านทางโทรสารและอีเมล์ (FAX , E-Mail)","ขอใช้บริการซื้อหน่วยลงทุนโดยการหักบัญชีอัตโนมัติเป็นประจำทุกเดือน AMP"],["เคย","ไม่เคย"],["ประเทศไทย","นอกประเทศ"]],
    [["KSAM"],["เคย","ไม่เคย"],[""],[""],["ประเทศไทย","นอกประเทศ"]],
    [["T-FUND"],["ได้รับผลตอบแทนสม่ำเสมอ","ต้องการผลตอบแทนที่ดี และยอมรับความผันผวนของเงินลงทุนที่อาจมีผลขาดทุนได้ไม่มากนัก","ต้องการผลตอบแทนสูง และยอมรับความผันผวนของเงินลงทุนที่อาจมีผลขาดทุนได้มาก"],["บ้าน / ที่ดิน / สิ่งปลูกสร้าง","เครื่องประดับ / อัญมณี","รถยนต์","อื่นๆ","รวมมูลค่าทรัพย์สินประมาณ"]],
    [["SCBAM"],["ประเทศไทย","นอกประเทศ"],["เงินเดือน / เงินออม","มรดก","การขายอสังหาริมทรัพย์ / สังหาริมทรัพย์","การประกอบธุรกิจส่วนตัว","อื่นๆ","รวมมูลค่าทรัพย์สินประมาณ"],["ตนเอง","บุคคลอื่น"],["เคย","ไม่เคย"],["มี","ไม่มี"]],
     [["KAsset"],["น้อยกว่า 6 เดือน","6 เดือน - 1 ปี","1 ปี - 5 ปี","มากกว่า 5 ปีขึ้นไป"],[""],["เคย","ไม่เคย"],["ชื่อ-นามสกุล","ความสัมพันธ์กับผู้ลงทุน/ผู้ถือหน่วยลงทุน"]],
     [["MAMT"],["เจ้าของบ้าน","เจ้าของบ้าน(ผ่อน)","เป็นผู้อาศัย","บ้านเช่า","อื่นๆ"],["รับข้อมูลด้วยตนเอง","รับข้อมูลจัดส่งทางไปรษณีย์"],["หุ้น","เงินฝาก หรือพันธบัตร","หุ้นกู้ภาคเอกชน หรือกองทุนรวมตราสารหนี้","ตราสารอนุพันธ์","กองทุนที่มีสัดส่วนการลงทุนในหุ้น","ลงทุนในกิจการของตัวเองหรือลงทุนร่วมกับญาติ / เพื่อน","ลงทุนในทรัพย์สินมีค่า เช่นทองคำ","ลงทุนในที่ดิน"],["ดีมาก","ดี","ปานกลาง","น้อย","ไม่มี"],["กองทุนรวมตราสารทุน","กองทุนรวมหุ้นระยะยาว LTF","กองทุนรวมเพื่อการเลี้ยงชีพ RMF","กองทุนรวมตราสารหนี้","กองทุนรวมผสม","กองทุนรวมที่ลงทุนในต่างประเทศ","อื่นๆ"],["ต่ำกว่า 150,000","150,000 - 300,000","300,001 - 1,500,000","1,500,001 - 3,000,000","มากกว่า 3,000,000"],["ใช่","ไม่ใช่"],["เคย","ไม่เคย"],["ท่านไม่มีการทำธุรกรรมที่เกี่ยวข้องกับบุคคลที่สาม","ท่านทำธุรกรรมแทนบุคคลที่สาม","บุคคลที่สามให้การสนับสนุนเงินลงทุนของท่าน","บุคคลที่สามเป็นผู้ควบคุมการลงทุนของท่านในฐานะผู้รับผลประโยชน์ (หมายถึง บุคคลซึ่งเป็นผู้รับผลประโยชน์ทอดสุดท้าย หรือเป็นผู้ควบคุม / ตัดสินใจในการทำธุรกรรมหรือการลงทุนของบัญชีลูกค้า)"],["สัญชาติ แหล่งเงิน ถิ่นที่อยู่ สถานที่ประกอบธุรกิจ สถานที่ติดต่อ","แหล่งที่มาของเงินลงทุน"],["ใช่","ไม่ใช่"]],
        [["ABERDEEN"],[""],["",""],["เคย","ไม่เคย"],["ข้าพเจ้ามีความประสงค์สมัครใช้บริการ Fast Track โดยขอมอบอำนาจให้บริษัทจัดการจัดทำแบบคำสั่งซื้อหน่อยลงทุน และยินยอมปฏิบัติตามข้อตกลงและเงื่อนไงของการใช้บริการตามที่แนบมาพร้อมแบบคำขอเปิดบัญชีกองทุนนี้ ซึ่งข้าพเจ้าได้รับสำเนาไว้เรียบร้อยแล้ว"],["ข้าพเจ้ามีความประสงค์สมัครใช้บริการ e-avenue โดยยินยอมปฏิบัติตามข้อตกลงและเงื่อนไขของการใช้บริการตามที่แนบมาพร้อมแบบคำขอเปิดบัญชีกองทุนนี้ ซึ่งข้าพเจ้าได้รับสำเนาไว้เรียบร้อยแล้ว"]],
        [["UOBAM"],["ประเทศไทย","นอกประเทศ"],["เงินเดือน / เงินออม","มรดก","การขายอสังหาริมทรัพย์ / สังหาริมทรัพย์","การประกอบธุรกิจส่วนตัว","อื่น ๆ","รวมมูลค่าทรัพย์สินประมาณ : "],["ใช่","ไม่ใช่"],["ใช่","ไม่ใช่"],["น้อย","ปานกลาง","ดี"],["น้อย","ปานกลาง","มาก"]],
        [["PhatraAM"],["ประเทศไทย","นอกประเทศ"],["เคย","ไม่เคย"],[""],[""],["ตนเอง","บุคคลอื่น"]],
        [["MFC"],["ไปรษณีย์","อีเมล","SMS","ไม่ขอรับรายงาน / เอกสารใดๆ"],["เงินเดือน / เงินออม","มรดก","การขายอสังหาริมทรัพย์ / สังหาริมทรัพย์","การประกอบธุรกิจส่วนตัว","อื่น ๆ","รวมมูลค่าทรัพย์สินประมาณ"],["ประเทศไทย","นอกประเทศ"],[""]],
        [["PAMC"],[""],["ใช่","ไม่ใช่"],["น้อย","ปานกลาง","ดี"],["น้อย","ปานกลาง","มาก"],["มี","ไม่มี"],["สัญชาติ แหล่งเงิน ถิ่นที่อยู่ สถานที่ประกอบธุรกิจ สถานที่ติดต่อ"],["เคย","ไม่เคย"]],
        [["TALISAM"],["ประเทศไทย","นอกประเทศ"],["สมัคร","ไม่สมัคร"]]
        
        
                    ]
  
    
      let checkcount = ["ท่านรู้จัก บลน. WealthMagik ผ่านช่องทางใด (ตอบได้มากกว่า 1 ข้อ)","ทรัพย์สินที่ถือครองในปัจจุบันได้มาจาก","การสมัครใช้บริการ","วัตถุประสงค์การลงทุน","หลักทรัพย์และทรัพย์สินอื่น","หลักทรัพย์ที่เคยลงทุน","กองทุนที่สนใจจะลงทุน"]
    
   
   
    
    //CLF, IAM, LHFUND,PRINCIPAL,SKFM
    
    var Tappedimage: [Any] = []
    
    
    var Data: [[String]] = []
   // var DataHeader: [String] = []
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lblHeaderName: UILabel!
    @IBOutlet weak var lblHeaderFullName: UILabel!
    var DataBefore: String?
    struct Category {
        let name : String
        let questions : [String]

    }
     var categories = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // navigationController
        imageScrollView.flashScrollIndicators()
    
    //categories = [Category(name:"WealthMagik", questions: ["ท่านรู้จัก บลน. WealthMagik ผ่านช่องทางใด (ตอบได้มากกว่า 1 ข้อ)", "ท่านต้องการจัดส่งเอกสารมายัง บลน. เว็ลธ์เมจิก ผ่านช่องทางใด"])]
        
      //  let index = DataAnswer2.contains(where: {$0[""]})
        
       // print("HA ",DataAnswer2[0][0])
        
        tableView.delegate = self
        tableView.dataSource = self
     
        
        QuestionaireData.insert(["Headername": "WealthMagik","Fullname":"บริษัทหลักทรัพย์นายหน้าซื้อขายหน่วยลงทุน เว็ลธ์ เมจิก จำกัด"], at:0)
        
        tableView.keyboardDismissMode = .onDrag
      
      
//        let getVC = DeductAccountViewController()
//        QuestionaireData = getVC.DeductData
        tableView.estimatedRowHeight = 100
         tableView.rowHeight = UITableView.automaticDimension
        
      //  tableView.sectionHeaderHeight = UITableView.automaticDimension
    tableView.estimatedSectionHeaderHeight = 1;
        
        UIView.setAnimationsEnabled(false)
      
       // tableView.sectionHeaderHeight = 0
     //   self.tableView.sectionHeaderHeight = UITableView.automaticDimension;
       // tableView.estimatedSectionHeaderHeight = 60
//        tableView.estimatedSectionHeaderHeight = 60
       // tableView.sectionHeaderHeight = UITableView.automaticDimension

     //   tableView.estimatedRowHeight = 60
      //  tableView.rowHeight = UITableViewAutomaticDimension
   //     tableView.sectionHeaderHeight = UITableViewAutomaticDimension
       
        imageScrollView.backgroundColor = #colorLiteral(red: 0.2060739398, green: 0.2581427097, blue: 0.3039865196, alpha: 1)
        // Do any additional setup after loading the view.
        //lblHeaderName.text = "WealthMagik"
      
        lblHeaderFullName.text = "บริษัทหลักทรัพย์นายหน้าซื้อขายหน่วยลงทุน เว็ลธ์ เมจิก จำกัด"
        lblHeaderName.font = UIFont.boldSystemFont(ofSize: 17)
         lblHeaderFullName.font = UIFont.boldSystemFont(ofSize: 12)
       // DataHeader = WealthMagik
       // Data = WealthMagikData
     //   imageScrollView.showsHorizontalScrollIndicator = false
        
        
        setupImage(name: "WealthMagik")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(rightButtonTapped))
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(true)
          // startTimerForShowScrollIndicator()
       }
    
     var timerForShowScrollIndicator: Timer?
    
    @objc func showScrollIndicatorsInContacts() {
           UIView.animate(withDuration: 0.001) {
               self.imageScrollView.flashScrollIndicators()
           }
       }
    
    func startTimerForShowScrollIndicator() {
        self.timerForShowScrollIndicator = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.showScrollIndicatorsInContacts), userInfo: nil, repeats: true)
    }
    
    */


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Row ")
        let index = DataAnswer.firstIndex(where: { $0[0][0] == lblHeaderName.text})
        //return Data[section].count
        
        print(index!," count ",DataAnswer[index!][section+1].count)
        return DataAnswer[index!][section+1].count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionnaireCell", for: indexPath) as! QuestionnaireTableViewCell
     
        cell.clearsContextBeforeDrawing = true
        cell.contentView.clearsContextBeforeDrawing = true
        cell.removeFromSuperview()
        
       // cell.lblData.text = Data[indexPath.section][indexPath.row]
       // let textField = UITextField(frame: CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30 , height: 30))
        cell.layer.borderWidth = 0.23
        cell.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cell.selectionStyle = .none;
        
        let indexQ = Dataname.firstIndex(where: { $0[0] == lblHeaderName.text})
        
        if let index = DataAnswer.firstIndex(where: { $0[0][0] == lblHeaderName.text}){
         //print(indexPath.row," row ",index," Data ",DataAnswer[index][indexPath.section+1][indexPath.row])
      
            cell.lblData.sizeToFit()
            
            if DataAnswer[index][indexPath.section+1][indexPath.row].isEmpty  && Dataname[indexQ!][indexPath.section+1].contains("เงิน") {
          
            cell.lblData.text = " \n "
//            let textField = UITextField(frame: CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30 , height: 30))
//
//                textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//                textField.attributedPlaceholder = NSAttributedString(string: " เพิ่มข้อมูล ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
//                textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                textField.layer.cornerRadius = 5
//                textField.font = UIFont.systemFont(ofSize: 15)
//
//                if let indexcheck = chooseData.firstIndex(where: { $0["indexPath"] as! IndexPath == indexPath}){
//                    textField.text = chooseData[indexcheck]["name"] as! String
//                }
//
                cell.tfData.frame = CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30 , height: 30)
                cell.tfData.font = UIFont.systemFont(ofSize: 15)
                cell.tfData.layer.cornerRadius = 5
                cell.tfData.attributedPlaceholder = NSAttributedString(string: " จำนวนเงิน ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                cell.tfData.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell.tfData.delegate = self
             //   cell.contentView.addSubview(textField)
                let bottomLine = CALayer()
                  bottomLine.frame = CGRect(x: 0.0, y: cell.tfData.frame.height - 3, width: cell.tfData.frame.width, height: 3.0)
                bottomLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                cell.tfData.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
                cell.tfData.borderStyle = .none
                cell.tfData.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.tfData.layer.addSublayer(bottomLine)
                cell.contentView.superview?.tag = indexPath.section
                cell.tfData.tag = indexPath.row
                cell.alpha = 0.5
                cell.accessoryType = .none
                
                cell.tfData.isHidden = false
                
            
            }else if  DataAnswer[index][indexPath.section+1][indexPath.row] == "รวมมูลค่าทรัพย์สินประมาณ"{
               cell.lblData.text = " \n "
               cell.tfData.frame = CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30 , height: 30)
                cell.tfData.font = UIFont.systemFont(ofSize: 15)
                cell.tfData.layer.cornerRadius = 5
                              
                cell.tfData.attributedPlaceholder = NSAttributedString(string: " รวมมูลค่าทรัพย์สินประมาณ ",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                cell.tfData.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell.tfData.delegate = self
                                                 
                let bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0.0, y: cell.tfData.frame.height - 3, width: cell.tfData.frame.width, height: 3.0)
                bottomLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            cell.tfData.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
                cell.tfData.borderStyle = .none
            cell.tfData.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.tfData.layer.addSublayer(bottomLine)
            cell.contentView.superview?.tag = indexPath.section
            cell.tfData.tag = indexPath.row
            cell.alpha = 0.5
            cell.accessoryType = .none
            cell.tfData.isHidden = false
            }else if Dataname[indexQ!][indexPath.section+1].contains("เบอร์"){
                cell.lblData.text = " \n "
                cell.tfData.frame = CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30 , height: 30)
                cell.tfData.font = UIFont.systemFont(ofSize: 15)
                cell.tfData.layer.cornerRadius = 5
               
                cell.tfData.attributedPlaceholder = NSAttributedString(string: " หมายเลขโทรศัพท์ ",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                cell.tfData.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell.tfData.delegate = self
                                  
                let bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0.0, y: cell.tfData.frame.height - 3, width: cell.tfData.frame.width, height: 3.0)
                bottomLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                cell.tfData.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
                cell.tfData.borderStyle = .none
                cell.tfData.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.tfData.layer.addSublayer(bottomLine)
                cell.contentView.superview?.tag = indexPath.section
                cell.tfData.tag = indexPath.row
                cell.alpha = 0.5
                cell.accessoryType = .none
                cell.tfData.isHidden = false
                
            } else  if DataAnswer[index][indexPath.section+1][indexPath.row].isEmpty  && Dataname[indexQ!][indexPath.section+1].contains("บุคคลที่สามารถติดต่อได้") {
                      
                cell.lblData.text = " \n "
                cell.tfData.frame = CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30 , height: 30)
                cell.tfData.font = UIFont.systemFont(ofSize: 15)
                cell.tfData.layer.cornerRadius = 5
               
                if indexPath.row == 0 {
                    cell.tfData.attributedPlaceholder = NSAttributedString(string: " ชื่อ-นามสกุล ",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                }else if indexPath.row == 1{
                  cell.tfData.attributedPlaceholder = NSAttributedString(string: " ความสัมพันธ์กับผู้ลงทุน/ผู้ถือหน่วยลงทุน ",attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                }
                cell.tfData.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell.tfData.delegate = self
                     
                let bottomLine = CALayer()
                bottomLine.frame = CGRect(x: 0.0, y: cell.tfData.frame.height - 3, width: cell.tfData.frame.width, height: 3.0)
                bottomLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                cell.tfData.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
                cell.tfData.borderStyle = .none
                cell.tfData.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.tfData.layer.addSublayer(bottomLine)
                cell.contentView.superview?.tag = indexPath.section
                cell.tfData.tag = indexPath.row
                cell.alpha = 0.5
                cell.accessoryType = .none
                cell.tfData.isHidden = false
                
            }else {
                cell.lblData.text = DataAnswer[index][indexPath.section+1][indexPath.row]
                cell.tfData.isHidden = true
                if chooseData.contains(where: {$0["indexPath"] as! IndexPath == indexPath }) {
                     //      cell.contentView.layer.borderWidth = 2
                         //  cell.contentView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                    cell.accessoryType = .checkmark
                         //  cell.contentView.layer.cornerRadius = 7
                         
                }else {
                           cell.accessoryType = .none
                          // cell.contentView.layer.borderWidth = 0.3
                          //  cell.contentView.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                }
                       
                cell.removeFromSuperview()
            }
          
          //  if getSelect == true && getTextboxrow == indexPath.row && getTextboxsection == indexPath.section {
         
      /*      if let index2 = getCheck.firstIndex(where: { $0["indexPath"] as! IndexPath == indexPath }) {
                let textField = UITextField(frame: CGRect(x: 15, y: 45, width: tableView.frame.size.width - 30 , height: 30))
                textField.placeholder = getCheck[index2]["Text"] as! String
                textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                textField.layer.cornerRadius = 5
                textField.font = UIFont.systemFont(ofSize: 15)
                cell.lblData.text = "\(DataAnswer[index][indexPath.section+1][indexPath.row] as! String)\n\n"
                cell.addSubview(textField)
                textField.tag = indexPath.section
               textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
               
            } */
            
            if let index2 = getCheck.firstIndex(where: { $0["indexPath"] as! IndexPath == indexPath }) {
                cell.lblData.text = "\(DataAnswer[index][indexPath.section+1][indexPath.row] )  \n \(getCheck[index2]["Text"]!)"
            }
            
        }
        
//        if (getCheck.firstIndex(where: { $0["Select"] as! Bool == true }) != nil) && (getCheck.firstIndex(where: {$0["indexPath"] as! IndexPath == indexPath }) != nil){
//            let textField = UITextField(frame: CGRect(x: 15, y: 40, width: tableView.frame.size.width - 30 , height: 30))
//            textField.placeholder = getCheck[""]
//            textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            textField.layer.cornerRadius = 5
//            textField.font = UIFont.systemFont(ofSize: 15)
//            cell.lblData.text = "\(DataAnswer[index][indexPath.section+1][indexPath.row] as! String)\n\n"
//            cell.addSubview(textField)
//
//        }
        return cell
    }
    
    @objc func didEndEditing(_ sender: UITextField) {
        if sender.text == "" {
            let alert = UIAlertController(title: "Alert", message: "\nกรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
                       alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else {
            //บันทึกข้อมูล
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let tableRow = textField.tag
        // secondRowText[tableRow] = textField.text
        let sec = textField.superview?.tag
         getDataText.append(textField.text!)
        let indexQ = Dataname.firstIndex(where: { $0[0] == lblHeaderName.text})
        chooseData.append(["name": textField.text!,"Section": sec!,"indexPath": IndexPath(row: tableRow, section: sec!),"Header": Dataname[indexQ!][sec!+1],"AmcName": lblHeaderName.text!])
     
     print("Choosedata ",chooseData)
    }
    
    func resetImage(image: UIImageView){
        getImage.append(image)
    }
    
    private func setupImage(name: String){
        let imageWidth:CGFloat = 120
        let imageHeight:CGFloat = 40
        var xPosition:CGFloat = 0
        var scrollViewSize:CGFloat=0
      
        for image in QuestionaireData{
          let myImage:UIImage = UIImage(named: image["Headername"]!)!
          let myImageView:UIImageView = UIImageView()
            myImageView.image = myImage
          //  myImageView.alpha = 0.2
            myImageView.frame.size.width = imageWidth
            myImageView.frame.size.height = imageHeight
            myImageView.frame.origin.x = xPosition + 5
            myImageView.frame.origin.y = 7
            myImageView.layer.cornerRadius = 7
            myImageView.layer.borderWidth = 3
            myImageView.restorationIdentifier = image["Headername"]
            myImageView.alpha = 0.2
            myImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)

           if image["Headername"] == name {
          
                myImageView.alpha = 1
                myImageView.layer.borderColor = #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 1)
                Tappedimage.append(myImageView)
                lblHeaderName.text = myImageView.restorationIdentifier
                lblHeaderName.font = UIFont.boldSystemFont(ofSize: 17)
           }
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
          
            tapGestureRecognizer.numberOfTapsRequired = 1
            tapGestureRecognizer.numberOfTouchesRequired = 1
            myImageView.isUserInteractionEnabled = true
            myImageView.addGestureRecognizer(tapGestureRecognizer)
            
            myImageView.layer.masksToBounds = true
            
            imageScrollView.addSubview(myImageView)
            resetImage(image: myImageView)
            xPosition += imageWidth + 5
            scrollViewSize += imageWidth + 5
            }
       
        imageScrollView.contentSize = CGSize(width: scrollViewSize, height: imageHeight + 10)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionnaireCell", for: indexPath) as! QuestionnaireTableViewCell
        
        cell.selectionStyle = .none;
        cell.accessoryType = .checkmark

        /*
        let alertController = UIAlertController(title: "Add New Name", message: "", preferredStyle: .alert)
           alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "ชื่อ นามสกุล"
              //  textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 100))
             
           }
            alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "ความสัมพันธ์"
                textField.layer.cornerRadius = 5
                
               
           }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "เลขที่บัตรประชาชน/หมายเลขหนังสือเดินทาง"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "เลขที่"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "หมู่บ้าน"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "หมู่"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "ห้อง"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "ชั้น"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "ซอย"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "ถนน"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "จังหวัด"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "ประเทศ"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "เขต/อำเภอ"
                      
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "แขวง/ตำบล"
            
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "รหัสไปรษณีย์"
            
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "โทรศัพทย์มือถือ"
            
        }
           let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
               let firstTextField = alertController.textFields![0] as UITextField
               let secondTextField = alertController.textFields![1] as UITextField
                  let thirdTextField = alertController.textFields![2] as UITextField
                
             
            print("firstName \(firstTextField.text), secondName \(secondTextField.text) ,thirdName \(thirdTextField.text)")
            
           // cell.lblData.text = "\((firstTextField.text)!) \n\((secondTextField.text)!)"
            
            
           })
           let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
           alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "Email"
           }
        
         
        
      
           alertController.addAction(saveAction)
           alertController.addAction(cancelAction)

           self.present(alertController, animated: true, completion: nil)

        
        */
        
       

        if  let index = DataAnswer.firstIndex(where: { $0[0][0] == lblHeaderName.text}){
         //   checkSectionTick(indexPath: indexPath)
        if DataAnswer[index][indexPath.section+1][indexPath.row].count != 0 {
               
              if let index2 = Dataname.firstIndex(where: {$0[0] == lblHeaderName.text}) {
              
                Checktextbox(name: DataAnswer[index][indexPath.section+1][indexPath.row] , indexPath: indexPath,Header: Dataname[index2][indexPath.section+1])
                }
            
            }
        }
        
//        if let index = Dataname.firstIndex(where: {$0[0] == lblHeaderName.text}) {
//            print("Setion Header ",Dataname[index][indexPath.section+1])
//        }
        countTick()
        
       // tableView.reloadRows(at: [indexPath], with: .none)
    
    }

    @objc func rightButtonTapped() {
        
//      if  let index = DataAnswer.firstIndex(where: { $0[0][0] as! String == lblHeaderName.text}){
//             //return Data[section].count
//
//        }
    //    if nextpagecheck == true {
     
        if let index = QuestionaireData.firstIndex(where: { $0["Headername"] == lblHeaderName.text })  {
          
          
            if index < QuestionaireData.count-1 {
                
                (getImage[index] as! UIImageView).layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
                (getImage[index+1] as! UIImageView).layer.borderColor = #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 1)
                (getImage[index+1] as! UIImageView).alpha = 1
                lblHeaderName.text =  (getImage[index+1] as! UIImageView).restorationIdentifier
                lblHeaderFullName.text = QuestionaireData[index+1]["Fullname"]
                lblHeaderName.font = UIFont.boldSystemFont(ofSize: 17)
              //    print("Choose Data",chooseData)
//                getCount = 0
//                count=0
//                realData += chooseData
                
                chooseData.removeAll() // ลบ ข้อมูลที่เก็บในแต่ ละ table
                getCheck.removeAll() // ลบ ข้อมูล getcheck
                nextpagecheck = false
                DispatchQueue.main.async(){
                    self.tableView.reloadData()
                }
                
//                if textfieldindex.isEmpty != true {
//                for i in textfieldindex {
//                    tableView.reloadRows(at: [i as! IndexPath], with: .none)
//                }
//                    textfieldindex.removeAll()
//                }
//                    for data in self.textfieldindex {
//                        self.tableView.reloadRows(at: data as! [IndexPath], with: .none)
//                        print("textfielddddd ",data)
//                     }
//
                tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                
                if ((getImage[index+1] as! UIImageView).frame.origin.x + (getImage[index+1] as! UIImageView).frame.width )  > view.frame.width {
                   //414
                    
                 //   print((getImage[index+1] as! UIImageView).frame.origin.x," customview ",(getImage[index+1] as! UIImageView).frame.width)
                    if ((getImage[index+1] as! UIImageView).frame.origin.x + (getImage[index+1] as! UIImageView).frame.size.width ) > UIScreen.main.bounds.size.width {
                            imageScrollView.contentOffset.x =  (getImage[index+1] as! UIImageView).frame.origin.x - ((getImage[index+1] as! UIImageView).frame.size.width * 2)
                    }
//                    else {
//                        imageScrollView.contentOffset.x =  (getImage[index+1] as! UIImageView).frame.origin.x - (getImage[index+1] as! UIImageView).frame.size.width
//                    }
                }
            }else {
                performSegue(withIdentifier: "nextpage", sender: self)
            }
            //self.setupImage(name: QuestionaireData[index+1]["Headername"]!)
        }
        
//        }else {
//            let alert = UIAlertController(title: "Alert", message: "\nกรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage.alpha == 1{
        
        var tappedImageBefore = tapGestureRecognizer.view as! UIImageView

            for i in getImage{
                (i as! UIImageView).layer.borderColor =  #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 0)
            }

            if let index = QuestionaireData.firstIndex(where: { $0["Headername"] == (tappedImage).restorationIdentifier}){
                
                lblHeaderFullName.text = QuestionaireData[index]["Fullname"]
            }

         Tappedimage.append(tappedImage)
           
            if let index = Tappedimage.firstIndex(where: { $0 as! UIImageView != tappedImage })  {
                    tappedImage.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                    lblHeaderName.text = tappedImage.restorationIdentifier
                    lblHeaderName.font = UIFont.boldSystemFont(ofSize: 17)
            
                for (index, _) in realData.enumerated() {
                    if realData[index]["AmcName"] as? String == lblHeaderName.text {
             //       chooseData += [realData[index]]
               //     count += 1
                }
            }
            
                    tappedImageBefore = Tappedimage[index] as! UIImageView
                    tappedImageBefore.layer.borderColor = #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 0)
                    Tappedimage.remove(at: index)
                }else {
                    tappedImage.layer.borderColor = #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 0)
                }
           
        /*
        Tappedimage.append(tappedImage)
        if let index = Tappedimage.firstIndex(where: { $0 as! UIImageView != tappedImage })  {
            
            tappedImageBefore = Tappedimage[index] as! UIImageView
            tappedImageBefore.alpha = 0.2
             tappedImageBefore.layer.borderColor = #colorLiteral(red: 0.4623539448, green: 0.8350836039, blue: 0.04789932817, alpha: 0)
            Tappedimage.remove(at: index)
        }
        
        if tappedImage.restorationIdentifier == "KTAM" {
            Data = KTAMData
            DataHeader = KTAM
            lblHeaderFullName.text = "บริษัทหลักทรัพย์จัดการกองทุน กรุงไทย จำกัด (มหาชน)"
           
        }else if tappedImage.restorationIdentifier == "WMTrading"  {
            
            Data = WealthMagikData
            DataHeader = WealthMagik
            lblHeaderName.text = "WealthMagik"
            lblHeaderFullName.text = "บริษัทหลักทรัพย์นายหน้าซื้อขายหน่วยลงทุน เว็ลธ์ เมจิก จำกัด"
            
           
        }else if tappedImage.restorationIdentifier == "TMBAM"  {
            Data = TMBAMData
            DataHeader = TMBAM
            lblHeaderFullName.text = "บริษัทหลักทรัพย์จัดการกองทุน ทหารไทย จำกัด"
           
        }else if tappedImage.restorationIdentifier == "SCBAM"  {
            Data = SCBAMData
            DataHeader = SCBAM
            lblHeaderFullName.text = "บริษัทหลักทรัพย์จัดการกองทุน ไทยพาณิชย์ จำกัด"
           
        }
        
         tableView.reloadData()
 */
            print("tapped ")
             tableView.reloadData()
        }
 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if  let index = Dataname.firstIndex(where: { $0[0] == lblHeaderName.text}){
            //return DataHeader.count
             getCount = Dataname[index].count - 1
               
            return Dataname[index].count - 1
        }
        return 0
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0 , width: tableView.frame.width, height: 0))

        headerView.layer.backgroundColor = #colorLiteral(red: 0.2060739398, green: 0.2581427097, blue: 0.3039865196, alpha: 1)
      //  headerView.layer.cornerRadius = 7
        headerView.layer.borderWidth = 2
        headerView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0)
       
       let headerlabel = UILabel()
             //15
        headerlabel.frame = CGRect.init(x: 15, y: 10, width: headerView.frame.width - 30, height: UITableView.automaticDimension )
           
        var header: String?// = DataHeader[section]
        
        if  let index = Dataname.firstIndex(where: { $0[0] == lblHeaderName.text}){
            header = Dataname[index][section+1]
        }
      
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
         
        let attrString = NSMutableAttributedString(string: header!)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
          headerlabel.attributedText = attrString
        
          headerlabel.font = UIFont.boldSystemFont(ofSize: 15)
          headerlabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
          headerlabel.minimumScaleFactor = 0.5
          headerlabel.numberOfLines = 0
          headerlabel.lineBreakMode = .byWordWrapping
          headerlabel.sizeToFit()
        
         headerView.addSubview(headerlabel)
        
//        headerlabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8).isActive = true
//        headerlabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 8).isActive = true
        headerlabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10).isActive = true
        //headerlabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
       
         return headerView
       
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return tableView.sectionHeaderHeight
//    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
           return UITableView.automaticDimension
    }
    
    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return tableView.rowHeight
    }

    @objc func myAction(_ sender : AnyObject) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "nextpage" {
            guard let firstVC = segue.destination as? ConfirmAMCViewController else { return }
            firstVC.ConfirmAMCData = QuestionaireData
        }
    }
    
    func Checktextbox(name: String,indexPath: IndexPath,Header: String) {
      
        if getCheck.contains(where: { $0["indexPath"] as! IndexPath == indexPath }) { // กดซ้ำที่ cell เดิม ลบข้อมูลออก
           // getCheck.remove(at: index)
            chooseData.removeAll(where: { $0["indexPath"] as! IndexPath == indexPath } )
            getCheck.removeAll(where: { $0["indexPath"] as! IndexPath == indexPath } )
        }
        else {   // กดเพิ่ม cell
            if name == "นอกประเทศ"{
               // getCheck.append(["Select": true,"indexPath": indexPath,"Text": "โปรดระบุชื่อประเทศ"])
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "โปรดระบุชื่อประเทศ"
            }
                let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                //self.getCheck.append(["Select": true,"Section": indexPath.section,"indexPath": indexPath,"Text": "\(firstTextField.text!)"])
                self.checkSectionTickTextbox(indexPath: indexPath,Header: Header,Text: firstTextField.text!)
                self.checkchooseData(name: name,indexPath: indexPath,Header: Header,Text: firstTextField.text!)
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in })
                alertController.addAction(cancelAction)
                alertController.addAction(saveAction)
                self.present(alertController, animated: true, completion: nil)
                
            }else if name == "อื่นๆ" && lblHeaderName.text != "WealthMagik"{
               // getCheck.append(["Selecet": true,"indexPath": indexPath,"Text": "โปรดระบุ"])
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                    alertController.addTextField { (textField : UITextField!) -> Void in
                    textField.placeholder = "โปรดระบุ"
                }
                let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0] as UITextField
                   // self.getCheck.append(["Select": true,"Section": indexPath.section,"indexPath": indexPath,"Text": "\(firstTextField.text!)"])
                self.checkSectionTickTextbox(indexPath: indexPath,Header: Header,Text: firstTextField.text!)
                self.checkchooseData(name: name,indexPath: indexPath,Header: Header,Text: firstTextField.text!)
                    })
                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in})
                alertController.addAction(cancelAction)
                alertController.addAction(saveAction)
                self.present(alertController, animated: true, completion: nil)
                
            }else if Header.contains("บุคคลที่ตัดสินใจ") {
               // getCheck.append(["Selecet": true,"indexPath": indexPath,"Text": "โปรดระบุ"])
                let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ชื่อ-นามสกุล"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ความสัมพันธ์"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "เลขที่บัตรประชาชน/หมายเลขหนังสือเดินทาง"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "เลขที่"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "หมู่บ้าน"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ชั้น"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ห้อง"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "หมู่"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ซอย"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ถนน"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "ประเทศ"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "จังหวัด"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "เขต / อำเภอ"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "แขวง / ตำบล"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "รหัสไปรษณีย์"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "โทรศัพท์มือถือ"}
                alertController.addTextField { (textField : UITextField!) -> Void in
                textField.placeholder = "Email"}
                
                    let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                    let firstTextField = alertController.textFields![0] as UITextField
                   // self.getCheck.append(["Select": true,"Section": indexPath.section,"indexPath": indexPath,"Text": "\(firstTextField.text!)"])

                        self.checkSectionTickTextbox(indexPath: indexPath,Header: Header,Text: firstTextField.text!)
                        self.checkchooseData(name: name,indexPath: indexPath,Header: Header,Text: firstTextField.text!)
                        
                    })
                    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in})
                    alertController.addAction(cancelAction)
                    alertController.addAction(saveAction)
                    self.present(alertController, animated: true, completion: nil)
                
            }/*else if Header.contains("นักการเมือง"){
                   let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                                 alertController.addTextField { (textField : UITextField!) -> Void in
                                 textField.placeholder = "ชื่อนักการเมือง"
                             }
                                alertController.addTextField { (textField : UITextField!) -> Void in
                                    textField.placeholder = "ความสัมพันธ์"
                                }
                
                            alertController.addTextField { (textField : UITextField!) -> Void in
                                textField.placeholder = "ตำแหน่งทางการเมือง"
                            }
                            alertController.addTextField { (textField : UITextField!) -> Void in
                                textField.placeholder = "ประเทศ"
                            }
                        alertController.addTextField { (textField : UITextField!) -> Void in
                                textField.placeholder = "แหล่งที่มาของรายได้"
                        }
                        alertController.addTextField { (textField : UITextField!) -> Void in
                                textField.placeholder = "แหล่งที่มาของเงินลงทุน"
                        }
                        alertController.addTextField { (textField : UITextField!) -> Void in
                                textField.placeholder = "ช่วงเวลาที่ดำลงตำแหน่ง"
                        }
                                 let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                                 let firstTextField = alertController.textFields![0] as UITextField
                                    let secondTextField = alertController.textFields![1] as UITextField
                                // self.getCheck.append(["Select": true,"Section": indexPath.section,"indexPath": indexPath,"Text": "\(firstTextField.text!)"])
                                            
                                    if firstTextField.text == "" {
                                         let alertController2 = UIAlertController(title: "", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: .alert)
                                         let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in})
                                         alertController2.addAction(cancelAction)
                                        self.present(alertController2, animated: true, completion: nil)
                                    }
                                
                                
                                 })
                                 let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in})
                                   
                                 alertController.addAction(cancelAction)
                                 alertController.addAction(saveAction)
                                 self.present(alertController, animated: true, completion: nil)
            }*/
            else if Header.contains("ถูกปฏิเสธการรับทำธุรกรรม"){
                   let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
                        alertController.addTextField { (textField : UITextField!) -> Void in
                        textField.placeholder = "ระบุชื่อสถาบันการเงิน"
                    }
                        alertController.addTextField { (textField : UITextField!) -> Void in
                        textField.placeholder = "ประเภทธุุรกรรม"}
                        alertController.addTextField { (textField : UITextField!) -> Void in
                        textField.placeholder = "เหตุผล"}
                       
                        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
                        let firstTextField = alertController.textFields![0] as UITextField
                        let secondTextField = alertController.textFields![1] as UITextField
                                // self.getCheck.append(["Select": true,"Section": indexPath.section,"indexPath": indexPath,"Text": "\(firstTextField.text!)"])

                            if firstTextField.text == "" {
                                let alertController2 = UIAlertController(title: "", message: "กรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: .alert)
                                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in})
                                alertController2.addAction(cancelAction)
                                self.present(alertController2, animated: true, completion: nil)
                            }
                            })
                                 let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { (action : UIAlertAction!) -> Void in})
                                   
                                 alertController.addAction(cancelAction)
                                 alertController.addAction(saveAction)
                                 self.present(alertController, animated: true, completion: nil)
            }else {
                self.checkSectionTick(indexPath: indexPath,Header: Header)
                self.checkchooseData(name: name,indexPath: indexPath,Header: Header,Text: "")
            }
        }
    tableView.reloadRows(at: [indexPath], with: .none)
    }
    
//    @objc func textFieldDidEndEditing(_ textField: UITextField) {
//         let tableRow = textField.tag
//
//        if textField.text! == "" {
//            let alert = UIAlertController(title: "Alert", message: "\nกรุณากรอกข้อมูลให้ครบถ้วน", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "ตกลง", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }else {
//            // print(tableRow," text ",textField.text)
//        }
//
//
//    }
    
    func checkchooseData(name: String,indexPath: IndexPath,Header: String,Text: String) {  // กรณีที่ข้อมูลไม่มีการกรอกข้อมูลเพิ่ม มีข้อมูลไหมหรือแบบกดซ้ำได้ หรือลือกได้ที่ละช๊อยส์
        var check = true
        
        if let index = chooseData.firstIndex(where: {$0["indexPath"] as! IndexPath == indexPath}){
            chooseData.remove(at: index)
            getCheck.removeAll(where: {$0["indexPath"] as! IndexPath == indexPath})
        }else {
            if chooseData.isEmpty == false {
                for (index2,_) in checkcount.enumerated() {
           
                if Header == checkcount[index2] && chooseData.contains(where: {$0["Header"] as! String == Header}) {
                    check = false
                    break
                }
            }
                if check == true {
                    if let index = chooseData.firstIndex(where: {$0["Section"] as! Int == indexPath.section }) {
                        let beforeSection = chooseData[index]["indexPath"] as! IndexPath
                        chooseData.removeAll(where: {$0["indexPath"] as! IndexPath == beforeSection })
                        tableView.reloadRows(at: [beforeSection], with: .none)
                    }
                }
            }
            if Text != "" {
                chooseData.append(["name": name+"\\"+Text,"Section": indexPath.section,"indexPath": indexPath,"Header": Header,"AmcName": lblHeaderName.text!])
            }else {
                chooseData.append(["name": name,"Section": indexPath.section,"indexPath": indexPath,"Header": Header,"AmcName": lblHeaderName.text!])
            }
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    func checkSectionTickTextbox(indexPath: IndexPath,Header: String,Text: String) { //เช็ค cell ที่กดว่าซ้ำหรือไม่
        var check = true
        for (index2,_) in checkcount.enumerated() {
            if Header == checkcount[index2] && chooseData.contains(where: {$0["Header"] as! String == Header}) {
                    check = false
                    break
            }
        }
        
        if check == true {
             if let index = chooseData.firstIndex(where: {$0["Section"] as! Int == indexPath.section }) {
                let beforeindexPath = chooseData[index]["indexPath"] as! IndexPath
                chooseData.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
                tableView.reloadRows(at: [beforeindexPath], with: .none)
            }
        }
        self.getCheck.append(["Select": true,"Section": indexPath.section,Header: Header,"indexPath": indexPath,"Text": "\(Text)"])
/*
            if let index = chooseData.firstIndex(where: {$0["Section"] as! Int == 1 }) {
               var beforeindexPath = chooseData[index]["indexPath"] as! IndexPath
              
                chooseData.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
               
               // getCheck.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
              //  chooseData.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
                tableView.reloadRows(at: [beforeindexPath], with: .none)
            }
         self.getCheck.append(["Select": true,"Section": indexPath.section,"indexPath": indexPath,"Text": "\(Text)"])
*/

    }
    func checkSectionTick(indexPath: IndexPath,Header: String){
        var check = true
        
//    for (index2,data) in checkcount.enumerated() {
//
//        if Header == checkcount[index2] {
//            if let index = getCheck.firstIndex(where: {$0["Section"] as! String == Header }) {
//                check = false
//                break
//            }
//        }
//
//    }
//
//        if check == true {
            if let index = getCheck.firstIndex(where: {$0["Section"] as! Int == indexPath.section }) {
                let beforeindexPath = getCheck[index]["indexPath"] as! IndexPath
                getCheck.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
                chooseData.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
                tableView.reloadRows(at: [beforeindexPath], with: .none)
            }
     //   }
//         if let index = getCheck.firstIndex(where: {$0["Header"] as! String != checkcount[index] }) {
//            var beforeindexPath = getCheck[index]["indexPath"] as! IndexPath
//            print("checkSectionTick ")
//            getCheck.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
//            chooseData.removeAll(where: { $0["Section"] as! Int == indexPath.section } )
//            tableView.reloadRows(at: [beforeindexPath], with: .none)
//        }
    }
    
    func countTick(){ //เพื่อ next  บลจ. check ว่าเลือกครบตามเงื่อนไขหรือยัง
      
        var count = 0
        for index in 0...getCount! {
            if chooseData.contains(where: { $0["Section"] as! Int == index }){
                count += 1
                print(index," count ",count)
            }
        }
        
        if count == getCount{
            nextpagecheck = true
        }
        
        
     //   let getcount = chooseData.flatMap{$0["Section"] as! Int == 1 }.count
//        var sumgetcount: Int = 0
//
//
//        for (index,data) in checkcount.enumerated() {
//
//            if chooseData.contains(where: {$0["Header"] as! String == checkcount[index] }) {
//                let getcount =  chooseData.filter{$0["Header"] as! String == checkcount[index]}.count
//                print(" getcount ",getcount)
//            }
//
//        }
//
//
        
        
     //   let getcount =  chooseData.filter{$0["Header"] as! String == "ท่านรู้จัก บลน. WealthMagik ผ่านช่องทางใด (ตอบได้มากกว่า 1 ข้อ)"}.count
      //  let getcount2 =  chooseData.filter{$0["Header"] as! String == "ท่านต้องการจัดส่งเอกสารมายัง บลน. เว็ลธ์เมจิก ผ่านช่องทางใด"}.count
//        if getcount >= 1{
//            print("Yes ")
//        }else if getcount2 == 1{
//            print("next ")
//        }
        
    }
    
}

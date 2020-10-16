
//
//  ThirdViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 10/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    
    @IBOutlet weak var checkAmericanView: UIView!
    

    
    @IBOutlet var checkAmericanSegment: [UISegmentedControl]!
    
    
    @IBOutlet weak var btnNextPage: UIButton!
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNextPage.layer.cornerRadius = 10
        
       print("Size ",UIScreen.main.bounds.size.height)
        
    }
    
    
    @IBAction func checkAmericanSegmentControl(_ sender: UISegmentedControl) {
        
        for check in checkAmericanSegment {
            if check.selectedSegmentIndex == 0 {
                checkAmericanView.isHidden = true
                btnNextPage.frame.origin = CGPoint(x: 135, y:  UIScreen.main.bounds.height - 130)
                          // scrollView.isScrollEnabled = false
                self.scrollView.contentSize.height =   btnNextPage.frame.origin.y + btnNextPage.frame.size.height + 45
                break
            }else {
                checkAmericanView.isHidden = false
                btnNextPage.frame.origin = CGPoint(x: 135, y: checkAmericanView.frame.origin.y + checkAmericanView.frame.size.height + 22 )
                  //scrollView.isScrollEnabled = true
                self.scrollView.contentSize.height =  btnNextPage.frame.origin.y + btnNextPage.frame.size.height + 45
            }
        }
        
        
    }
    
    
    
//    @IBAction func statusSegmentControl(_ sender: UISegmentedControl) {
//
//
//
//          switch firstCheckAmericanSegment.selectedSegmentIndex
//          {
//          case 0:
//              checkAmericanView.isHidden = true
//
//              btnNextPage.frame.origin = CGPoint(x: 135, y:  UIScreen.main.bounds.height - 130)
//           // scrollView.isScrollEnabled = false
//              self.scrollView.contentSize.height =   btnNextPage.frame.origin.y + btnNextPage.frame.size.height + 45
//
//            //  self.contentView.
//          case 1:
//            checkAmericanView.isHidden = false
//            btnNextPage.frame.origin = CGPoint(x: 135, y: checkAmericanView.frame.origin.y + checkAmericanView.frame.size.height + 22 )
//              //scrollView.isScrollEnabled = true
//            self.scrollView.contentSize.height =  btnNextPage.frame.origin.y + btnNextPage.frame.size.height + 45
//
//
//          default:
//              break
//          }
//      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let firstVC = segue.destination as? SelectAMCViewController else { return }
       
//        for check in checkAmericanSegment {
//            print("Check ",check.selectedSegmentIndex)
//        }
        if checkAmericanView.isHidden == true {
            firstVC.checkCountry = false
        }else {
            firstVC.checkCountry = true
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

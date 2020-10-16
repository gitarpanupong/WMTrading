//
//  FourViewController.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 13/1/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {
    
    
    @IBOutlet weak var amSegmentControl: UISegmentedControl!
    @IBOutlet weak var fastBuyView: UIImageView!
    @IBOutlet weak var nextPageBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var amView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nextPageBtn.frame.origin = CGPoint(x: 143, y: 700)
        nextPageBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        
    
    }
    
    @IBAction func amSegmentControl(_ sender: UISegmentedControl) {
        switch amSegmentControl.selectedSegmentIndex
        {
            case 0:
                amView.isHidden = true
                fastBuyView.isHidden = false
                nextPageBtn.frame.origin = CGPoint(x: 143, y: 700)
                     // scrollView.isScrollEnabled = false
              //  self.scrollView.contentSize.height = fastBuyView.frame.origin.y + 35
        
                      //  self.contentView.
            case 1:
                amView.isHidden = false
                fastBuyView.isHidden = true
                amView.frame.origin = CGPoint(x: -20 , y: fastBuyView.frame.origin.y + 5  )
                nextPageBtn.frame.origin = CGPoint(x: 143, y: amView.frame.origin.y + 960)
             // self.scrollView.contentSize.height = amView.frame.origin.y + 35
                
        default:
            break
        }
        
    }
    
    
    
//    @IBAction func statusSegmentControl(_ sender: UISegmentedControl) {
//
//
//
//            switch firstCheckAmericanSegment.selectedSegmentIndex
//            {
//            case 0:
//                checkAmericanView.isHidden = true
//
//              btnNextPage.frame.origin = CGPoint(x: 135, y: 515)
//              scrollView.isScrollEnabled = false
//                self.scrollView.contentSize.height = 896
//
//              //  self.contentView.
//            case 1:
//                checkAmericanView.isHidden = false
//                btnNextPage.frame.origin = CGPoint(x: 135, y: 1182)
//                scrollView.isScrollEnabled = true
//                 self.scrollView.contentSize.height = 1200
//
//
//            default:
//                break
//            }
//        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

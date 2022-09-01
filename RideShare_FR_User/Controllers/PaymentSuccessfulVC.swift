//
//  PaymentSuccessfulVC.swift
//  RideShare_FR_User
//
//  Created by Rahul on 01/09/22.
//

import UIKit

class PaymentSuccessfulVC: UIViewController {

    //MARK:- IBOutlet
   
    @IBOutlet weak var lblInfo: UILabel!
    

    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Action
    @IBAction func btnRateDriverTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateDriverAboutRideVC") as! RateDriverAboutRideVC
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

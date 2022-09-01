//
//  RateDriverAboutRideVC.swift
//  RideShare_FR_User
//
//  Created by Rahul on 01/09/22.
//

import UIKit
import Cosmos

class RateDriverAboutRideVC: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var imgDriver: UIImageView!
    @IBOutlet weak var lblDriverName: UILabel!
    @IBOutlet weak var vwRating: CosmosView!
    @IBOutlet weak var txtCommentView: UITextView!
    

    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Action
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- API
}

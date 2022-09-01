//
//  ProccedPaymentVC.swift
//  RideShare_FR_User
//
//  Created by aditya on 01/09/22.
//

import UIKit

@available(iOS 13.0, *)
class ProccedPaymentVC: UIViewController {

    @IBOutlet weak var _view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self._view.layer.cornerRadius = 12
        self._view.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;

        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    @IBAction func proccedPaymentBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
       self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

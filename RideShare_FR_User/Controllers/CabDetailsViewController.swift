//
//  CabDetailsViewController.swift
//  RideShare_FR_User
//
//  Created byPriya Rastogi on 05/08/22.
//

import UIKit
import Alamofire
import SwiftyJSON


class CabDetailsViewController: UIViewController {
    @IBOutlet weak var _view: UIView!
    @IBOutlet weak var driverImg: UIImageView!
    @IBOutlet weak var driverNameLbl: UILabel!
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var carNameLbl: UILabel!
    @IBOutlet weak var plateLbl: UILabel!
    @IBOutlet weak var otpLbl: UILabel!
    
    var objResponse : Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name("updateDriver")
        NotificationCenter.default.addObserver(self, selector: #selector(updateDrivers(_:)), name: name, object: nil)

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self._view.layer.cornerRadius = 12
        self._view.clipsToBounds = true
        // Do any additional setup after loading the view.
        self.plateLbl.text = objResponse?.driverInfo?.plate_number
        self.carNameLbl.text = objResponse?.driverInfo?.vehicle_subcategory_name
        self.driverNameLbl.text = objResponse?.driverInfo?.name
        if let otp = objResponse?.otp {
            self.otpLbl.text = "\(otp)"
        }
        carImg.sd_setImage(with: URL.init(string:  objResponse?.driverInfo!.vehicle_subcategory_picture ?? "" )) { (image, error, cache, urls) in
           if (error != nil) {
                self.carImg.image = UIImage(named: "blue_car")//blue_car
            } else {
                self.carImg.image = image
            }
        }
        driverImg.sd_setImage(with: URL.init(string:  objResponse?.driverInfo!.profile_pic ?? "" )) { (image, error, cache, urls) in
            if (error != nil) {
                self.driverImg.image = UIImage(named: "provider_img")
            } else {
                self.driverImg.image = image
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
       // self.verif
    }
    @objc func updateDrivers(_ notification:Notification) {
        
        
        if let notification = notification.userInfo?["gcm.notification.aps"] as? String, let jsonData = notification.data(using: .utf8)
        {
            
            let objUser = Response.objUserCredentials(fromDict: jsonData)
             
         
            if objUser?.notification_type == "accept_order" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "CabDetailsViewController") as! CabDetailsViewController
            
                self.addChild(vc)
                vc.objResponse = objUser
                vc.view.frame = self.view.frame
                self.view.addSubview(vc.view)
                vc.didMove(toParent: self)
               // drawPathDriver(obj: objUser!)
            } else {
              //  self.dismiss(animated: true, completion: nil)
                self.view.removeFromSuperview()
                
                print("view is hidden")
            }
           // drawPathDriver(obj: objUser!)
            
         //   print(objUser!.driverInfo!.driverLocation!.coordinates![1], objUser!.driverInfo!.driverLocation!.coordinates![0], self.locationStart.coordinate.latitude, self.locationStart.coordinate.longitude)
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CabDetailsViewController") as! CabDetailsViewController
//
//            self.addChild(vc)
//            vc.objResponse = objUser
//            vc.view.frame = self.view.frame
//            self.view.addSubview(vc.view)
//            vc.didMove(toParent: self)
//            drawPathDriver(obj: objUser!)
         //   self.drawPath(startLocation: locationStart, endLocation: locationEnd)
        
        //    let obj = Response.objUserCredentials(fromDict: notification.userInfo)
      //  print(objUser?.orderId)
     }
        
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
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @available(iOS 13.0, *)
    func cancelBooking() -> Void {
        var dicParam : Dictionary<String,Any> = Dictionary()
      
       
        dicParam["orderId"] = objResponse?.orderId

        AppServices.shared.bookingCancelOrder(param: dicParam, success: { (data) in

            debugPrint("cancelOrderBooking:-\(data!)")
            
            self.view.removeFromSuperview()
//            let dataObj = data as! [String : Any]
//
//            self.showOkAlertWithHandler(dataObj["message"] as! String) {
//                self.navigationController?.popViewController(animated: true)
//            }


        }, failure: {errorMsg in
            self.showOkAlert(errorMsg)
        })
    }
    @IBAction func callActionBtn(_ sender: Any) {
        let phNUmber = objResponse?.driverInfo?.mobile_number ?? "0000"
      //  let phNUmber =   "\(objResponse?.driverInfo?.country_code ?? "") - \(objResponse?.driverInfo?.mobile_number)"
       callNumber(phoneNumber: phNUmber)

    }
    
    @IBAction func msgBtn(_ sender: Any) {
    }
    
    @available(iOS 13.0, *)
    @IBAction func cancelBtn(_ sender: Any) {
        self.view.removeFromSuperview()
      //  cancelBooking()

    }
}

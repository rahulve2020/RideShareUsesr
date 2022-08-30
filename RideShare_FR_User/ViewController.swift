//
//  ViewController.swift
//  RideShare_FR_User
//
//  Created by Priya Rastogi on 01/07/22.
//

import UIKit
import CarbonKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var carbonTapSwipeNavigation = CarbonTabSwipeNavigation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carbonTapSwipeNavigation = CarbonTabSwipeNavigation(items: ["","",""], delegate: self)
        carbonTapSwipeNavigation.view.frame = self.containerView.bounds
        containerView.addSubview(carbonTapSwipeNavigation.view)
        addChild(carbonTapSwipeNavigation)
        containerView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      //  containerView.backgroundColor = UIColor.systemPink
        carbonTapSwipeNavigation.carbonSegmentedControl?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        carbonTapSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3, forSegmentAt: 0)
        carbonTapSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3, forSegmentAt: 1)
        carbonTapSwipeNavigation.carbonSegmentedControl?.setWidth(view.frame.width / 3, forSegmentAt: 2)
        carbonTapSwipeNavigation.setTabBarHeight(0)
        carbonTapSwipeNavigation.setIndicatorColor(.white)
        carbonTapSwipeNavigation.setNormalColor(.white)
        carbonTapSwipeNavigation.setSelectedColor(.white)
        carbonTapSwipeNavigation.setCurrentTabIndex(0, withAnimation: true)
    }


}

@available(iOS 13.0, *)
extension ViewController : CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard storyboard != nil else { return UIViewController() }
        if index == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "RequestRideVC") as! RequestRideVC
            return vc
        }else if index == 1 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SelectRideVC") as! SelectRideVC
            return vc
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "CompleteRideVC") as! CompleteRideVC
            return vc
        }
    }
}

//
//  PaymentVC.swift
//  RideShare_FR_User
//
//  Created by Rahul on 01/09/22.
//

import UIKit

class PaymentVC: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var lblAmountPay: UILabel!
    @IBOutlet weak var lblDriverTip: UILabel!
    @IBOutlet weak var lblTotalPay: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var lblCardNumber: UILabel!
    @IBOutlet weak var collTip: UICollectionView!
    
    var arrTip = [Tip]()
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrTip.append(Tip.init(amount: "10%", isSelected: false))
        arrTip.append(Tip.init(amount: "15%", isSelected: false))
        arrTip.append(Tip.init(amount: "20%", isSelected: false))
        arrTip.append(Tip.init(amount: "Custom", isSelected: false))
        collTip.reloadData()
    }
    
    //MARK:- Action
    
    @IBAction func btnPaymentTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentSuccessfulVC") as! PaymentSuccessfulVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAddCardTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddCardVC") as! AddCardVC
        vc.delegate = self
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnEditCardTapped(_ sender: UIButton) {
    }
    
    //MARK:- API

}

extension PaymentVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTip.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collTip.dequeueReusableCell(withReuseIdentifier: TipCollCell.identifire, for: indexPath) as? TipCollCell else {return UICollectionViewCell()}
        let obj = arrTip[indexPath.row]
        cell.lblTipAmount.text = obj.amount
        if obj.isSelected == true {
            cell.lblTipAmount.textColor = UIColor.KColorGreen
            cell.lblTipAmount.backgroundColor = UIColor.KColorAppTheme
            cell.lblTipAmount.border(color: UIColor.KColorAppTheme, width: 1, radius: 4)
        }else {
            cell.lblTipAmount.textColor = UIColor.KColorLightText
            cell.lblTipAmount.backgroundColor = .white
            cell.lblTipAmount.border(color: UIColor.KColorLightText, width: 1, radius: 4)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: indexPath.row == 3 ? 90:60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row == 3) {
            alertTextBox(message: "") {
                self.dismiss(animated: true, completion: nil)
            } okAction: { (amount) in
                for (index,item) in self.arrTip.enumerated() {
                    if item.isSelected == true {
                        self.arrTip[index].isSelected = false
                    } else {
                        if amount != "" {
                            self.arrTip[indexPath.row].amount = amount + "%"
                        }
                        self.arrTip[indexPath.row].isSelected = true
                    }
                }
            }
        } else {
            for (index,item) in arrTip.enumerated() {
                if item.isSelected == true {
                    arrTip[index].isSelected = false
                } else {
                    arrTip[indexPath.row].isSelected = true
                }
            }
        }
        collTip.reloadData()
    }
}

extension PaymentVC: CardListDelegate {
    func didSelectCreditCard(model: CardListModel?) {
        
    }
}

struct Tip: Codable {
    var amount: String
    var isSelected: Bool = false
}

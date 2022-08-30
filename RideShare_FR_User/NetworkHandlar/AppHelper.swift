//
//  AppHelper.swift
//  Banquet Gem
//
//  Created by Imran malik on 01/02/22.
//  Copyright © 2020 virtualEmployee. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class Apphelper: NSObject {
    
    static let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
     struct Constants
    {
        
        struct API
        {

            
            static let BaseUrl = "http://3.85.159.240:3000/api/"
            
            static let signUp  = API.BaseUrl + "user/signup"
            static let otpVerify : String = API.BaseUrl + "user/verify"
            static let resendOtp : String = API.BaseUrl + "user/resend-otp"
            static let login : String = API.BaseUrl + "user/login"
            static let forgotPassword : String = API.BaseUrl + "user/forgot-password"
            static let resetPassword : String = API.BaseUrl + "user/reset-password"
            static let changePassword : String = API.BaseUrl + "user/change-password"
            static let getProfile : String = API.BaseUrl + "user/get-user-profile"
            static let updateProfile : String = API.BaseUrl + "user/update-profile"
            
            static let getRatingList : String = API.BaseUrl + "user/get-my-rating"
            static let getDriverList : String = API.BaseUrl + "user/get-driver-listing-with-subcategory"
            static let getVehicleCategoryList : String = API.BaseUrl + "user/get-vehicle-category-and-subCategory"
            static let getUserCardList : String = API.BaseUrl + "user/get-user-card-details"
            static let addCardDetails : String = API.BaseUrl + "user/add-card-detail"
            static let orderBookingCancel : String = API.BaseUrl + "cancel-booking-order"
            static let getOrderListing : String = API.BaseUrl + "user/get-booking-order-listing"
            static let getOrderByDate : String = API.BaseUrl + "user/get-order-by-date"
            static let helpAndSupport : String = API.BaseUrl + "helpAndSupport"
                            // abhishek
            static let getPolicy : String = API.BaseUrl + "getPolicy"
            static let getContactDetails : String = API.BaseUrl + "user/submit-contact-us"

          
            static let updateBanquet : String = API.BaseUrl + "updateBanquet"
            static let acceptBooking : String = API.BaseUrl + "acceptBooking"
           
            static let submitRating : String = API.BaseUrl + "submitRating"
            
            static let getBookingList : String = API.BaseUrl + "getBookingList"

    
            static let getBanquetList : String = API.BaseUrl + "getBanquetList"
            static let ratingList : String = API.BaseUrl + "ratingList"
            static let getImages : String = API.BaseUrl + "getImages"
        }
        
        
        
        struct UserDefaults
        {
            
            static let userInfo : String = "User Info"
            static let token : String = "Token"
            static let authToken : String = "AuthToken"
            static let loginStatus : String = "LoginStatus"
            static let loginStatusSeeker : String = "SeekerLoginStatus"
            static let isEnableNotifification : String = "isEnableNotifification"
            static let isEnableSoundNotifification : String = "isEnableSoundNotifification"
            
        }
        
        struct StringConstant
        {
            static var appName : String {
                return "appName" }
            static var titleOptions: String {
                return "Title Options"
            }
            static var device : String {
                return"iOS" }
            static var lableName : String {
                return"lableName"}
            static var lableCity : String {
                return"lableCity" }
            static var lablePhone : String {
                return"lablePhone" }
            static var successful : String {
                return"successful" }
            static var titleSignup : String {
                return"titleSignup"}
            
            static var titleEditProfile : String {
                return"titleEditProfile" }
            
            static var titleForgetPassword : String {
                return"titleForgetPassword"}
            static var titleVerification : String {
                return"titleVerification" }
            
            static var ok : String {
                return"ok" }
            
            static var done : String {
                return"done" }
            static var camera : String {
                return"camera" }
            static var photoLibray : String {
                return"photoLibray" }
            static var cancel : String {
                return"cancel" }
            static var error : String {
                return"Error" }
        
            static var tryAgain : String {
                return"tryAgain" }
            static var selectAll  : String {
                return"selectAll" }
           
           
           
        }
        
        struct MessageConstant
        {
            static var termsCondition : String {
                return"termsCondition"}
            static var termsConditionSubString : String {
                return"termsConditionSubString" }
            static var forgetPassword : String {
                return"forgetPassword" }
            static var otp : String {
                return"otp"}
            static var requirereEnterPassword : String {
                return "requireOldPassword"}
            static var requirenewPassword : String {
                return "requirenewPassword"}
            static var resetPassword : String {
                return"resetPassword"}
            static var requireFirstName : String {
                return"requireFirstName" }
            static var requireLastName : String {
                return"requireLastName" }
            static var requireAddress : String {
                return"requireAddress"}
            static var requirePhoneNumber : String {
               return"requirePhoneNumber" }
            static var requireValidData : String {
                return"requireValidData"}
            static var requireMobile : String {
                return"requireMobile" }
            static var requireEmail : String {
                return"requireEmail" }
          //  static var requireName : String {
           //     return"requireName" }
           // static var requireLastName : String {
           //     return"requireLastName" }
            static var requireValidEmail : String {
                return"requireValidEmail" }
            static var requireValidMobileNumber : String {
                return"requireValidMobileNumber" }
            static var requirePassword : String {
                return"requirePassword" }
            static var requireConfirmPassword : String {
                return"requireConfirmPassword" }
            static var requireMatchPassword : String {
                return"requireMatchPassword" }
            static var requireValidPassword : String {
                return"requireValidPassword"}
            static var requireSelectCity : String {
                return"requireSelectCity" }
            
            static var requireProfileImage : String {
                return"requireProfileImage" }
            
            
            static var requireDescription : String {
                return"requireDescription" }
           
            static var requirePickUpLocation : String {
                return"Enter pick Up Location" }
            static var requireDropOffLocation : String {
                return"Enter Drop Off Location" }
            
            static var confirmLogout : String {
                return"confirmLogout"}
            static var warningPromocode : String {
                return"warningPromocode"}
            static var confirmDeleteEvent : String {
                return"confirmDeleteEvent" }
            static var oneCondition: String {
                return "Please enter email or mobile number"
            }
            static var samePassword: String {
                return "New Password and Re-enter New Password should be same."
            }
            
        }
       
        struct FailureMessage
        {
            
            static var otpVerify : String {
                return"otpVerify"}
            static var login : String {
                return"login" }
        }
        struct KAlertMsg {
            static let otpMsg = "Enter all field"
        }
    }
}


extension UIViewController {


func showOkAlert(_ msg: String) {
       let alert = UIAlertController(title:
           "", message: msg, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
       alert.addAction(okAction)
       present(alert, animated: true, completion: nil)
   }
   
   func showOkAlertWithHandler(_ msg: String, handler: @escaping ()->Void){
       let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "OK", style: .default) { (type) -> Void in
           handler()
       }
       alert.addAction(okAction)
       present(alert, animated: true, completion: nil)
   }
    
    @available(iOS 13.0, *)
    func loginAlertAction() {
        let alert = UIAlertController(title: "Login?", message: "You are not Login. Please Login First", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "Login",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        let VC: LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                        self.navigationController?.pushViewController(VC, animated: true)
                                        
                                        
                                        
                                        //Sign out action
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @available(iOS 13.0, *)
    
    func ImageAlertAction() {
        let alert = UIAlertController(title: "Alert", message: "Image Url Not Found", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "Login",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        let VC: LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                        self.navigationController?.pushViewController(VC, animated: true)
                                        
                                        
                                        
                                        //Sign out action
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    

}

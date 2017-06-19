//
//  VerifyViewController.swift
//  Fundush
//
//  Created by Kavin Soni on 10/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit
import Firebase

class VerifyViewController: UIViewController {
    @IBOutlet weak var btnVerify: kButton!
    @IBOutlet weak var lblStatic: kLabel!
    @IBOutlet weak var txtPhoneNumber: kTextField!
    @IBOutlet weak var lblSeperator2: UIImageView!
    @IBOutlet weak var lblSeperator: UIImageView!

    @IBOutlet weak var btnCountry: kButton!
    @IBOutlet weak var viewPhoneNumber: UIView!
    @IBOutlet weak var lblStaticPhone: kLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .white//.appThemeLightBlueColor()
        
        lblStaticPhone.updateLableWithType(kLabelType.bold)
        lblStaticPhone.textColor =  UIColor .appGrayColor()
        txtPhoneNumber.validationType = .numbers
       lblSeperator2.backgroundColor = UIColor.appThemeBlueColor()
        lblSeperator.backgroundColor = UIColor.appThemeBlueColor()
        viewPhoneNumber.backgroundColor = UIColor .clear
        txtPhoneNumber.backgroundColor = UIColor .clear
        viewPhoneNumber.layer.cornerRadius = 10
        viewPhoneNumber.clipsToBounds = true
        lblStatic.updateLableWithType(kLabelType.bold)
        lblStatic.textColor = UIColor .black
        btnVerify.updateButtonUIWithType(kButtonType.cornerRadius)
        btnCountry.titleLabel?.font = UIFont .appMediumFont(WithSize: 16)
//        addBackButtonInNavigationBar()
        self.title = "Verify PhoneNumber"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnVerifyClicked(_ sender: Any) {
//        var phoneNum:String = ""
//        if ((txtPhoneNumber.text?.characters .count)! > 0) {
//            phoneNum = txtPhoneNumber.text! as String
//        }else{
//            showErrorMessage(message: "Please enter PhoneNumber.")
//            return
//        }
//        
//        var country:String = ""
//        if ((btnCountry.titleLabel?.text)! != nil) {
//            country = (btnCountry.titleLabel?.text)! as String
//        }
//
//        let fullNumber = String (format: "%@%@",country,phoneNum )
//        print(fullNumber)
//        
//        PhoneAuthProvider.provider().verifyPhoneNumber(fullNumber) { (verificationID, error) in
//            if ((error) != nil) {
//                // Verification code not sent.
//                print(error ?? "")
//                self.showErrorMessage(message: "Please enter valid PhoneNumber.")
//                
//            } else {
//                // Successful. -> it's sucessfull here
//                print(verificationID ?? "")
//                
//                UserDefaults.standard.set(verificationID, forKey: "firebase_verification")
//                UserDefaults.standard.synchronize()
//                
//                let verify = self.storyboard?.instantiateViewController(withIdentifier: "EnterVerificationCode") as! EnterVerificationCode
//                self.view.endEditing(true)
//                
//                self.navigationController?.pushViewController(verify, animated: true)
//                
//            }
//        }

                        let verify = self.storyboard?.instantiateViewController(withIdentifier: "EnterVerificationCode") as! EnterVerificationCode
                        self.view.endEditing(true)
        
                        self.navigationController?.pushViewController(verify, animated: true)
        
                    }

    
//                let category = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
//                self.navigationController?.pushViewController(category, animated: true)
   // }

        
    
    
    
    //MARK: - Back Button
    
    func addBackButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
        btnDrawer.addTarget(self, action: #selector(VerifyViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
        self.navigationItem.leftBarButtonItem = leftButtonForNavigation
    }
    
    func openLeftDrawer(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnCountryClicked(_ sender: Any) {
        let country = self.storyboard?.instantiateViewController(withIdentifier: "CountryCodeViewController") as! CountryCodeViewController
        
        country.callCountryCode = { (name,code) in
            self.btnCountry.setTitle(code, for: UIControlState.normal)
        }
        self.view.endEditing(true)

        self.navigationController?.pushViewController(country, animated: true)
        
    }
    
    func showErrorMessage(message:String) {
        let alertController = UIAlertController(title: "Fundush", message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    

}

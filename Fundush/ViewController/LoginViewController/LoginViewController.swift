//
//  LoginViewController.swift
//  Fundush
//
//  Created by Kavin Soni on 09/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var constrain: NSLayoutConstraint!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var btnLoginButton: kButton!    
    @IBOutlet weak var imgSaperator: UIImageView!
    @IBOutlet weak var txtEmail: kTextField!
    @IBOutlet weak var txtPassword: kTextField!
    
    @IBOutlet weak var btnForgotPassword: kButton!
    @IBOutlet weak var btnRegister: kButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }

    
    func setupUi() -> Void {
        self.view.backgroundColor = UIColor .white//.appThemeLightBlueColor()
        imgSaperator.backgroundColor = UIColor.appLightBlueColor()
        btnLoginButton.updateButtonUIWithType(kButtonType.cornerRadius)
        btnRegister.updateButtonUIWithType(kButtonType.cornerRadius)
        btnRegister.backgroundColor = UIColor .appBlackColor()
        loginView.layer.cornerRadius = 10.0
        loginView.clipsToBounds = true
        
        
        if self.view.frame.size.width == 320 {
            self.constrain.constant = self.constrain.constant - 35
        }
        btnForgotPassword.updateButtonUIWithType(kButtonType.textOnly)
        loginView.addDropShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        let category = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.view.endEditing(true)

        self.navigationController?.pushViewController(category, animated: true)
    }
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
    
    let register = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.view.endEditing(true)

        
        self.navigationController?.pushViewController(register, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

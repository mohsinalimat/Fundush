//
//  RegisterViewController.swift
//  Fundush
//
//  Created by Kavin Soni on 10/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var constrain: NSLayoutConstraint!

    @IBOutlet weak var imgSeperator: UIImageView!
    @IBOutlet weak var txtLastName: kTextField!
    @IBOutlet weak var txtFirstName: kTextField!
    @IBOutlet weak var txtConfirmPassword: kTextField!
    @IBOutlet weak var imgSeperator3: UIImageView!
    @IBOutlet weak var imgSeperator2: UIImageView!
    @IBOutlet weak var imgSeperator1: UIImageView!
    @IBOutlet weak var btnRegister: kButton!
    @IBOutlet weak var registerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButtonInNavigationBar()
        self.title = "Register"
        imgSeperator1.backgroundColor = UIColor .appThemeLightBlueColor()
        imgSeperator2.backgroundColor = UIColor .appThemeLightBlueColor()
        imgSeperator.backgroundColor = UIColor .appThemeLightBlueColor()
        imgSeperator3.backgroundColor = UIColor .appThemeLightBlueColor()
        btnRegister.updateButtonUIWithType(kButtonType.cornerRadius)
        registerView.layer.cornerRadius = 10;
        registerView.clipsToBounds = true
        registerView.addDropShadow()
        
        if self.view.frame.size.width == 320 {
            self.constrain.constant = self.constrain.constant - 35
        }
        
        self.view.backgroundColor = UIColor .white//.appThemeLightBlueColor()
        
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnRegisterClicked(_ sender: Any) {
        
        let verify = self.storyboard?.instantiateViewController(withIdentifier: "VerifyViewController") as! VerifyViewController
        self.view.endEditing(true)

        self.navigationController?.pushViewController(verify, animated: true)
        
    }
    //MARK: - Back Button
    
    func addBackButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
        btnDrawer.addTarget(self, action: #selector(RegisterViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
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

}

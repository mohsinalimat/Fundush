//
//  EnterVerificationCode.swift
//  Fundush
//
//  Created by Kavin Soni on 16/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class EnterVerificationCode: UIViewController {
    @IBOutlet weak var lblStatic: kLabel!

    @IBOutlet weak var lblTitleStatic: kLabel!
    @IBOutlet weak var viewPhoneNumber: UIView!
    @IBOutlet weak var btnVerify: kButton!
    @IBOutlet weak var imgSeperator1: UIImageView!
    @IBOutlet weak var txtVerificationCode: kTextField!
    @IBOutlet weak var imgSeperator: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblStatic.updateLableWithType(kLabelType.bold)
        lblStatic.textColor =  UIColor .appGrayColor()
        
        imgSeperator1.backgroundColor = UIColor.appThemeBlueColor()
        imgSeperator.backgroundColor = UIColor.appThemeBlueColor()
        viewPhoneNumber.backgroundColor = UIColor .clear
        txtVerificationCode.backgroundColor = UIColor .clear
        viewPhoneNumber.layer.cornerRadius = 10
        viewPhoneNumber.clipsToBounds = true
        lblTitleStatic.updateLableWithType(kLabelType.bold)
        lblTitleStatic.textColor = UIColor .black
        btnVerify.updateButtonUIWithType(kButtonType.cornerRadius)

        self.view.backgroundColor = UIColor .white
        addBackButtonInNavigationBar()
        self.title = "Enter Verification Code"
        // Do any additional setup after loading the view.
    }

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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnVerify(_ sender: Any)
    {
        let tabBarController:UITabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        let appDelegate:AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        appDelegate.window?.rootViewController = tabBarController;
        
//                        let category = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
//                        self.navigationController?.pushViewController(category, animated: true)
    }
}

//
//  EventDetailViewController.swift
//  Fundush
//
//  Created by Kavin Soni on 18/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    @IBOutlet weak var lblParticipant: kLabel!
    @IBOutlet weak var imgSeperator3: UIImageView!
    @IBOutlet weak var imgSeperator2: UIImageView!
    @IBOutlet weak var btnJoinNow: kButton!
    @IBOutlet weak var lblStaticDayLeft: kLabel!
    @IBOutlet weak var lblDayLeft: kLabel!
    @IBOutlet weak var lblParticipantStatic: kLabel!
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var imgSeperator1: UIImageView!
    
    @IBOutlet weak var imgSeperator: UIImageView!
    
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: kLabel!
    @IBOutlet weak var lblDetail: kLabel!
    
    @IBOutlet weak var lblDistance: kLabel!
    
    @IBOutlet weak var lblPaceStatic: kLabel!
    
    @IBOutlet weak var lblAthlets: kLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addBackButtonInNavigationBar()
        self.title = "Event Detail"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    func setupUI() -> Void {
        
        btnJoinNow.updateButtonUIWithType(kButtonType.cornerRadiusWithBorder)
        
        lblName.updateLableWithType(kLabelType.bold)
        
        lblDetail.updateLableWithType(kLabelType.regular)
        lblDayLeft.updateLableWithType(kLabelType.bold)
        lblDayLeft.textColor = UIColor .black
        lblParticipant.textColor = UIColor .black
        lblParticipant.updateLableWithType(kLabelType.bold)
        lblStaticDayLeft.updateLableWithType(kLabelType.bold)
        lblStaticDayLeft.textColor = UIColor.appGrayColor()
        lblStaticDayLeft.updateLableWithType(kLabelType.bold)
        lblParticipantStatic.updateLableWithType(kLabelType.bold)
        lblParticipantStatic.textColor = UIColor.appGrayColor()
        lblDistance.textColor = UIColor .appGrayColor()
        lblDistance.updateLableWithType(kLabelType.bold)
        lblPaceStatic.textColor = UIColor .appGrayColor()
        lblPaceStatic.updateLableWithType(kLabelType.bold)

        lblAthlets.textColor = UIColor .appGrayColor()
        lblAthlets.updateLableWithType(kLabelType.bold)
        
        
        segmentController.tintColor = UIColor .appThemeBlueColor()
        
        segmentController.setFontSize(fontSize: 16)
        imgSeperator.backgroundColor = UIColor .appThemeBlueColor()
        imgSeperator1.backgroundColor = UIColor .appThemeBlueColor()
        imgSeperator2.backgroundColor = UIColor .appThemeBlueColor()
        imgSeperator3.backgroundColor = UIColor .appThemeBlueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addBackButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
        btnDrawer.addTarget(self, action: #selector(CategoryViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
        self.navigationItem.leftBarButtonItem = leftButtonForNavigation
    }
    func openLeftDrawer(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
   
  }

extension UISegmentedControl {
    
    func setFontSize(fontSize: CGFloat) {
        
        let normalTextAttributes: [NSObject : AnyObject] = [
            NSForegroundColorAttributeName as NSObject: UIColor.appThemeBlueColor(),
            NSFontAttributeName as NSObject: UIFont.systemFont(ofSize: fontSize, weight: UIFontWeightRegular)
        ]
        
        let boldTextAttributes: [NSObject : AnyObject] = [
            NSForegroundColorAttributeName as NSObject : UIColor.white,
            NSFontAttributeName as NSObject : UIFont.systemFont(ofSize: fontSize, weight: UIFontWeightMedium),
            ]
        
        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        self.setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        self.setTitleTextAttributes(boldTextAttributes, for: .selected)
    }
}

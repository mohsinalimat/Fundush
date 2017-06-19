//
//  kNavigationBar.swift
//  DriverCity
//
//  Created by Kavin Soni on 27/05/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class kNavigationBar: UINavigationBar {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit()->Void{ //33ccdb
        self.backgroundColor = UIColor .white//UIColor.init(red:  51/255.0, green: 204/255.0, blue: 219/255.0, alpha: 1.0)
        self.barTintColor = UIColor .white//UIColor.init(red:  51/255.0, green: 204/255.0, blue: 219/255.0, alpha: 1.0)
        self.isTranslucent = false
        self.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black,NSFontAttributeName:UIFont.appMediumFont(WithSize: 18.0)]
        
        self.addDropShadow()
    }
}

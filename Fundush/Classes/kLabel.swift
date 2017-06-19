//
//  kLabel.swift
//  DriverCity
//
//  Created by Kavin Soni on 27/05/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit


enum kLabelType{
    
    case none
    case bold
    case light
//    case robotoCondensed
    case regular
    
}


class kLabel: UILabel {
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    //MARK:- Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    //MARK:- Common Init
    func commonInit() -> Void {
        // Write common things here
        // E.g Set common label font size and color here
        let currentFontSize = self.font.pointSize
        self.font = UIFont .appRegularFont(WithSize: currentFontSize)
        self.textColor = UIColor .appBlackColor()
    }
    
    func updateLableWithType( _ labelType : kLabelType) -> () {
        switch labelType {
        case .none:
            
            break;
            
        case .bold:
            let currentFontSize = self.font.pointSize
            self.font = UIFont .appMediumFont(WithSize: currentFontSize)
            break;
            
        case .light:
            let currentFontSize = self.font.pointSize
            self.font = UIFont .appRegularFont(WithSize: currentFontSize)
            
            break;
            
//        case .robotoCondensed:
//            let currentFontSize = self.font.pointSize
//            self.font = UIFont .appCondensedFont(WithSize: currentFontSize)
//            
//            break;
            
        case .regular:
            let currentFontSize = self.font.pointSize
            self.font = UIFont .appSemiboldFont(WithSize: currentFontSize)
            
            break;
        }
    }
}

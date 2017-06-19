//
//  kButton.swift
//  Collabor
//
//  Created by Kavin Soni on 23/05/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit


enum kButtonType{
    
    case none
    case cornerRadius
    case textOnly
    case textPlusImage
    case cornerRadiusWithBorder
    case cornerRadiusWithBorderWithClearBack
    case cornerRadiusGreen
    case arrowButton
    case cornerRadiusBlack
    case BlackButton
    case WhiteButton

    case downArrowButton

    case oneSideCornerRadiusBottomLeft
    case oneSideCornerRadiusBottomRight

    
}

class kButton: UIButton {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() -> Void {
        self.isExclusiveTouch = true
        
        let currentFontSize = self.titleLabel?.font.pointSize
        self.titleLabel?.font = UIFont .appRegularFont(WithSize: currentFontSize!)
        
    }
    
    func updateButtonUIWithType(_ buttonUIType : kButtonType) -> () {
        switch buttonUIType {
        case .none:
            break;
            
        case .cornerRadius:
            
            
            self.layer.cornerRadius = 10
            self.setTitleColor(UIColor.white, for: UIControlState())
            self.backgroundColor = UIColor .appThemeBlueColor()
            self.titleLabel?.font = UIFont.appBoldCondensedFont(WithSize: 20);
            //            self.titleLabel?.font = UIFont.getRoboto_RegularFontWithSize(16.0)
            //           self.backgroundColor = UIColor.appLightRedColor()
            self.clipsToBounds = true
            break;
            
        case .textOnly:
            
            self.setTitleColor(UIColor.gray, for: UIControlState())
            let currentFontSize = self.titleLabel?.font.pointSize
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: currentFontSize!)
            
            break;
            
        case .downArrowButton:
            
            self.setTitleColor(UIColor.gray, for: UIControlState())
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: 18.0)
            self.semanticContentAttribute = .forceRightToLeft

            break;

        case .textPlusImage:
            
            self.setTitleColor(UIColor.gray, for: UIControlState())
            //    self.titleLabel?.font = UIFont.getRoboto_RegularFontWithSize(14.0)
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: 14.0)

            self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//            self.setImage(UIImage(named: "right"), for: .normal)
//            self.setImage(UIImage(named: "right"), for: .highlighted)
            
        self.contentHorizontalAlignment=UIControlContentHorizontalAlignment.left;
            self.contentVerticalAlignment = UIControlContentVerticalAlignment.center;
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            //self.backgroundColor = UIColor.red
            //            self.imageView?.tintColor = UIColor.gray
            
            break;
            
        case .cornerRadiusWithBorderWithClearBack:
            
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor .appGreenColor().cgColor
            self.backgroundColor = UIColor .clear
            self.layer.cornerRadius = self.frame.size.height/2
            self.setTitleColor(UIColor.white, for: UIControlState())
            self.clipsToBounds = true
            
            self.titleLabel?.font = UIFont.appRegularFont(WithSize: 15.0)
            
            
            break;
            
            
        case .cornerRadiusWithBorder:
            
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor .appThemeBlueColor().cgColor
//            self.backgroundColor = UIColor .appBlueColor()
            self.layer.cornerRadius = self.frame.size.height/2
            self.setTitleColor(UIColor.appThemeBlueColor(), for: UIControlState())
            self.clipsToBounds = true
            
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: 15.0)
            
            
            break;
            
            
        case .cornerRadiusGreen:
            
            self.backgroundColor = UIColor .appGreenColor()
            self.layer.cornerRadius = self.frame.size.height/2
            self.setTitleColor(UIColor.white, for: UIControlState())
            self.clipsToBounds = true
            
            self.titleLabel?.font = UIFont.appRegularFont(WithSize: 18.0)
            
            
            break;
        case .arrowButton:
            self.backgroundColor = UIColor.init(red: 246/255.0, green: 84/255.0, blue: 53/255.0, alpha: 0.7)
            self.layer.cornerRadius = 5.0
            self.clipsToBounds = true
            //
            //            self.titleLabel?.font = UIFont.appRegularFont(WithSize: 18.0)
            //
            
            break;
            
            
        case .BlackButton:
            
            self.backgroundColor = UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
            //UIColor .black
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: 18)
            self.setTitleColor(UIColor.white, for: UIControlState())
            
            
            break;
            
            
        case .WhiteButton:
            
            self.backgroundColor = UIColor.white
            //UIColor .black
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: 18)
            self.setTitleColor(UIColor.appBlackColor(), for: UIControlState())
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor .appBlackColor().cgColor
            self.clipsToBounds = true
            
            
            break;

        case .cornerRadiusBlack:
            
//            self.layer.borderWidth = 1.0
//            self.layer.borderColor = UIColor .white.cgColor
            self.backgroundColor = UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
            //UIColor .black
            self.layer.cornerRadius = 5//self.frame.size.height/2
            self.titleLabel?.font = UIFont.appMediumFont(WithSize: 18)
            self.setTitleColor(UIColor.white, for: UIControlState())
            self.clipsToBounds = true
            
            
            break;
            
        case .oneSideCornerRadiusBottomLeft:
            //.topRight,
            let path = UIBezierPath(roundedRect:self.bounds,
                                    byRoundingCorners:[ .bottomLeft],
                                    cornerRadii: CGSize(width: 10, height:  10))
            
            let maskLayer = CAShapeLayer()
            
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
            
            
            break;
            
        case .oneSideCornerRadiusBottomRight:
            //.topRight,
            let path = UIBezierPath(roundedRect:self.bounds,
                                    byRoundingCorners:[ .bottomRight],
                                    cornerRadii: CGSize(width: 10, height:  10))
            
            let maskLayer = CAShapeLayer()
            
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
            
            
            break;
            
        }
        
    }
    
    func centerVerticallyWithPadding(_ padding:CGFloat, andNumberOfLines numberOfLines:Int) -> Void {
        self.titleLabel?.numberOfLines = numberOfLines
        self.titleLabel?.textAlignment = NSTextAlignment.center
        let imageSize = self.imageView?.frame.size
        let titleSize = self.titleLabel?.frame.size
        let totalHeight = (imageSize!.height + titleSize!.height + padding)
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0,-imageSize!.width,-(totalHeight - titleSize!.height),0.0);
        self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize!.height),(titleSize!.width/2),0.0,0.0)
        
    }
    func centerVertically() -> Void {
        self.centerVerticallyWithPadding(6.0, andNumberOfLines: 1)
    }
}

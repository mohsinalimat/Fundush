//
//  CategoryViewCell.swift
//  Fundush
//
//  Created by Kavin Soni on 08/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var imgThumb: UIImageView!
    
    @IBOutlet weak var lblTitle: kLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
        innerView.backgroundColor = UIColor .white
//        innerView.layer.cornerRadius = 0
//        innerView.clipsToBounds = true
//        innerView.addDropShadow()
        lblTitle.updateLableWithType(kLabelType.bold)
        lblTitle.adjustsFontSizeToFitWidth = true
    
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        lblDefaultTitle.updateLableWithType(kLabelType.light)
        
        // Configure the view for the selected state
//    }
 
}

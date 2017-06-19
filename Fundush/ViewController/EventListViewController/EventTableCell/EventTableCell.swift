//
//  EventTableCell.swift
//  Fundush
//
//  Created by Kavin Soni on 10/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class EventTableCell: UITableViewCell {
    @IBOutlet weak var imgEvent: UIImageView!

    @IBOutlet weak var lblEventName: kLabel!
    @IBOutlet weak var viewEvent: UIView!
    @IBOutlet weak var btnJoin: kButton!
    @IBOutlet weak var lblEventJoin: kLabel!
    @IBOutlet weak var lblEventTime: kLabel!
    @IBOutlet weak var eventDetail: kLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewEvent.backgroundColor = UIColor.white
//        viewEvent.layer.cornerRadius = 10
//        viewEvent.addGreayDropShadow()
//        viewEvent.clipsToBounds = true
        
        lblEventJoin.updateLableWithType(kLabelType.bold)
        lblEventJoin.textColor = UIColor .appGrayColor()
        
        lblEventName.font = UIFont.appMediumFont(WithSize:16)
        lblEventName.textColor = UIColor .black
        
        lblEventTime.updateLableWithType(kLabelType.bold)
        lblEventTime.textColor = UIColor .appGrayColor()

//        eventDetail.updateLableWithType(kLabelType.bold)
        eventDetail.font = UIFont.appSemiboldFont(WithSize: 13)
        eventDetail.textColor = UIColor .appDarkGrayColor()
        
        btnJoin.updateButtonUIWithType(kButtonType.BlackButton)
        btnJoin.backgroundColor = UIColor .appThemeBlueColor()
        btnJoin.layer.cornerRadius = 5
        btnJoin.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

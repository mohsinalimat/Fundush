//
//  CountryCell.swift
//  DriverCity
//
//  Created by Kavin Soni on 28/05/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var btnCode: kLabel!
    @IBOutlet weak var lblCountryName: kLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCode.updateLableWithType(kLabelType.bold)
        lblCountryName.updateLableWithType(kLabelType.bold)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

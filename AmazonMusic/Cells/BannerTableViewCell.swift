//
//  BannerTableViewCell.swift
//  AmazonMusic
//
//  Created by Monali's Mac on 12/08/20.
//  Copyright © 2020 Monali's Mac. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerView: AACarousel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bannerView.backgroundColor = UIColor.black
        self.contentView.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  EachFeatureItemCell.swift
//  AmazonMusic
//
//  Created by Monali's Mac on 12/08/20.
//  Copyright © 2020 Monali's Mac. All rights reserved.
//

import UIKit

class EachFeatureItemCell: UICollectionViewCell {

    @IBOutlet weak var featuredSectionImage: UIImageView!
    @IBOutlet weak var contentNameLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.featuredSectionImage.contentMode = .scaleAspectFill
        featuredSectionImage.layer.cornerRadius = 10.0
        featuredSectionImage.clipsToBounds = true
        contentNameLabel.textColor = .white
        castLabel.textColor = .gray
    }

    
}

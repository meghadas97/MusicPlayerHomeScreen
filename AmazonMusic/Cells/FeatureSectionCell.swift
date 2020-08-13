//
//  FeatureSectionCell.swift
//  AmazonMusic
//
//  Created by Monali's Mac on 12/08/20.
//  Copyright © 2020 Monali's Mac. All rights reserved.
//

import UIKit

class FeatureSectionCell: UITableViewCell {

    @IBOutlet weak var featureSectionCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.featureSectionCollectionView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    
}

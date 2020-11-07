//
//  BooklLstingCellTableViewCell.swift
//  BookStoreExample
//
//  Created by Monali Das on 07/11/20.
//  Copyright © 2020 Monali Das. All rights reserved.
//

import UIKit

class BooklLstingCell: UITableViewCell {

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

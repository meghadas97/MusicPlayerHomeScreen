//
//  EachBookItemCell.swift
//  BookStoreExample
//
//  Created by Monali Das on 07/11/20.
//  Copyright © 2020 Monali Das. All rights reserved.
//

import UIKit

class EachBookItemCell: UICollectionViewCell {

    @IBOutlet weak var imageOfBook: UIImageView!
    @IBOutlet weak var titleOfBook: UILabel!
    @IBOutlet weak var subtitleOfBook: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.priceButton.setTitleColor(.white, for: .normal)
        self.priceButton.backgroundColor = .blue
        self.titleOfBook.textColor = .white
        self.subtitleOfBook.textColor = .white
    }

}

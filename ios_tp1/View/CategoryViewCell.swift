//
//  CategoryViewCell.swift
//  ios_tp1
//
//  Created by  on 09/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func loadComponent(cat: Category) -> UICollectionViewCell {
        categoryLabel.text = cat.name
        return self
    }

}

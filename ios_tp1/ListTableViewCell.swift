//
//  ListTableViewCell.swift
//  ios_tp1
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setCell(poster: UIImage, title: String, date: String, synopsis: String) {
        self.iconImageView.image = poster
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.synopsisLabel.text = synopsis
    }
    
    @IBAction func didOpenFilmView(sender: AnyObject) {
        print("In")
    }
    
}

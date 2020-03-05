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
    
    func setCell(poster: UIImage?, title: String, date: String, synopsis: String) {
        print(poster)
        self.iconImageView.imageFromServerURL(urlString: "https://image.tmdb.org/t/p/w500\(String(describing: poster))")
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.synopsisLabel.text = synopsis
    }

}
extension UIImageView {
public func imageFromServerURL(urlString: String) {
    self.image = nil
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
        if error != nil { return }
        DispatchQueue.main.async(execute: { () -> Void in self.image = UIImage(data: data!) })
    }).resume()
}}


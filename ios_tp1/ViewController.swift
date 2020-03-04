//
//  ViewController.swift
//  ios_tp1
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import UIKit
    
    
class ViewController: UIViewController {


    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var categorieLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    
    var movie: Movie = Movie(title: "Alita", subtitle: "Battle Angel", releaseDate: "14/02/2019", duration: 120, categories: ["Science Ficiton", "Action"], synopsis: "Lorsqu’Alita se réveille sans aucun souvenir de qui elle est, dans un futur qu’elle ne reconnaît pas, elle est accueillie par Ido, un médecin qui comprend que derrière ce corps de cyborg abandonné, se cache une jeune femme au passé extraordinaire. Ce n’est que lorsque les forces dangereuses et corrompues qui gèrent la ville d’Iron City se lancent à sa poursuite qu’Alita découvre la clé de son passé - elle a des capacités de combat uniques, que ceux qui détiennent le pouvoir veulent absolument maîtriser. Si elle réussit à leur échapper, elle pourrait sauver ses amis, sa famille, et le monde qu’elle a appris à aimer.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie.title
        subTitleLabel.text = movie.subtitle
        dateLabel.text = movie.releaseDate
        timeLabel.text = "\(String(movie.duration)) min"
        categorieLabel.text = movie.categories.joined(separator: ", ")
        synopsisLabel.text = movie.synopsis
    }
    
    @IBAction func didOpenTrailer(sender: AnyObject) {
        if let url = URL(string: "https://www.youtube.com/watch?v=75QXYNz5Q8o") {
            UIApplication.shared.open(url)
        }
    }

}


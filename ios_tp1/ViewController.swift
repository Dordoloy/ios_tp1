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
    @IBOutlet weak var categorieLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var trailerButton: UIButton!
    
    var movie: Movie = Movie(id: 0, title: "", subtitle: "", releaseDate: "", duration: 0, categories: [], synopsis: "")
    
    var id: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviesRepository = MovieService()
        moviesRepository.getMovieDetails(id: id, completionHandler: { response in
            if let details = response {
                self.movie = Movie(from: details)
                DispatchQueue.main.async() {
                    self.backgroundImage.imageFromServerURL(urlString: "https://image.tmdb.org/t/p/w500\(String(describing: self.movie.poster!))")
                    self.titleLabel.text = self.movie.title
                    self.dateLabel.text = self.movie.releaseDate
                    self.timeLabel.text = "\(String(self.movie.duration)) min"
                    self.categorieLabel.text = self.movie.categories.joined(separator: ", ")
                    self.synopsisLabel.text = self.movie.synopsis
                }
            }
        })
    }
    
    @IBAction func didOpenTrailer(sender: AnyObject) {
        if let url = URL(string: "https://www.youtube.com/watch?v=75QXYNz5Q8o") {
            UIApplication.shared.open(url)
        }
    }

}


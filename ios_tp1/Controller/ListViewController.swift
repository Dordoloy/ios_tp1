//
//  ListViewController.swift
//  ios_tp1
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    let cellID:String = "ListTableViewCellID"
    
    var movies: [Movie] = []
    let segueMovieListIdentifier = "listToDetail"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieService.instance.getMovies { (movieListResponse) in
            print("")
            
        }
        
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: cellID)
        
        let moviesRepository = MovieService()
        moviesRepository.getMovies() { response in
            if let movieList = response {
                self.movies = movieList.transformToMovieArray()
                DispatchQueue.main.async() {
                    self.listTableView.reloadData()
                }
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListTableViewCell

        let movie = movies[indexPath.item]
        
        if let moviePoster = movie.poster{
            cell.setCell(poster: moviePoster, title: movie.title, date: movie.releaseDate, synopsis: movie.synopsis)
        }
        else {
            cell.setCell(poster: nil, title: movie.title, date: movie.releaseDate, synopsis: movie.synopsis)
            
        }
        
    
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueMovieListIdentifier, sender: movies[indexPath.item].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueMovieListIdentifier {
            let viewController = segue.destination as! ViewController
            viewController.id = sender as! Int
            //viewController.movie = sender as! Movie
        }
    }
    
    //a chaque fois qu'une cell est display, transforme la cell d'une taille de 0.8 à la taille jusqu'à la taille d'origine en 0.4 secs
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }

}
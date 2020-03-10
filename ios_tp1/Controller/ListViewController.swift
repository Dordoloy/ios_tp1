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
    var currentCatagory: Category = Category(id: -1, name: "category")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: cellID)
        
        let moviesRepository = MovieService()
        moviesRepository.getMovies(idCat: self.currentCatagory.id!) { response in
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
        
        cell.setCell(poster: movie.poster, title: movie.title, date: movie.releaseDate, synopsis: movie.synopsis)
    
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueMovieListIdentifier, sender: movies[indexPath.item].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueMovieListIdentifier {
            let viewController = segue.destination as! DetailsViewController
            viewController.id = sender as! Int
        }
    }
    
    //every time the cell is displayed, transoform the size of the cell from 0.8 to 1.0 in 0.4 secs
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }

}

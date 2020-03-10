//
//  FilmService.swift
//  ios_tp1
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation


class MovieService {
    
    static let instance: MovieService = MovieService()
    
    static let filmUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=a52d1043941e9207fc7c8b08ed0fef4e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=")!
    
    
    func getMovies(idCat: Int = 0, completionHandler: @escaping (MovieListResponse?) -> Void){
        
        let url = "\(MovieService.filmUrl)\(idCat)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            guard error == nil else {
                print(error!.localizedDescription) // We show in console where is the request problem
                return
            }
            if let data = data {
                // Init JSONDecoder object and decode json data into Genre object
                let movieList = try? JSONDecoder().decode(MovieListResponse.self, from: data)
                completionHandler(movieList)
            
            }
        }
        requestAPI.resume()
    }
    
    func getMovieDetails(id: Int, completionHandler: @escaping (DetailsResponse?) -> Void) {
        
        let detailUrl = "https://api.themoviedb.org/3/movie/\(id)?api_key=a52d1043941e9207fc7c8b08ed0fef4e&language=en-US&append_to_response=videos"
        
        let request = NSMutableURLRequest(url: URL(string: detailUrl)!)
        request.httpMethod = "GET"
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            guard error == nil else {
                print(error!.localizedDescription) // We show in console where is the request problem
                return
            }
            if let data = data {
                // Init JSONDecoder object and decode json data into Genre object
                let details = try? JSONDecoder().decode(DetailsResponse.self, from: data)
                completionHandler(details)
            
            }
        }
        requestAPI.resume()
    }
    
    func getMovieCategories(id: Int, completionHandler: @escaping (CategoriesResponse?) -> Void) {
        
        let detailUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=a52d1043941e9207fc7c8b08ed0fef4e&language=en-US"
        
        let request = NSMutableURLRequest(url: URL(string: detailUrl)!)
        request.httpMethod = "GET"
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            guard error == nil else {
                print(error!.localizedDescription) // We show in console where is the request problem
                return
            }
            if let data = data {
                // Init JSONDecoder object and decode json data into Genre object
                let categories = try? JSONDecoder().decode(CategoriesResponse.self, from: data)
                completionHandler(categories)
            
            }
        }
        requestAPI.resume()
    }
}


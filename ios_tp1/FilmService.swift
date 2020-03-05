//
//  FilmService.swift
//  ios_tp1
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation


class FilmService {
    
    static let instance: FilmService = FilmService()
    
    static let filmUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=a52d1043941e9207fc7c8b08ed0fef4e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1")!
    
    
    func APIRequest(completionHandler: @escaping (MovieListResponse?) -> Void){
        
        let url = "\(FilmService.filmUrl)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            guard error == nil else {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
                return
            }
            if let data = data {
                // Init JSONDecoder object and decode json data into Genre object
                let movieList = try? JSONDecoder().decode(MovieListResponse.self, from: data)
                print(movieList!)
                completionHandler(movieList)
            
            }
        }
        requestAPI.resume()
    }
}


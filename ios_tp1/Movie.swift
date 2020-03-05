//
//  Movie.swift
//  ios_tp1
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var title: String
    var subtitle: String
    var releaseDate: String
    var duration: Int
    var categories: [String]
    var synopsis: String
    var poster: String?
    
    init(title: String, subtitle: String, releaseDate: String, duration: Int, categories: [String], synopsis: String) {
        self.title = title
        self.subtitle = subtitle
        self.releaseDate = releaseDate
        self.duration = duration
        self.categories = categories
        self.synopsis = synopsis
        self.poster = ""
    }
    
    init(poster: String?, title: String, date: String, synopsis: String) {
        self.title = title
        self.subtitle = ""
        self.releaseDate = date
        self.duration = 0
        self.categories = []
        self.synopsis = synopsis
        self.poster = poster
    }
    
    init(from movieResponse: MovieResponse) {
        self.poster = movieResponse.posterPath
        self.title = movieResponse.title
        self.subtitle = ""
        self.releaseDate = movieResponse.releaseDate
        self.synopsis = movieResponse.overview
        self.categories = []
        self.duration = 0
    }
}

//
//  Movie.swift
//  ios_tp1
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    var id: Int
    var title: String
    var subtitle: String
    var releaseDate: String
    var duration: Int
    var categories: [String]
    var synopsis: String
    var poster: String?
    var videos: Result?
    
    init(id: Int, title: String, subtitle: String, releaseDate: String, duration: Int, categories: [String], synopsis: String, videos: Result?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.releaseDate = releaseDate
        self.duration = duration
        self.categories = categories
        self.synopsis = synopsis
        self.poster = ""
        
    }
    
    init(from movieResponse: MovieResponse) {
        self.id = movieResponse.id
        self.poster = movieResponse.posterPath
        self.title = movieResponse.title
        self.subtitle = movieResponse.originalTitle
        self.releaseDate = movieResponse.releaseDate
        self.synopsis = movieResponse.overview
        self.categories = []
        self.duration = 0
    }
    
    init(from detailsResponse: DetailsResponse) {
        self.id = detailsResponse.id
        self.poster = detailsResponse.backdropPath
        self.title = detailsResponse.title
        self.subtitle = detailsResponse.originalTitle
        self.releaseDate = detailsResponse.releaseDate
        self.synopsis = detailsResponse.overview
        self.categories = detailsResponse.genres.map({genre -> String in genre.name})
        self.duration = detailsResponse.runtime
        self.videos = detailsResponse.videos.results[0]
    }
}

//
//  Movie.swift
//  ios_tp1
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation

struct Movie {
    var id: Int
    var title: String
    var subtitle: String
    var releaseDate: String
    var duration: Int
    var categories: [String]
    var synopsis: String
    var poster: String
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
        self.id = movieResponse.id ?? 0
        self.poster = movieResponse.posterPath ?? movieResponse.backdropPath ?? ""
        self.title = movieResponse.title ?? "unknown title"
        self.subtitle = movieResponse.originalTitle ?? movieResponse.title ?? "..."
        self.releaseDate = movieResponse.releaseDate ?? "unknown realease date"
        self.synopsis = movieResponse.overview ?? "unknown overview"
        self.categories = []
        self.duration = 0
    }
    
    init?(from detailsResponse: DetailsResponse) {
        self.id = detailsResponse.id
        self.poster = detailsResponse.backdropPath ?? detailsResponse.posterPath ?? ""
        self.title = detailsResponse.title ?? "unknown title"
        self.subtitle = detailsResponse.originalTitle ?? "unknown subtitle"
        self.releaseDate = detailsResponse.releaseDate ?? "unknown release date"
        self.synopsis = detailsResponse.overview ?? "unknown overview"
        self.categories = detailsResponse.genres.compactMap({genre -> String in genre.name})
        self.duration = detailsResponse.runtime ?? 0
        self.videos = detailsResponse.videos!.results.first
    }
}

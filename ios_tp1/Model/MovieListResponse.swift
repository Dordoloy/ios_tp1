//
//  MovieListResponse.swift
//  ios_tp1
//
//  Created by  on 05/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation


// MARK: - MovieListResponse
struct MovieListResponse: Codable {
    let page, totalResults, totalPages: Int
    let results: [MovieResponse]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    func transformToMovieArray() -> [Movie] {
        return self.results.compactMap({ movieResponse -> Movie in
            Movie(from: movieResponse)
        })
    }
}

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath, originalLanguage, originalTitle: String?
    let genreIDS: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

//
//  DetailsResponse.swift
//  ios_tp1
//
//  Created by  on 06/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation


struct DetailsResponse: Codable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let videos: Videos

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case videos
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - Videos
struct Videos: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let key: String

    enum CodingKeys: String, CodingKey {
        case id
        case key
    }
}


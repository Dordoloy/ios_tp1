//
//  DetailsResponse.swift
//  ios_tp1
//
//  Created by  on 06/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation


struct DetailsResponse: Codable {
    let backdropPath: String?
    let genres: [Genre]
    let id: Int
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int?
    let title: String?
    let video: Bool?
    let videos: Videos?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres, id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title, video
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


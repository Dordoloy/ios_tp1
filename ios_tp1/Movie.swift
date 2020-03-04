//
//  Movie.swift
//  ios_tp1
//
//  Created by  on 03/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    var subtitle: String
    var releaseDate: String
    var duration: Int
    var categories: [String]?
    var synopsis: String
    var poster: String
    
    init(title: String, subtitle: String, releaseDate: String, duration: Int, categories: [String], synopsis: String) {
        self.title = title
        self.subtitle = subtitle
        self.releaseDate = releaseDate
        self.duration = duration
        self.categories = categories
        self.synopsis = synopsis
        self.poster = ""
    }
    
    func getCategoriesAsString(categoriesParams: [String]?) -> String {
          guard let categories = categoriesParams else {
              return ""
          }
          var categoriesAsString = ""
          categories.forEach { category in
              categoriesAsString += category + ", "
          }
          return String(categoriesAsString.dropLast(2))
       }
}

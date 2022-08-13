//
//  News.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import Foundation

struct News: Decodable {
    var articles: [Article]
    var totalResults: Int
}

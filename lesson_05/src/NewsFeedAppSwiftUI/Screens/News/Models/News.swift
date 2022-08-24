//
//  News.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import Foundation

struct News: Decodable {
    var articles: [Article]
    var totalResults: Int
}

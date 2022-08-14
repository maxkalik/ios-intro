//
//  Article.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import Foundation

struct Article: Decodable {
    var author: String?
    var title: String
    var description: String?
    var url: String
    var publishedAt: String
}

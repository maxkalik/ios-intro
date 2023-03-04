//
//  Configuration.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import Foundation

struct Configuration {
    static let apiKey: String = "9e464d6eb08644e3acb3efaf9e5c1ae7"
    static let scheme: String = "https"
    static let host: String = "newsapi.org"
    static let path: String = "/v2/everything"
    static let queries: [String: String] = [
        "q": "apple",
//        "from": "2023-11-27",
        "sortBy": "popularity"
    ]
}

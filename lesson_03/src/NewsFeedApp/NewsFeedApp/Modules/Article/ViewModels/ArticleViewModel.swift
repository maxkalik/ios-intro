//
//  ArticleViewModels.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import Foundation

protocol ArticleViewModel {
    
}

final class ArticleViewModelImplementation: ArticleViewModel {

    init() {
        
    }
    
    deinit {
        print("Deinit \(self)")
    }
}

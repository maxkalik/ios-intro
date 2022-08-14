//
//  ArticleCellViewModel.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/14/22.
//

import Foundation

// MARK: - Protocol

protocol ArticleCellViewModel {
    var title: String { get }
    var description: String? { get }
    var published: String { get }
}

// MARK: - Implementation

final class ArticleCellViewModelImplementation: ArticleCellViewModel {
    
    private let model: Article
    
    init(model: Article) {
        self.model = model
    }
    
    lazy var title: String = model.title
    
    lazy var description: String? = model.description
    
    private var date: Date {
        let dateFormatter = DateFormatter()
        // 2022-08-13T18:02:19Z
        // This is in ISO 8601 format, which is the most common standard
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: model.publishedAt)
        return date ?? Date()
    }
    
    var published: String {
        let interval = Date() - date
        guard let months = interval.month,
              let days = interval.day,
              let hours = interval.hour,
              let minutes = interval.minute else { return "" }
        if months > 0 {
            return "\(months) months ago"
        } else if days > 0 {
            return "\(days) days ago"
        } else if hours > 0 {
            return "\(hours) hours ago"
        } else if minutes > 0 {
            return "\(minutes) minutes ago"
        } else {
            return "Just now"
        }
    }
}

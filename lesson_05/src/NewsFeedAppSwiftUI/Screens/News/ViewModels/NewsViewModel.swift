//
//  NewsViewModel.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var errorMessage: String = ""
    @Published var shouldShowErrorMessage: Bool = false
    @Published var articles: [ArticleViewModel] = []
    
    private lazy var networkService = NetworkService()
    
    init() {
        getNews()
    }
    
    var title: String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL d"
        return "News • " + dateFormatter.string(from: now)
    }
    
    private func getNews() {
        self.shouldShowErrorMessage = false
        self.isLoading = true

        Task {
            do {
                let news = try await networkService.fetchNews()
                await MainActor.run {
                    self.isLoading = false
                    self.articles = news.articles.map { ArticleViewModel(model: $0) }
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    self.shouldShowErrorMessage = true
                    if let error = error as? NetworkServiceError {
                        print("🚩", error.message)
                        self.errorMessage = error.message
                    } else {
                        print("🚩", error.localizedDescription)
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
}

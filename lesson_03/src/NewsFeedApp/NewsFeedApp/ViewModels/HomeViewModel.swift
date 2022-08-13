//
//  HomeViewModel.swift
//  NewsFeedApp
//
//  Created by Maksim Kalik on 8/13/22.
//

import Foundation

class HomeViewModel {

    private let apiKey = "9e464d6eb08644e3acb3efaf9e5c1ae7"
    var news: [Article] = [
        Article(author: "Elizabeth  Washington", title: "Cleaning service employee charged for fatally assaulting coworker at GM Orion Assembly plant, police say - WDIV ClickOnDetroit", url: "", publishedAt: "2022-08-13T18:02:19Z"),
        Article(author: "Griffin Kelly", title: "Woke' NYC Starbucks now a haven for junkies, drunks and homeless - New York Post", url: "", publishedAt: "2022-08-13T17:41:00Z"),
        Article(author: "Unknown", title: "Former Deutsche Bank co-CEO Anshu Jain dies - Reuters", url: "", publishedAt: "2022-08-13T17:08:00Z")
    ]
    
    func getNews() {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-07-13&sortBy=publishedAt&apiKey=\(apiKey)") else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if (error != nil) {
                print(error)
            } else {
                if let data = data, let values = try? JSONDecoder().decode(News.self, from: data) {
                    print(values)
                } 
            }
        }
        dataTask.resume()
    }
}

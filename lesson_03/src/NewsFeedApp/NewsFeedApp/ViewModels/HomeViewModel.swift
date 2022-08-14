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
        Article(
            author: "Elizabeth  Washington",
            title: "Cleaning service employee charged for fatally assaulting coworker at GM Orion Assembly plant, police say - WDIV ClickOnDetroit",
            description: "Olaf Scholz versuchte in der Sommer-Pressekonferenz die Energiesituation zu beschwichtigen. „Wir werden immer genug kriegen, darum geht es ja.“ Einen „Wut-Winter“ wegen hoher Energiepreise, sieht er nicht. Die Finanzmärkte sprechen eine ganz andere Sprache.",
            url: "",
            publishedAt: "2022-08-13T18:02:19Z"
        ),
        Article(
            author: "Griffin Kelly",
            title: "Woke' NYC Starbucks now a haven for junkies, drunks and homeless - New York Post",
            description: "The man suspected of stabbing Salman Rushdie at an event in the United States on Friday has been charged with attempted murder.",
            url: "",
            publishedAt: "2022-08-13T17:41:00Z"
        ),
        Article(
            author: "Unknown",
            title: "Former Deutsche Bank co-CEO Anshu Jain dies - Reuters",
            description: "The court-authorized search was a remarkable moment for Donald Trump, and a turning point in his relationship with the Justice Department.",
            url: "",
            publishedAt: "2022-08-13T17:08:00Z"
        )
    ]
    
    var title: String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL d"
        return "News • " + dateFormatter.string(from: now)
    }
    
    func getNews() {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?q=apple&sortBy=popularity?country=us&apiKey=\(apiKey)") else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if (error != nil) {
                print(error)
            } else {
                if let data = data, let values = try? JSONDecoder().decode(News.self, from: data) {
                    print(values.articles.count, values.totalResults)
                } 
            }
        }
        dataTask.resume()
    }
}

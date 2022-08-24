//
//  ContentView.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .scaleEffect(1.5)
        } else {
            NavigationView {
                List(viewModel.articles) { viewModel in
                    
//                    NavigationLink {
//                        ArticleView(viewModel: viewModel)
//                    } label: {
//                        ArticleView(viewModel: viewModel)
//                    }
                    
                    // To hide navigation arrows
                    NewsRow(viewModel: viewModel)
                        .background(
                            NavigationLink("", destination: ArticleView(viewModel: viewModel))
                        )
                }
                .navigationTitle(viewModel.title)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

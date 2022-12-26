//
//  ContentView.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import SwiftUI

class SomeGlobalViewModel: ObservableObject {
    @Published var someValue: String = "some value"
}

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    @StateObject var someGlobalViewModel = SomeGlobalViewModel()
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        if viewModel.isLoading {
            ProgressView()
                .scaleEffect(1.5)
        } else {
            NavigationView {
                List(viewModel.articles) { article in
                    
                    NavigationLink {
                        ArticleView(viewModel: article)
                    } label: {
                        NewsRow(viewModel: article)
                    }
                    
                    // To hide navigation arrows
//                    NewsRow(viewModel: article)
//                        .background(
//                            NavigationLink("", destination: ArticleView(viewModel: article))
//                        )
//                        .onAppear {
//                            // check here is this item is the last in the list then you can go to load more
//
//                            let thresholdIndex = viewModel.articles.index(viewModel.articles.endIndex, offsetBy: -5)
//                            if viewModel.articles.firstIndex(where: { $0.id == article.id }) == thresholdIndex {
//                                print("load more")
//                            }
//                        }
                }
                .navigationTitle(viewModel.title)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .listStyle(.plain)
            .alert(isPresented: $viewModel.shouldShowErrorMessage, content: {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage),
                    dismissButton: .cancel()
                )
            })
            .environmentObject(someGlobalViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

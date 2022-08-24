//
//  NewsRow.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import SwiftUI

struct NewsRow: View {
    
    let viewModel: ArticleViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.title)
                .font(.system(size: 22, weight: .bold))
            if let description = viewModel.description {
                Text(description)
                    .font(.system(size: 15))
            }
            Text(viewModel.published)
                .font(.system(size: 15))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}

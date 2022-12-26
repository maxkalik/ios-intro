//
//  NewsRow.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import SwiftUI
import Kingfisher

struct NewsRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let viewModel: ArticleViewModel
    
    var body: some View {
        HStack(spacing: 10) {

//            KFImage(viewModel.imageUrl)
//                .resizable()
//                .placeholder {
//                    ProgressView()
//                }
//                .frame(maxWidth: 64, maxHeight: 64)
//                .aspectRatio(contentMode: .fill)
//                .cornerRadius(32)
            
            UserpicStackView(userpicURLs: [viewModel.imageUrl, nil], width: 76)
                .padding(.leading, 10)
                .animation(nil)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(viewModel.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(colorScheme == .dark ? .orange : .black)
                //            if let description = viewModel.description {
                //                Text(description)
                //                    .font(.system(size: 15))
                //            }
                Text(viewModel.published)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
//        .padding(.vertical, 5)
    }
}

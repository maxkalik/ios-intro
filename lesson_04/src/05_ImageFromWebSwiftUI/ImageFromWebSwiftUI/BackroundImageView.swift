//
//  LoginView.swift
//  SimpleDelegateSwiftUI
//
//  Created by Maksim Kalik on 8/15/22.
//

import SwiftUI

struct BackroundImageView: View {
    
    @StateObject private var viewModel = BackgroundImageViewModel()
    
    var body: some View {
        
        // 1. Using Data and UIImage
        
//        Image(uiImage: UIImage(data: viewModel.imageData) ?? UIImage())
//            .resizable()
//            .scaledToFill()
//            .ignoresSafeArea()
//            .task {
//                await viewModel.fetchImage()
//            }
        
        
        // 2. AsyncImage (from iOS 15) - without cashing
        
        AsyncImage(
            url: URL(string: viewModel.imageURL),
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            },
            placeholder: {
                ProgressView()
            }
        )
        .ignoresSafeArea()
    }
}

struct BackroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackroundImageView()
    }
}


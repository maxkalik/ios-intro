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
        
        Image(uiImage: UIImage(data: viewModel.imageData) ?? UIImage())
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .task {
                await viewModel.fetchImage()
            }
        
    }
}

struct BackroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackroundImageView()
    }
}


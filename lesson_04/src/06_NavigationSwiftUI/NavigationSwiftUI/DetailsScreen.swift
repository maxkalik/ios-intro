//
//  DetailsScreen.swift
//  NavigationSwiftUI
//
//  Created by Maksim Kalik on 8/21/22.
//

import SwiftUI

struct DetailsScreen: View {
    
    var model: ContentModel
        
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { geometry in
                    Image(model.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: imageFrame(geometry: geometry).width,
                            height: imageFrame(geometry: geometry).height
                        )
                        .clipped()
                        .offset(y: imageOffsetY(geometry: geometry))
                }
                .frame(height: 400) // default height

                VStack(alignment: .leading, spacing: 15) {
                    Text(model.title)
                        .font(.system(size: 34, weight: .bold))
                    Text(model.articleContent)
                        .lineLimit(nil)
                }
                .padding()
            }
            .padding(.bottom, 30)
        }
        .ignoresSafeArea()
        .background(Color.white)
    }
    
    // MARK: Helpers
    
    func isImageOffset(_ geometry: GeometryProxy) -> Bool {
        geometry.frame(in: .global).minY <= 0
    }
    
    func imageOffsetY(geometry: GeometryProxy) -> CGFloat {
        if isImageOffset(geometry) {
            // Scroll up makes image offset
            return geometry.frame(in: .global).minY / 9
        } else {
            // Pull down makes image height larger than original
            return -geometry.frame(in: .global).minY
        }
    }
    
    func imageFrame(geometry: GeometryProxy) -> CGSize {
        if isImageOffset(geometry) {
            return CGSize(width: geometry.size.width, height: geometry.size.height)
        } else {
            return CGSize(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
        }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(model: ContentModel.dummy)
    }
}

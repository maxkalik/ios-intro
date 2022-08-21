//
//  ContentRow.swift
//  NavigationSwiftUI
//
//  Created by Maksim Kalik on 8/21/22.
//

import SwiftUI

struct ContentRow: View {
    
    var model: ContentModel

    var body: some View {
        HStack(spacing: 15) {
            Image(model.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(10)
            Text(model.title)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentRow(model: ContentModel.dummy)
            .frame(width: 320, height: 50)
    }
}

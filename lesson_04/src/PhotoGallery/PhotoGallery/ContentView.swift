//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Maksim Kalik on 8/16/22.
//

import SwiftUI

struct ContentView: View {
    
    private let imageNames: [String] = (1...20).map { String(format: "%02d", $0) }
    let columnsNumber: CGFloat = 3
    
    var body: some View {
        GeometryReader { geometry in
            
            let side = geometry.size.width / columnsNumber
            let columns = Array(
                repeating: GridItem(.fixed(side), spacing: 2),
                count: Int(columnsNumber)
            )
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .frame(width: side, height: side)
                            .clipped()
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .padding(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

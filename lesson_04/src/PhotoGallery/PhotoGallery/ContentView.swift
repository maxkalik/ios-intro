//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Maksim Kalik on 8/16/22.
//

import SwiftUI

struct ContentView: View {
    
    let data = (1...100).map { "Item \($0)" }
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
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .frame(width: side, height: side)
                            .background(Color.gray)
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

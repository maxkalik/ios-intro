//
//  ContentView.swift
//  MagicButtonSwiftUI
//
//  Created by Maksim Kalik on 8/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var word: String = ""
    
    private let words: [String] = ["xcode", "ios", "playground", "iphone", "ipdad", "device"]
    
    var body: some View {
        VStack {
            Text(word)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .onAppear {
                    self.word = words.randomElement() ?? ""
                }
            
            Button {
                self.word = words.randomElement() ?? ""
            } label: {
                Text("Magic Button")
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

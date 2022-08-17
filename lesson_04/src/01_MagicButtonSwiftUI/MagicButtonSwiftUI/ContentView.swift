//
//  ContentView.swift
//  MagicButtonSwiftUI
//
//  Created by Maksim Kalik on 8/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var word: String = ""
    @State private var backroundColor: Color = Color.random
    
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
                self.backroundColor = Color.random
            } label: {
                Text("Magic Button")
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

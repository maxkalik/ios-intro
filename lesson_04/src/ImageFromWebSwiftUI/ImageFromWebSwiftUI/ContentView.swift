//
//  ContentView.swift
//  ImageFromWebSwiftUI
//
//  Created by Maksim Kalik on 8/16/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentingModal = false
    
    var body: some View {
        VStack {
            Button {
                presentingModal = true
            } label: {
                Text("Show Image")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
                    .padding()
            }
            .background(Color.blue)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $presentingModal) {
            BackroundImageView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

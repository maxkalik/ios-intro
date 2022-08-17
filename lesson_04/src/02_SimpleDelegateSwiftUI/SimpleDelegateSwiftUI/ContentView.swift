//
//  ContentView.swift
//  SimpleDelegateSwiftUI
//
//  Created by Maksim Kalik on 8/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentingModal = false
    @State var email: String = ""
    
    var body: some View {
        VStack {
            if !email.isEmpty {
                Text("Welcome, \(email)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .padding()
            }
            
            Button {
                self.presentingModal = true
            } label: {
                Text("Sign In")
                    .foregroundColor(Color.white)
                    .font(.system(size: 17, weight: .bold))
                    .padding()
            }
            .modifier(ButtonModifier())
            .sheet(isPresented: $presentingModal) {
                LoginView(
                    presentedAsModal: self.$presentingModal,
                    email: $email
                )
            }
        }
        .fullScreen()
        .background(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

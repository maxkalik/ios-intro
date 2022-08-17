//
//  LoginView.swift
//  SimpleDelegateSwiftUI
//
//  Created by Maksim Kalik on 8/15/22.
//

import SwiftUI

struct LoginView: View {

    @Binding var presentedAsModal: Bool
    @Binding var email: String
    @State private var presentAlert: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            TextField("example@email.com", text: $email)
                .multilineTextAlignment(.center)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.bottom, 20)
            
            Button {
                if email.isEmpty {
                    self.presentAlert = true
                } else {
                    self.presentedAsModal = false
                }
            } label: {
                Text("Login")
                    .foregroundColor(Color.white)
                    .font(.system(size: 17, weight: .bold))
                    .padding()
            }
            .modifier(ButtonModifier())
            .alert(isPresented: $presentAlert, content: {
                Alert(
                    title: Text("Login Failed"),
                    message: Text("Please type a correct email address."),
                    dismissButton: .cancel()
                )
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(presentedAsModal: .constant(false), email: .constant(""))
    }
}

//
//  ContentView.swift
//  02_MVVM-API-JSON-Example
//
//  Created by Maksim Kalik on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.users) { user in
                        UserView(user: user)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Users")
            }
        }
        // .onAppear(perform: viewModel.fetchUsers)
        .onAppear(perform: viewModel.fetchUsersCombine)
        .alert(
            isPresented: $viewModel.shouldShowErrorMessage,
            error: viewModel.errorMessage) {
                Button {
//                    viewModel.fetchUsers()
                    viewModel.fetchUsersCombine()
                } label: {
                    Text("Retry")
                }
            }
    }
}

struct UserView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name**: \(user.name)")
            Text("**Email**: \(user.email)")
            Divider()
            Text("**Company** \(user.company.name)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            .gray.opacity(0.1),
            in: RoundedRectangle(cornerRadius: 10, style: .continuous)
        )
        .padding(.horizontal, 4)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

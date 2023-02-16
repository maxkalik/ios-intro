//
//  ContentView.swift
//  01_MVVMTextFieldExample
//
//  Created by Maksim Kalik on 2/16/23.
//

import SwiftUI

// MARK: ViewModel

class ContentViewModel: ObservableObject {
    
    @Published var textFieldValue: String = "" {
        didSet {
            // BEFORE: didSet observer
            // messageText = textFieldValue.isEmpty ? "Empty" : textFieldValue
        }
    }
    @Published var messageText: String = "Empty"
    
    init() {
        // AFTER: With combine
        $textFieldValue
            .map { $0.isEmpty ? "Empty" : $0 }
            .assign(to: &$messageText)
    }
}

// MARK: View

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter some text here", text: $viewModel.textFieldValue)
                .frame(height: 50)
                .border(Color.black)
                .padding(20)
            
            Text(viewModel.messageText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

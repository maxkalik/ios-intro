//
//  ContentViewModel.swift
//  02_MVVM-API-JSON-Example
//
//  Created by Maksim Kalik on 2/16/23.
//

import Foundation
import Combine

enum UserError: LocalizedError {
    case custom(error: Error)
    case decodingFailure
    case invalidStatusCode
    case memoryError
    
    var errorDescription: String? {
        switch self {
        case .custom(let error):
            return error.localizedDescription
        case .decodingFailure:
            return "Failed to decode response"
        case .invalidStatusCode:
            return "Failed with invalid status code"
        case .memoryError:
            return "Memory error"
        }
    }
}

final class ContentViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var shouldShowErrorMessage: Bool = false
    @Published var errorMessage: UserError?
    @Published private(set) var isLoading: Bool = true

    private let urlString = "https://jsonplaceholder.typicode.com/users"
    
    private let decoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // Combine: We need this bag to store our publishers
    // It means they will live as long as view model will be in memory
    private var bag = Set<AnyCancellable>()
    
    // Combine way
    func fetchUsersCombine() {
        guard let url = URL(string: urlString) else {
            // better to throw an error here
            return
        }
        
        isLoading = true

        URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            // .map(\.data) // KeyPath to response.data
            
            // Just to decode in this way we cannot handle decoding error
            // .decode(type: [User].self, decoder: decoder)
            
            // To handle decoding errors we need to use tyrMap
            // and implement everything inside of this block
            .tryMap({ result in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 300 else {
                    throw UserError.invalidStatusCode
                }
                
                return result.data
            })
            // Just for instance this second tryMap,
            // but better to keep login inside of one scope in this case
            // We need return value or throw an error (it cannot be void)
            .tryMap({ [weak self] data in
                guard let self = self else {
                    throw UserError.memoryError
                }
                guard let users = try? self.decoder.decode([User].self, from: data) else {
                    throw UserError.decodingFailure
                }
                return users
            })
            .sink { [weak self] result in
                
                // Stop loading in any case
                defer { self?.isLoading = false }
                
                // Handle error from result
                switch result {
                case .failure(let error):
                    self?.shouldShowErrorMessage = true
                    self?.errorMessage = UserError.custom(error: error)
                default: break
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &bag)
    }
    
    // Classic way
    func fetchUsers() {
        
        isLoading = true
        shouldShowErrorMessage = false

        guard let url = URL(string: urlString) else {
            // better to throw an error here
            return
        }
        
        URLSession
            .shared
            .dataTask(with: url) { [weak self] data, response, error in
                if let data = data,
                   let users = try? self?.decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async { [weak self] in
                        self?.users = users
                        self?.isLoading = false
                    }
                } else if let error = error {
                    DispatchQueue.main.async { [weak self] in
                        self?.shouldShowErrorMessage = true
                        self?.errorMessage = UserError.custom(error: error)
                        self?.isLoading = false
                    }
                } else {
                    DispatchQueue.main.async { [weak self] in
                        self?.shouldShowErrorMessage = true
                        self?.errorMessage = UserError.decodingFailure
                        self?.isLoading = false
                    }
                }
            }
            .resume()
    }
}

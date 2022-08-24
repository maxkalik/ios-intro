//
//  NetworkServiceError.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 8/22/22.
//

import Foundation

enum NetworkServiceError: Error {
    case apiError
    case endpointError
    case noData
    case decodeError
    case error(Error)
    
    var message: String {
        switch self {
        case .apiError:
            return "Something wrong with API"
        case .endpointError:
            return "Something wrong with endpoint"
        case .noData:
            return "No data"
        case .decodeError:
            return "Bad decoding"
        case .error(let error):
            return error.localizedDescription
        }
    }
}

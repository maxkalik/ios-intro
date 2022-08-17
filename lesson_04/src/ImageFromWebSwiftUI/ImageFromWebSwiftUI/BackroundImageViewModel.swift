//
//  BackroundImageViewModel.swift
//  ImageFromWebSwiftUI
//
//  Created by Maksim Kalik on 8/17/22.
//

import Foundation

class CacheService {
    // here we will store image data in cache
    // NSData - it's an object - reference type (from objc world)
    // Data - under the hood it's a struct - value type
    static let cache = NSCache<NSString, NSData>()
}

class BackgroundImageViewModel: ObservableObject {

    @Published var imageData: Data = Data()
    @Published var shouldShowError: Bool = false

    let imageURL = "https://images.unsplash.com/photo-1536431311719-398b6704d4cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80"

    func fetchImage() async {
        if let cachedImageData = CacheService.cache.object(forKey: "image") as? Data {
            print("Using a cached image")
            await MainActor.run {
                self.imageData = cachedImageData
            }
            return
        }
        do {
            guard let url = URL(string: imageURL) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            CacheService.cache.setObject(NSData(data: data), forKey: "image")
            await MainActor.run {
                self.imageData = data
            }
        } catch {
            await MainActor.run {
                self.shouldShowError = true
            }
        }
    }
}

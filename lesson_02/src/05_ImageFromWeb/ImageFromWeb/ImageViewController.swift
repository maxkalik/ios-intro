//
//  ImageViewController.swift
//  ImageFromWeb
//
//  Created by Maksim Kalik on 8/14/22.
//

import UIKit

class CacheService {
    // here we will store image in cache
    static let cache = NSCache<NSString, UIImage>()
}

final class ImageViewController: UIViewController {

    let imageURL = "https://images.unsplash.com/photo-1536431311719-398b6704d4cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80"
    
    // We need to be make sure that for fetching image from the web we don't use main thread
    private let utilityQueue = DispatchQueue.global(qos: .utility)

    // Anonymous closure
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    deinit {
        print("Deinit", self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        fetchImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = view.bounds
    }
    
    private func fetchImage() {
        
        if let cachedImage = CacheService.cache.object(forKey: "image") {
            print("Using a cached image")
            imageView.image = cachedImage
        } else {
            
            guard let url = URL(string: imageURL) else { return }
            
            utilityQueue.async {
                let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data = data, error == nil else {
                        return
                    }
                    
                    // Setting image should be in main thread
                    DispatchQueue.main.async {
                        guard let image = UIImage(data: data) else { return }
                        CacheService.cache.setObject(image, forKey: "image")
                        self.imageView.image = image
                    }
                }
                
                // Nobody in iOS world didn't know why we need to start the task implisitly like this
                dataTask.resume()
            }
        }
    }
}

//
//  ContentModel.swift
//  NavigationSwiftUI
//
//  Created by Maksim Kalik on 8/21/22.
//

import Foundation

struct ContentModel: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
            .lowercased()
            .capitalizingFirstLetter()
    }

    let articleContent =
    """
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
    
    At vero eos et accusam et justo duo dolores et ea rebum.
    
    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
    
    At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
    """
}

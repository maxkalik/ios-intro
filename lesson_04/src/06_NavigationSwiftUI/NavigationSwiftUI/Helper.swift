//
//  Helper.swift
//  NavigationSwiftUI
//
//  Created by Maksim Kalik on 8/21/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension ContentModel {
    static var dummy: ContentModel {
        ContentModel(imageName: "01", title: "Title")
    }
}

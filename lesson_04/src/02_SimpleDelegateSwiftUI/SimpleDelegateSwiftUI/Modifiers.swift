//
//  ButtonModifier.swift
//  SimpleDelegateSwiftUI
//
//  Created by Maksim Kalik on 8/15/22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.black)
            .cornerRadius(10)
    }
}

struct FullScreenModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension View {
    func fullScreen() -> some View {
        self.modifier(FullScreenModifier())
    }
}

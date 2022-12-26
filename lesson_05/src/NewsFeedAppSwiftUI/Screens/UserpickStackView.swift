//
//  UserpickStackView.swift
//  NewsFeedAppSwiftUI
//
//  Created by Maksim Kalik on 11/27/22.
//

import SwiftUI
import Kingfisher

struct UserpicStackView: View {

    var userpicURLs: [URL?] = []
    var width: CGFloat
    var onFailure: (() -> Void)?

    var body: some View {
        ZStack(alignment: .leading) {
            ForEach(Array(zip(userpicURLs.indices, userpicURLs)), id: \.0) { index, url in
                KFImage(url)
                    .resizable()
                    .cancelOnDisappear(true)
                    .onFailure { _ in onFailure?() }
                    .placeholder {
                        Image(uiImage: UIImage(named: "userpic_placeholder") ?? UIImage())
                            .resizable()
                            .scaledToFill()
                    }
                    .scaledToFill()
                    .frame(width: diameter(index: index), height: diameter(index: index))
                    .cornerRadius(diameter(index: index) / 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: diameter(index: index) / 2)
                            .stroke(.white, lineWidth: 2)
                    )
                    .offset(x: calculateOffset(index: index))
                    .zIndex(zIndex(index: index))
                    .transition(.fade(duration: 0.5))
            }
        }
        .frame(width: width, alignment: .leading)
    }

    private func calculateOffset(index: Int) -> CGFloat {
        let count = CGFloat(userpicURLs.count - 1)
        let restWidth = width - diameter(index: index)

        return restWidth / count * CGFloat(index)
    }

    private func diameter(index: Int) -> CGFloat {
        let diameter = userpicURLs.count > 2 ? 40 : 45
        return isMiddle(index: index) ? 50 : CGFloat(diameter)
    }

    private func isMiddle(index: Int) -> Bool {
        guard userpicURLs.count > 2 && userpicURLs.count % 2 == 1 else { return false }
        if userpicURLs.count > 3 {
            return userpicURLs.count / 2 == index
        } else {
            return index == 1
        }
    }

    private func zIndex(index: Int) -> Double {
        guard isMiddle(index: index) == false else {
            return Double(userpicURLs.count)
        }
        if index > userpicURLs.count / 2 {
            return Double(index)
        } else {
            return Double(userpicURLs.count - index)
        }
    }
}

extension AnyTransition {
    
    /// Fade-in transition
    static var fade: AnyTransition {
        let insertion = AnyTransition.opacity
        let removal = AnyTransition.identity
        return AnyTransition.asymmetric(insertion: insertion, removal: removal)
    }
    
    /// Fade-in transition with duration
    /// - Parameter duration: transition duration, use ease-in-out
    /// - Returns: A transition with duration
    static func fade(duration: Double) -> AnyTransition {
        let insertion = AnyTransition.opacity.animation(.easeInOut(duration: duration))
        let removal = AnyTransition.identity
        return AnyTransition.asymmetric(insertion: insertion, removal: removal)
    }
}

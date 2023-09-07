//
//  View+Hover.swift
//  Xplunger
//
//  Created by Michal on 05/09/2023.
//

import SwiftUI

extension View {
    func hoverEffect() -> some View {
        modifier(HoverEffect())
    }
}

struct HoverEffect: ViewModifier {
    @State var isHovering = false

    func body(content: Content) -> some View {
        content
            .background(isHovering ? Color.black.opacity(0.2) : Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .onHover {
                isHovering = $0
            }
    }
}

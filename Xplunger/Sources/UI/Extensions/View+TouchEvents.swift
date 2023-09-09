//
//  View+TouchEvents.swift
//  Xplunger
//
//  Created by Michal on 09/09/2023.
//

import SwiftUI

extension View {
    func emptySpaceIsTappable() -> some View {
        modifier(ReceiveTouchEvents())
    }
}

struct ReceiveTouchEvents: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.almostClear)
    }
}

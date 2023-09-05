//
//  View+ShortcutLabel.swift
//  Xplunger
//
//  Created by Michal on 05/09/2023.
//

import SwiftUI

extension View {
    func shortcutLabel(_ label: LocalizedStringKey) -> some View {
        modifier(ShortcutLabel(label: label))
    }
}

struct ShortcutLabel: ViewModifier {
    private let label: LocalizedStringKey
    
    init(label: LocalizedStringKey) {
        self.label = label
    }
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            Spacer()
            
            Text(label)
                .foregroundStyle(Color.black.opacity(0.5))
        }
    }
}

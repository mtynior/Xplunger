//
//  MenuRow.swift
//  Xplunger
//
//  Created by Michal on 05/09/2023.
//

import SwiftUI

struct MenuRow<Content: View>: View {
    private let alignment: HorizontalAlignment
    private let padding: EdgeInsets
    private let content: () -> Content
    
    init(
        alignment: HorizontalAlignment = .leading,
        padding: EdgeInsets = EdgeInsets(horizontal: Spacing.medium, vertical: Spacing.zero),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.alignment = alignment
        self.padding = padding
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: alignment) {
            content()
                .padding(padding)
        }
        .frame(minWidth: Spacing.zero, idealWidth: .infinity, maxWidth: .infinity, minHeight: Spacing.extraLarge2, alignment: .leading)
    }
}

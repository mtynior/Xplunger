//
//  Checkbox.swift
//  Xplunger
//
//  Created by Michal on 09/09/2023.
//

import SwiftUI

struct Checkbox<Content: View>: View {
    @Binding private var isSelected: Bool
    private let alignment: VerticalAlignment
    private let padding: EdgeInsets
    private let content: () -> Content
    
    init(
        isSelected: Binding<Bool>,
        alignment: VerticalAlignment = .center,
        padding: EdgeInsets = EdgeInsets(Spacing.zero),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isSelected = isSelected
        self.alignment = alignment
        self.padding = padding
        self.content = content
    }
    
    var body: some View {
        HStack(alignment: alignment) {
            Image(systemName: "checkmark")
                .opacity(isSelected ? 1 : 0)
            
            content()
                .padding(padding)
        }
        .fillParent(axis: .horizontal, alignment: .leading)
        .background(Color.white.opacity(0.01))
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

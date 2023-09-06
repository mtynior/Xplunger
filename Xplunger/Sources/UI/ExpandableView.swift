//
//  ExpandableView.swift
//  Xplunger
//
//  Created by Michal on 05/09/2023.
//

import SwiftUI


struct ExpandableView<Collapsed: View, Expanded: View>: View {
    @Binding private var isExpanded: Bool
    
    private let alignment: HorizontalAlignment
    private let padding: EdgeInsets
    private let collapsed: () -> Collapsed
    private let expanded: () -> Expanded
    
    init(
        isExpanded: Binding<Bool>,
        alignment: HorizontalAlignment = .leading,
        padding: EdgeInsets = EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8),
        @ViewBuilder collapsed: @escaping () -> Collapsed,
        @ViewBuilder expanded: @escaping () -> Expanded
    ) {
        self._isExpanded = isExpanded
        self.alignment = alignment
        self.padding = padding
        self.collapsed = collapsed
        self.expanded = expanded
    }
    
    var body: some View {
        VStack(alignment: alignment) {
            MenuRow(padding: .init(top: 0, leading: 0, bottom: 0, trailing: 0)) {
                HStack {
                    collapsed()
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isExpanded.toggle()
                            }
                        }
                }
            }
            
            if isExpanded {
                expanded()
                    .padding(padding)
            }
        }
        .animation(.easeOut, value: isExpanded)
    }
}

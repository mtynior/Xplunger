//
//  View+Extensions.swift
//  Xplunger
//
//  Created by Michal on 05/09/2023.
//

import SwiftUI

extension View {
    @ViewBuilder func fillParent(alignment: Alignment = .center) -> some View {
        self.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
    @ViewBuilder func fillParent(axis: Axis, alignment: Alignment = .center) -> some View {
        switch axis {
        case .horizontal: self.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, alignment: alignment)
        case .vertical: self.frame(minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: alignment)
        }
    }
}

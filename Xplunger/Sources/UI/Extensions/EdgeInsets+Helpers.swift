//
//  EdgeInsets+Helpers.swift
//  Xplunger
//
//  Created by Michal on 07/09/2023.
//

import SwiftUI

extension EdgeInsets {
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    init(_ all: CGFloat) {
        self.init(top: all, leading: all, bottom: all, trailing: all)
    }
}

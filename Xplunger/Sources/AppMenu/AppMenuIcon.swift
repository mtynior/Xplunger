//
//  AppMenuIcon.swift
//  Xplunger
//
//  Created by Michal on 09/09/2023.
//

import SwiftUI

struct AppMenuIcon: View {
    private let iconImage: NSImage?
        
    init() {
        let configuration = NSImage.SymbolConfiguration(pointSize: 16, weight: .black)
        let image = NSImage(named: "plunger")
        iconImage = image?.withSymbolConfiguration(configuration)
    }
    
    var body: some View {
        if let iconImage {
            Image(nsImage: iconImage)
        }
    }
}

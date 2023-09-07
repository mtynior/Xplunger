//
//  XplungerApp.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import SwiftUI

@main
struct XplungerApp: App {
    var body: some Scene {
        MenuBarExtra {
            AppMenu()
        } label: {
            let configuration = NSImage.SymbolConfiguration(pointSize: 16, weight: .black)
            let image = NSImage(named: "plunger")
            let updateImage = image?.withSymbolConfiguration(configuration)
            Image(nsImage: updateImage!)
        }
        .menuBarExtraStyle(.window)
    }
}

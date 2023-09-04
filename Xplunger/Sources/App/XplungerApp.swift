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
        MenuBarExtra("Xplunger", systemImage: "shower.fill") {
            AppMenu()
        }.menuBarExtraStyle(.window)
    }
}

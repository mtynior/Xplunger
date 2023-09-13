//
//  XplungerApp.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import SwiftUI

@main
struct XplungerApp: App {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        MenuBarExtra {
            AppMenu()
                .environmentObject(appCoordinator)
        } label: {
            AppMenuIcon()
                .onAppear(perform: appCoordinator.showDockIconIfNecessary)
        }
        .menuBarExtraStyle(.window)
        
        Settings {
            AboutScreen()
        }
    }
}

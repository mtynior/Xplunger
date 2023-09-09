//
//  AppCoordinator.swift
//  Xplunger
//
//  Created by Michal on 09/09/2023.
//

import AppKit

final class AppCoordinator: ObservableObject {
    func quit() {
        NSApplication.shared.terminate(nil)
    }
    
    func showDockIconIfNecessary() {
        if UserSettings.current.showDockIcon {
            NSApplication.shared.setActivationPolicy(.regular)
        }
    }
}

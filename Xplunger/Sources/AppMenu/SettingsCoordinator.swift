//
//  SettingsCoordinator.swift
//  Xplunger
//
//  Created by Michal on 09/09/2023.
//

import Foundation
import AppKit
import ServiceManagement
import OSLog

final class SettingsCoordinator: ObservableObject {
    private let logger = Logger(subsystem: "Xplunger", category: "SettingsCoordinator")
    
    @Published var showDockIcon: Bool {
        didSet {
            showDockIconDidChange(to: showDockIcon)
        }
    }
    
    @Published var launchAtLogin: Bool {
        didSet {
            launchAtLoginChanged(to: launchAtLogin)
        }
    }
    
    init() {
        self.showDockIcon = NSApplication.shared.activationPolicy() == .regular
        self.launchAtLogin = SMAppService.mainApp.status == .enabled
    }
}

private extension SettingsCoordinator {
    func launchAtLoginChanged(to isEnabled: Bool) {
        do {
            if isEnabled {
                if SMAppService.mainApp.status == .enabled {
                    try SMAppService.mainApp.unregister()
                }
                
                try SMAppService.mainApp.register()
            } else {
                try SMAppService.mainApp.unregister()
            }
        } catch {
            logger.error("Failed to \(isEnabled ? "enable" : "disable") launch at login: \(error.localizedDescription)")
        }
    }
    
    func showDockIconDidChange(to isVisible: Bool) {
        let policy: NSApplication.ActivationPolicy = isVisible ? .regular : .accessory
        NSApplication.shared.setActivationPolicy(policy)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            NSApplication.shared.windows.last?.orderFrontRegardless()
        }
    }
}

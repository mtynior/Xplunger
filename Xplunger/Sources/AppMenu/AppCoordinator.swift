//
//  AppCoordinator.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import Foundation
import AppKit
import OSLog

final class AppCoordinator: ObservableObject {
    private let processToKill = ["XCBBuildService", "SourceKitService", "lldb-rpc-server", "com.apple.dt.SKAgent", "swift-frontend"]
    private let shell = Shell()
    private let logger = Logger(subsystem: "Xplunger", category: "")

    @Published var isWorking: Bool
    
    init() {
        self.isWorking = false
    }
    
    func killXcodeBuildProcesses() {
        Task {
            DispatchQueue.main.async {
                self.isWorking = true
            }
            
            do {
                for processName in processToKill {
                    try await shell.executeCommand("killall -9 \(processName)")
                }
            } catch {
                logger.error("Failed to kill processes: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.isWorking = false
            }
        }
    }
    
    func quit() {
        NSApplication.shared.terminate(nil)
    }
}

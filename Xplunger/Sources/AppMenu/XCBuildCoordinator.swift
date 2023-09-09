//
//  XCBuildCoordinator.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import Foundation
import OSLog

final class XCBuildCoordinator: ObservableObject {
    private let processToKill = ["XCBBuildService", "SourceKitService", "lldb-rpc-server", "com.apple.dt.SKAgent", "swift-frontend"]
    private let shell = Shell()
    private let logger = Logger(subsystem: "Xplunger", category: "XCBuildCoordinator")

    @Published var isWorking: Bool = false
    
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
}

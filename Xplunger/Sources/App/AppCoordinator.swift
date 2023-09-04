//
//  AppCoordinator.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import Foundation
import AppKit

final class AppCoordinator: ObservableObject {
    private let processToKill = ["XCBBuildService", "SourceKitService", "lldb-rpc-server", "com.apple.dt.SKAgent", "swift-frontend"]
    private let processKiller = ProcessKiller()

    @Published var progress: Float = 0.0
    @Published var isWorking: Bool = false
    
    func killXcodeBuildProcesses() {
        Task {
            DispatchQueue.main.async {
                self.isWorking = true
            }
            
            do {
                for processName in processToKill {
                    //try await processKiller.killProcess(byName: processName)
                    Thread.sleep(forTimeInterval: 2)
                }
            } catch {
                print("[Error] \(error)")
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

//
//  ProcessKiller.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import Foundation

final class ProcessKiller {
    let shell = Shell()
    
    func killProcess(byName processName: String) async throws -> Void {
        try await shell.executeCommand("killall -9 \(processName)")
    }
}

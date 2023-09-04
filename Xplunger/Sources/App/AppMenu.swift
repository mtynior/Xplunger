//
//  MainView.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import SwiftUI

struct AppMenu: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: coordinator.killXcodeBuildProcesses) {
                    HStack(spacing: 8) {
                        Text("Kill Xcode Build Processes")
                        ProgressView()
                            .controlSize(.small)
                            .opacity(coordinator.isWorking ? 1 : 0)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(.plain)
                .disabled(coordinator.isWorking)
                .keyboardShortcut("q")
            }
            .frame(height: 18)
            
            Divider()
            
            Button(action: coordinator.quit) {
                Text("Quit")
                    .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.01))
            }
            .buttonStyle(.plain)
            .keyboardShortcut("q")
            .frame(height: 18)
        }
        .padding()
        .fixedSize(horizontal: true, vertical: false)
    }
}

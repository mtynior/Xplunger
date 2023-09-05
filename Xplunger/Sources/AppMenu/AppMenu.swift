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
            MenuRow {
                Text("Xplunger")
                    .fontWeight(.bold)
            }
            
            Divider()
            
            MenuRow {
                HStack {
                    Button(action: coordinator.killXcodeBuildProcesses) {
                        HStack(spacing: 8) {
                            Text("Kill Xcode Build Processes")
                            ProgressView()
                                .controlSize(.small)
                                .opacity(coordinator.isWorking ? 1 : 0)
                            
                        }
                        .shortcutLabel("⌘K")
                    }
                    .buttonStyle(.plain)
                    .disabled(coordinator.isWorking)
                    .keyboardShortcut("k")
                }
            }
            .hoverEffect()
            
            Divider()
            
            MenuRow {
                Button(action: coordinator.quit) {
                    Text("Quit")
                        .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)
                        .shortcutLabel("⌘Q")
                }
                .buttonStyle(.plain)
                .keyboardShortcut("q")
                .fillParent(axis: .horizontal)
            }
            .hoverEffect()
        }
        .padding(EdgeInsets(top: 10, leading: 4, bottom: 10, trailing: 4))
        .frame(width: 300)
    }
}

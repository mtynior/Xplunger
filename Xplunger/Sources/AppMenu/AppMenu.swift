//
//  MainView.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import SwiftUI

struct AppMenu: View {
    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var settingsCoordinator = SettingsCoordinator()
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading) {
            headerRow()
            
            divider()
            
            killProcessesRow()
            
            divider()
            
            launchAtLoginRow()
            
            divider()
            
            quitRow()
        }
        .padding(EdgeInsets(horizontal: Spacing.extraSmall, vertical: Spacing.standard))
        .frame(minWidth: 300)
    }
}

// MARK: - UI Helpers
private extension AppMenu {
    @ViewBuilder func headerRow() -> some View {
        MenuRow {
            Text("Xplunger")
                .fontWeight(.bold)
        }
    }
    
    @ViewBuilder func killProcessesRow() -> some View {
        MenuRow {
            Button(action: coordinator.killXcodeBuildProcesses) {
                HStack(spacing: Spacing.medium) {
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
        .hoverEffect()
    }
    
    @ViewBuilder func launchAtLoginRow() -> some View {
        MenuRow {
            Button(action: {
                settingsCoordinator.launchAtLogin.toggle()
            }, label: {
                if settingsCoordinator.launchAtLogin {
                    Image(systemName: "checkmark")
                        .font(.footnote)
                }
                
                Text("Launch at login")
                    .fillParent(axis: .horizontal, alignment: .leading)
            })
            .buttonStyle(.plain)
        }
        .hoverEffect()
    }
    
    @ViewBuilder func quitRow() -> some View {
        MenuRow {
            Button(action: coordinator.quit) {
                Text("Quit")
                    .fillParent(axis: .horizontal, alignment: .leading)
                    .shortcutLabel("⌘Q")
            }
            .buttonStyle(.plain)
            .keyboardShortcut("q")
        }
        .hoverEffect()
    }
    
    @ViewBuilder func divider() -> some View {
        Divider()
            .padding(.horizontal, Spacing.medium)
    }
    
    @ViewBuilder func selectedServicesRow() -> some View {
        ExpandableView(isExpanded: $isExpanded, collapsed: {
            Text("Services to kill:")
                .fontWeight(.medium)
        }, expanded: {
            VStack(alignment: .leading) {
                Text("XCBBuildService")
                Text("SourceKitService")
                Text("lldb-rpc-server")
                Text("com.apple.dt.SKAgent")
                Text("swift-frontend")
            }
        })
        .padding(.horizontal, Spacing.medium)
    }
}

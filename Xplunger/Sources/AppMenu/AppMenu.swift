//
//  MainView.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import SwiftUI

struct AppMenu: View {
    private enum Constants {
        static let menuMinWidth: CGFloat = 300
    }
    
    @StateObject private var xcbuildCoordinator = XCBuildCoordinator()
    @StateObject private var settingsCoordinator = SettingsCoordinator()
    @StateObject private var appCoordinator = AppCoordinator()
    
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
        .frame(minWidth: Constants.menuMinWidth)
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
            Button(action: xcbuildCoordinator.killXcodeBuildProcesses) {
                HStack(spacing: Spacing.medium) {
                    Text("Kill Xcode Build Processes")
                    
                    ProgressView()
                        .controlSize(.small)
                        .opacity(xcbuildCoordinator.isWorking ? 1 : 0)
                }
                .shortcutLabel("⌘K")
            }
            .buttonStyle(.plain)
            .disabled(xcbuildCoordinator.isWorking)
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
            Button(action: appCoordinator.quit) {
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
}

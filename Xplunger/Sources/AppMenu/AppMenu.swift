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
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.extraSmall) {
            headerRow()
            
            divider()
            
            killProcessesRow()
            
            divider()
            
            VStack(spacing: Spacing.zero) {
                launchAtLoginRow()
                
                showDockIconRow()
            }
            
            divider()
            
            aboutRow()
            
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
            Text("common.xplunger")
                .fontWeight(.bold)
        }
    }
    
    @ViewBuilder func killProcessesRow() -> some View {
        MenuRow {
            Button(action: xcbuildCoordinator.killXcodeBuildProcesses) {
                HStack(spacing: Spacing.medium) {
                    Text("xcbuild.kill_processes")
                    
                    ProgressView()
                        .controlSize(.small)
                        .opacity(xcbuildCoordinator.isWorking ? 1 : 0)
                }
                .shortcutLabel("⌘K")
                .emptySpaceIsTappable()
            }
            .buttonStyle(.plain)
            .disabled(xcbuildCoordinator.isWorking)
            .keyboardShortcut("k")
        }
        .hoverEffect()
    }
    
    @ViewBuilder func launchAtLoginRow() -> some View {
        MenuRow {
            Checkbox(isSelected: $settingsCoordinator.launchAtLogin) {
                Text("settings.launch_at_login")
            }
        }
        .hoverEffect()
    }
    
    @ViewBuilder func showDockIconRow() -> some View {
        MenuRow {
            Checkbox(isSelected: $settingsCoordinator.showDockIcon) {
                Text("settings.show_dock_icon")
            }
        }
        .hoverEffect()
    }
    
    @ViewBuilder func aboutRow() -> some View {
        MenuRow {
            Button(action: settingsCoordinator.openAboutWindow) {
                Text("common.about")
                    .fillParent(axis: .horizontal, alignment: .leading)
                    .emptySpaceIsTappable()
            }
            .buttonStyle(.plain)
            .keyboardShortcut("q")
        }
        .hoverEffect()
    }
    
    @ViewBuilder func quitRow() -> some View {
        MenuRow {
            Button(action: appCoordinator.quit) {
                Text("common.quit")
                    .fillParent(axis: .horizontal, alignment: .leading)
                    .shortcutLabel("⌘Q")
                    .emptySpaceIsTappable()
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

//
//  MainView.swift
//  Xplunger
//
//  Created by Michal on 04/09/2023.
//

import SwiftUI

struct AppMenu: View {
    @StateObject private var coordinator = AppCoordinator()
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading) {
            MenuRow {
                Text("Xplunger")
                    .fontWeight(.bold)
            }
            
            Divider()
                .padding(.horizontal, Spacing.medium)
            
            MenuRow {
                HStack {
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
            }
            .hoverEffect()
            
            Divider()
                .padding(.horizontal, Spacing.medium)
            
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
            
            Divider()
                .padding(.horizontal, Spacing.medium)
            
            MenuRow {
                Button(action: coordinator.quit) {
                    Text("Quit")
                        .fillParent(axis: .horizontal, alignment: .leading)
                        .shortcutLabel("⌘Q")
                }
                .buttonStyle(.plain)
                .keyboardShortcut("q")
                .fillParent(axis: .horizontal)
            }
            .hoverEffect()
        }
        .padding(EdgeInsets(horizontal: Spacing.extraSmall, vertical: Spacing.standard))
        .frame(minWidth: 300)
    }
}

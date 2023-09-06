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
                .padding(.horizontal, 8)
            
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
                .padding(.horizontal, 8)
            
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
            .padding(.horizontal, 8)
            
            Divider()
                .padding(.horizontal, 8)
            
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
        .frame(minWidth: 300)
    }
}

//
//  AboutScreen.swift
//  Xplunger
//
//  Created by Michal on 13/09/2023.
//

import SwiftUI

struct AboutScreen: View {
    private let currentEnvironment = AppEnvironment.current
    
    var body: some View {
        VStack(spacing: Spacing.extraLarge4) {
            VStack(spacing: Spacing.small) {
                Image("Logo")
                    .resizable()
                    .frame(width: 128, height: 128)
                
                Text("\(currentEnvironment.appName) \(currentEnvironment.appVersion) (\(currentEnvironment.buildNumber))")
                    .font(.system(size: 12))
            }
            
            Text("about.description")
                .font(.system(size: 14))
            
        }
        .padding(Spacing.large)
        .frame(width: 400)
        .navigationTitle("common.about")
    }
}

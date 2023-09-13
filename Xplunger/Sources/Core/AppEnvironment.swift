//
//  AppEnvironment.swift
//  Xplunger
//
//  Created by Michal on 13/09/2023.
//

import Foundation

final class AppEnvironment {
    static let current = AppEnvironment()
    
    var appName: String {
        Bundle.main.infoDictionary!["CFBundleName"] as? String ?? ""
    }
    
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }
    
    var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
    }
}

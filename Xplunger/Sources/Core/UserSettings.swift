//
//  UserSettings.swift
//  Xplunger
//
//  Created by Michal on 09/09/2023.
//

import Foundation
import AppKit

final class UserSettings {
    enum Keys {
        static let showDockIcon = "showDockIcon"
    }
    
    let defaults: UserDefaults = UserDefaults.standard
    
    static let current: UserSettings = UserSettings()
   
    var showDockIcon: Bool {
        get {
            return defaults.bool(forKey: Keys.showDockIcon)
        }
        set {
            defaults.set(newValue, forKey: Keys.showDockIcon)
        }
    }
}
